package database;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/chat")
public class ChatEndpoint {
	private static final String MESSAGE_TYPE = "message";
	private static final String JOIN_TYPE = "join";
	
	// Maps store connected sessions and usernames. The keys are session ids.
	private static final Map<String, Session> peers = Collections.synchronizedMap(new HashMap<String, Session>());
	private static final Map<String, String> peerNames = Collections.synchronizedMap(new HashMap<String, String>());
	 
	
	@OnOpen
	public void open(Session peer) {
		// Add connected session
		peers.put(peer.getId(), peer);
	}
	
	@OnClose
	public void close(Session peer) throws IOException {
		String name = peerNames.get(peer.getId()); 
		peers.remove(peer.getId());
		peerNames.remove(peer.getId());
		broadcast(name + " left chat.");
	}
	
    @OnMessage
    public void message(String message, Session peer) throws IOException, EncodeException {
    	System.out.println("received: " + message);
    	
    	String[] input = message.split(":");
    	if (input.length < 2) return;
    	
    	String id = peer.getId();
    	String messageToBroadcast = "";
    	
    	// There are two available operations. Either join, or send message
    	String type = input[0]; 
    	String data = input[1];
    	if (type.equals(MESSAGE_TYPE)) {
    		String name = peerNames.get(id);
    		messageToBroadcast = name + " says: " + data;
    	} else if (type.equals(JOIN_TYPE)) {
    		peerNames.put(id, data);
    		messageToBroadcast = data + " joined the chat.";
    	}
    	
    	broadcast(messageToBroadcast);
    }
    
    
    public void broadcast(String message) throws IOException{
    	// send message to all clients
        for (Session client : peers.values()) {
        	if (client.isOpen()) {
        		client.getBasicRemote().sendText(message);
        	}
        }
    }
    
}