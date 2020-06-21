<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> <%String EnteredName = request.getParameter("User name");
out.print("Welcome "+EnteredName); %></title>
</head>
<body>

<h1><%EnteredName = request.getParameter("User name");
out.print("Welcome "+EnteredName); %></h1>

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
</form>

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
</form>
</body>
</html>