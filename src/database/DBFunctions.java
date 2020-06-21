package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
public class DBFunctions {
	
	public static void addNewPair(String s,String r) throws SQLException, Exception{
		PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO notifications(sender,receiver,checkthis) VALUES("+"'"+s+"', '"+r+"', '"+"0"+"')");				
		statement.executeUpdate();
	}
	
	
	public static void addNotifications(String s,String r) throws SQLException, Exception{
		PreparedStatement statement =Main.getConnection().prepareStatement("UPDATE notifications SET checkthis = 1 WHERE sender="+"'"+s+"' AND "+"receiver='"+r+"'");				
		statement.executeUpdate();
	}
	
	public static void deleteRequest(String s,String r) throws Exception{	
		PreparedStatement statement =Main.getConnection().prepareStatement("DELETE FROM requests WHERE sender="+"'"+s+"' AND "+"receiver='"+r+"'");				
		statement.executeUpdate();					
	}
	
	public static void addRequest(String s,String r) throws Exception{	
		PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO requests(sender,receiver) VALUES("+"'"+s+"', '"+r+"')");				
		statement.executeUpdate();			
	}
	
	public static void insertNewQuiz(String creator,int randomized,String description,String prac) throws Exception{
		
		PreparedStatement statement1 =Main.getConnection().prepareStatement("SELECT id FROM quizes");					
		ResultSet rs=statement1.executeQuery();
		int quiznum=1;
		while (rs.next()) quiznum++;		
		
		
		PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO quizes(id,creator,randomized,description,practiceallowed) VALUES("+"'"+quiznum+"', '"+creator+"', '"+randomized+"', '"+description+"', '"+prac+"')");				
		statement.executeUpdate();			
	}
	
	public static void addQuestion(String questionType,String question,String correctAnswer,String ans1,String ans2,String ans3,String ans4) throws Exception{	

			
		PreparedStatement statement =Main.getConnection().prepareStatement("SELECT id FROM quizes");					
		ResultSet rs=statement.executeQuery();
		int quiznum=1;
		while (rs.next()) quiznum++;		
		
		PreparedStatement statement1 =Main.getConnection().prepareStatement("INSERT INTO questions(questiontype,quiznumber,question,correct,ans1,ans2,ans3,ans4) VALUES('"+questionType+"', '"+quiznum+"', '"+question+"', '"+correctAnswer+"', '"+ans1+"', '"+ans2+"', '"+ans3+"', '"+ans4+"')");				
		statement1.executeUpdate();			
	}
	
	public static int checkAnswer(String myanswer,String id) throws SQLException, Exception {
		PreparedStatement statement =Main.getConnection().prepareStatement("SELECT questiontype,correct,ans1,ans2,ans3,ans4 FROM questions WHERE id="+id);					
		ResultSet rs=statement.executeQuery();
		while(rs.next()){
			int type=rs.getInt("questiontype");
			String a=rs.getString("correct");
			if (a.equals(myanswer))
				return 1;
			if (type!=3){
				a=rs.getString("ans1");
				if (a.equals(myanswer))
					return 1;
				a=rs.getString("ans2");
				if (a.equals(myanswer))
					return 1;
				a=rs.getString("ans3");
				if (a.equals(myanswer))
					return 1;
				a=rs.getString("ans4");
				if (a.equals(myanswer))
					return 1;
			}
		}
		return 0;
	}
	
	public static void deleteFriendship(String f1,String f2) throws Exception{
		
		PreparedStatement statement =Main.getConnection().prepareStatement("DELETE FROM friends WHERE name="+"'"+f1+"' AND "+"friendname='"+f2+"'");
		
		statement.executeUpdate();
		statement =Main.getConnection().prepareStatement("DELETE FROM friends WHERE name="+"'"+f2+"' AND "+"friendname='"+f1+"'");				
		statement.executeUpdate();	
	}
	
	public static boolean requestExists(String s,String r) throws Exception{	
		
		System.out.println(s+" "+r);		
		PreparedStatement statement =Main.getConnection().prepareStatement("SELECT * FROM requests WHERE sender="+"'"+s+"' AND "+"receiver='"+r+"'");					
		ResultSet result=statement.executeQuery();		
		while (result.next()) {
			return true;
		}
		return false;
			
	}
	public static boolean revRequestExists(String s,String r) throws Exception{	
		
		PreparedStatement statement =Main.getConnection().prepareStatement("SELECT * FROM requests WHERE sender="+"'"+r+"' AND "+"receiver='"+s+"'");					
		ResultSet result=statement.executeQuery();		
		while (result.next()) {
			return true;
		}
		return false;
			
	}
	public static boolean alreadyFriends(String s,String r) throws Exception{	
		
		PreparedStatement statement =Main.getConnection().prepareStatement("SELECT * FROM friends WHERE name="+"'"+r+"' AND "+"friendname='"+s+"'");					
		ResultSet result=statement.executeQuery();		
		while (result.next()) {
			return true;
		}
		return false;
			
	}
	
	
	
	public static void addFriendship(String f1,String f2) throws Exception{
		if (alreadyFriends(f1,f2)) return;
		PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO friends(name,friendname) VALUES("+"'"+f1+"', '"+f2+"')");				
		statement.executeUpdate();
		statement =Main.getConnection().prepareStatement("INSERT INTO friends(name,friendname) VALUES("+"'"+f2+"', '"+f1+"')");				
		statement.executeUpdate();	
	}
	

	public static void addingActivity(String qid,String pts,String user,int time) throws Exception{
		
		PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO activitylog(taker,points,timing,quizid) VALUES("+"'"+user+"', '"+pts+"', '"+Integer.toString(time)+"', '"+qid+"')");				
		statement.executeUpdate();
			
	}


	public static void deletePair(String s, String r) throws SQLException, Exception {
		PreparedStatement statement =Main.getConnection().prepareStatement("DELETE FROM notifications WHERE sender="+"'"+s+"' AND "+"receiver='"+r+"'");
		statement.executeUpdate();
	}


	public static void removeNotification(String s, String r) throws SQLException, Exception {
		PreparedStatement statement =Main.getConnection().prepareStatement("UPDATE notifications SET checkthis = 0 WHERE sender="+"'"+s+"' AND "+"receiver='"+r+"'");				
		statement.executeUpdate();
	}
	
	
	
	
	
}
