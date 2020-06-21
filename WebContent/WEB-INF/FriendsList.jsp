<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@  page 
import="java.sql.PreparedStatement,database.Main,java.sql.ResultSet,java.util.ArrayList,java.sql.PreparedStatement,
javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServlet,javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.SQLException"
 
%> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Friends</title>
<style>


body {
    background-image: url("http://www.planwallpaper.com/static/images/nature_backgrounds_wonderful_edition_photo_hq_7051.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
}




#header {

    color:white;
    text-align:center;
    
    padding:0.003px;
}

.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 5px 0.23px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


</style>

</head>
<body>

	
<div id="header">


	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" name="home" value="Home" >
</form> 

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
</form>


</div>


<%!
  	
  	ArrayList<String> getRequests(String name) {
  		ArrayList<String> reqinfo = new ArrayList<String>();  		
		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT friendname FROM friends WHERE name =" + "'" + name + "'");			
	  		ResultSet result=statement.executeQuery();	
			while (result.next()) {
				 reqinfo.add(result.getString("friendname"));			
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
		 <form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/FriendListManager" method="post">
		 <input class="button" type="submit" name="delete" value="Delete Friend">		 
		 <input type="hidden" name="requester" value="<% out.print(s); %>">		 
		</form>
		
		<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/MailingSystemManager" method="get">
		<input class="button" type="submit" name="delete" value="ChatWithFriend">		 
		 <input  type="hidden" name="requester" value="<% out.print(s); %>">
		</form>
		
		<%		
	}		
	%>



</body>
</html>