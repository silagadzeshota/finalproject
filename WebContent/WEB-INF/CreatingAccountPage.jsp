<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>


#header {
    background-color:yellow;
    color:black;
    text-align:center;
    padding:0.003px;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creating Account</title>
</head>

<body>
<div id="header">

<h1>Create New Account</h1>
<div style="color: #FF0000;">${errorMessage}</div>
<p>Please enter proposed name and password.</p>



<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/CreateAccount" method="post">
  User Name:
  <input type="text" name="User name" value="">
  <br>
  Password:
  <input type="password" name="Password" value="">
  <br>
  <input type="submit" value="Login">
  
  <br><br>
  
</form>
<br>
<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" value="Log Out" >
 
</form>	


</div>
</body>
</html>