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
<title>Send Mail</title>

<style>
input[type="text"]
{
    background: transparent;
    border: 0.2;
 
}
body{
 background-image: url("http://www.planwallpaper.com/static/images/Alien_Ink_2560X1600_Abstract_Background_1.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;

}

#header {
    color:white;
    text-align:center;
    padding:0.003px;
}


#footer {
    color:white;
    clear:both;
    text-align:center;
    padding:5px;
}

</style>


</head>
<body>


<%!

		ResultSet result;
        ResultSet getRequests(String name,String rec) {
  		ArrayList<String> reqinfo = new ArrayList<String>();  		
		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT * FROM mailingtable WHERE (sender="+"'"+name+"' AND "+"receiver='"+rec+"') OR (sender="+"'"+rec+"' AND "+"receiver='"+name+"')");					
			result=statement.executeQuery();	
			return result;			
		}catch (Exception e) {System.out.println(e);} 

		
  		return result;
  		
  		
  		
  	}	
	%>


	<%
	String thisname=(String) session.getAttribute("name");
	String rec=(String) session.getAttribute("receiver");
	
	ResultSet result=getRequests(thisname,rec);
	
	
		
		%>
		
<div id="header">				
	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
  <input type="submit" name="home" value="Home" >
</form>		
</div>

	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/MailingSystemManager" method="post">
	

<textarea id="inputdisplay" rows="17" cols="120"><%
	
	while (result.next()) {
	
		out.print(result.getString("sender")+": "+result.getString("messages")+"\n");		
		
	}
	
	
	
	%></textarea>
	<br>
	<input type="submit" value="Send" >
	<br>
	<input type="text" id="textdisplay" name="teqsti" size="60"/>

	</form>
	
	

<div id="footer">
<%
out.print(session.getAttribute("name"));
%>

</div>
	













    	 



</body>
</html>