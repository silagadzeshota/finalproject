package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

public class Main {

	/**
	 * @param args
	 * @throws Exception 
	 */
	private static Connection conn;
	
	public static void main(String[] args) throws Exception {


	
	
	}
	
	
	private static void requests() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS requests(id int NOT NULL AUTO_INCREMENT, sender varchar(255),receiver varchar(255),PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("SendRequestCreated");}	
	}
	
	public static void createNotificationTable() throws SQLException{
		try{
			conn=getConnection();
			PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS notifications (id int NOT NULL AUTO_INCREMENT, sender varchar(255),receiver varchar(255),checkthis int,PRIMARY KEY(id))");
			create.executeUpdate();
			conn.close();
			} catch (Exception e) {System.out.println(e);} 
			finally {
				conn.close();
				System.out.println("Notifications created");}
	}
	
	private static void createFriendsTable() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS Friends(id int NOT NULL AUTO_INCREMENT, name varchar(255),friendname varchar(255),PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("Friends Created");}	
	}
	
	private static void quizInformationTable() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS Quizes(id int NOT NULL , creator varchar(255), randomized int,practiceallowed int,description varchar(255), PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("Friends Created");}	
	}
	

	private static void createAchievementTable() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS activitylog(id int NOT NULL AUTO_INCREMENT, taker varchar(255), points int,timing int,quizid int, PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("Created activity");}	
	}
	
	
	
	private static void createQuestions() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS questions(id int NOT NULL AUTO_INCREMENT, questiontype varchar(2),quiznumber INT, question varchar(255),correct varchar(255), ans1 varchar(255),ans2 varchar(255),ans3 varchar(255),ans4 varchar(255),PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("Questions Created");}	
	}
	
	
	private static void createChatTable() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS chat(id int NOT NULL AUTO_INCREMENT, name varchar(255),friendname varchar(255),chattext TEXT,PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("create Chat");}	
	}


	

	private static void createMailingTable() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS mailingTable(id int NOT NULL AUTO_INCREMENT, sender varchar(255),receiver varchar(255),messages TEXT, created DATETIME, PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("Messaging Created");}	
	}
	
	private static void CreateUserTable() throws SQLException {
		try{
		conn=getConnection();
		PreparedStatement create =conn.prepareStatement("CREATE TABLE IF NOT EXISTS users(id int NOT NULL AUTO_INCREMENT, login varchar(255),password varchar(255),PRIMARY KEY(id))");
		create.executeUpdate();
		conn.close();
		} catch (Exception e) {System.out.println(e);} 
		finally {
			conn.close();
			System.out.println("CREATED USERS");}	
	}
	
	public static Connection getConnection() throws Exception{
		try{
			String driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost:3306/quizdb";
			String username="root";
			String password="maxpaynemaxpayne123";
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,username,password);
		
			return conn;
			
		} catch (Exception e) {
			System.out.println("SDDS");
			System.out.println(e);
		}		
		return null;		
	}
	

}
