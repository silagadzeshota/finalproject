<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

body {
   background-image: url("http://pad2.whstatic.com/images/thumb/6/62/Let-Go-of-a-Bad-Friendship-Step-01.jpg/aid1206358-728px-Let-Go-of-a-Bad-Friendship-Step-01.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
}
</style>
<%@  page 
import="java.sql.PreparedStatement,database.Main,java.sql.ResultSet,java.util.ArrayList,java.sql.PreparedStatement,
javax.servlet.http.HttpServletRequest,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpSession,javax.servlet.http.HttpServlet,javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,javax.servlet.RequestDispatcher,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.SQLException,javax.servlet.RequestDispatcher,javax.servlet.ServletException"
 
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

  	<%!
  	
  	ArrayList<String> getRequests(String name) {
  		ArrayList<String> reqinfo = new ArrayList<String>();  		
		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT sender FROM requests WHERE receiver =" + "'" + name + "'");			
	  		ResultSet result=statement.executeQuery();	
			while (result.next()) {
				 reqinfo.add(result.getString("sender"));			
			}			
		}catch (Exception e) {System.out.println(e);} 

		
  		return reqinfo;
  		
  		
  		
  	}
  	
  	
  	
	%>

	<%
	String thisname=(String) session.getAttribute("name");
	ArrayList<String> reqs=getRequests(thisname);
	for (String s : reqs) {
		out.println(s);
		
		%>		
		 <form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/FriendRequestManager" method="post">
		 <input type="submit" name="accept" value="Accept">		
		 <input type="hidden" name="requester" value="<% out.print(s); %>">
		</form>
    	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/FriendRequestManager" method="get">
    	 <input type="submit" name="decline" value="Decline">
    	 <input type="hidden" name="requester" value="<% out.print(s); %>">
    	</form>
		<%
		
		
	}	
	
	%>

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" name="home" value="Home" >
</form>


<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
</form>

</body>
</html>