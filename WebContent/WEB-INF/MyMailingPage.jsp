<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

body {
    background-image: url("http://thumbs.dreamstime.com/z/e-mail-background-21551423.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
}

#header {

    color:black;
    text-align:center;
    
    padding:0.003px;
}
</style>


<%@  page 
import="java.sql.PreparedStatement,database.Main,java.sql.ResultSet,java.util.ArrayList,java.sql.PreparedStatement,
javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServlet,javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.SQLException"
 
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mail</title>
</head>
<body>
<div id="header">

	<%!
		class notification{
			String sender;
			String receiver;
			public notification(String s,String r){
				sender=s;
				receiver=r;
			}
		}
	
		ArrayList<notification> getNotifications(String user){
			ArrayList <notification> res=new ArrayList<notification>();
			try{
				PreparedStatement statement =Main.getConnection().prepareStatement("SELECT sender,receiver FROM notifications WHERE checkthis=1 AND receiver="+"'"+user+"'");					
				ResultSet rs=statement.executeQuery();
				while(rs.next()){
					notification q=new notification(rs.getString("sender"),rs.getString("receiver"));
					res.add(q);
				}	
			}catch (Exception e) {System.out.println(e);} 
			return res;
		}
	
	%>

	<%
		String user=(String)request.getAttribute("myname");
		ArrayList<notification> myNot=getNotifications(user);
		int z=0;
		for (notification s:myNot){
			out.print("You have new mail from "+s.sender);
			%>	
				<br>
				<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/MailingSystemManager" method="get">
				<input class="button" type="submit" name="delete" value="ChatWithFriend">		 
		 		<input  type="hidden" name="requester" value="<% out.print(s.sender); %>">
				</form>
				<br>
			<%
			z=1;
		}
		if (z==0) {
			%> 
			<h1> You have no new notifications ! </h1>
			<%
		}
		
		%> 
		
	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" name="home" value="Home" >
</form> 

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
  </form>
  
		<%
		
	%>
	</div>
</body>
</html>