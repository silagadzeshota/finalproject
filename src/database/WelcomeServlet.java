package database;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class WelcomeServlet
 */
@WebServlet("/WelcomeServlet")
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> array=new ArrayList<String>();
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WelcomeServlet() {
        super();
        return;
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		String button = request.getParameter("home");
		if (button!=null) {	
			RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/HomePage.jsp");
			dispatch.forward(request, response);
			return;
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/WelcomePage.jsp");
		dispatch.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final char[] CHARS = "abcdefghijklmnopqrstuvwxyz0123456789.,-!".toCharArray();	
		// TODO Auto-generated method stub
		String EnteredName = request.getParameter("User name");
		String EnteredPassword=request.getParameter("Password");
		array.clear();
		
		
		String init="";
		for(int k=0;k<EnteredPassword.length();k++) {
			for(int j=0;k<CHARS.length;j++) {
				if (EnteredPassword.charAt(k)==CHARS[j]) {
					init+=j;
					break;
				}
			}
		}
		byte[] pas=hexToArray(init);
		byte[] hashedpas = null;
		try {
			hashedpas = HashFunction(pas);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		String stringedpas=hexToString(hashedpas);
		
		
		
		
	
		if (CheckUserExistence(EnteredName,stringedpas)) {
			HttpSession session = request.getSession();
			session.setAttribute("name",EnteredName);			
			request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);			
		} else {
			request.setAttribute("errorMessage", "Login or password is incorrect, please try again");
			request.getRequestDispatcher("/WEB-INF/WelcomePage.jsp").forward(request, response);
		}
		
	}
	private boolean CheckUserExistence(String name,String pass){
		try {		
			
			//System.out.println(name);
			//System.out.println(pass);
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT login,password FROM users WHERE login =" + "'" + name + "'"+" AND password="+"'"+pass+"'");			
			ResultSet result=statement.executeQuery();		
			while (result.next()) {
				return true;
			}
			return false;
			
		}catch (Exception e) {System.out.println(e);} 		
		return true;
	}
	
	
	
	
	public static byte[] hexToArray(String hex) {
		byte[] result = new byte[hex.length()/2];
		for (int i=0; i<hex.length(); i+=2) {
			result[i/2] = (byte) Integer.parseInt(hex.substring(i, i+2), 16);
		}
	
		return result;
	}
	
	public static byte[] HashFunction(byte[] line) throws NoSuchAlgorithmException {
		MessageDigest dm=MessageDigest.getInstance("SHA");
		byte[] res=dm.digest(line);
		dm.update(res);
		return res;	
	}
	
	public static String hexToString(byte[] bytes) {
		StringBuffer buff = new StringBuffer();
		for (int i=0; i<bytes.length; i++) {
			int val = bytes[i];
			val = val & 0xff;  // remove higher bits, sign
			if (val<16) buff.append('0'); // leading 0
			buff.append(Integer.toString(val, 16));
		}
		return buff.toString();
	}



}
