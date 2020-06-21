<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
</head>
<body>



<h1><%String EnteredName = request.getParameter("User name");
out.print("The Name "+EnteredName); out.print(" is Already in Use");%></h1>

<p>Please enter another name and password.</p>


<form action="http://localhost:8080/WebProject/CreatingAccount" method="post">
  User Name:
  <input type="text" name="User name" value="">
  <br>
  Password:
  <input type="text" name="Password" value="">
  
  <input type="submit" value="Login">
  <br><br>
  
</form>



</body>
</html>