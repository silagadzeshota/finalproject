<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

body {

    background-image: url("http://usmanmohl.com/jQuery/Lightbox/images/foresttrees.jpg");
    background-repeat: no-repeat;
    background-attachment: fixed;
}

#header {
    
    color:white;
    text-align:center;
    padding:0.003px;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

</head>
<body>

<div id="header">


<h1>WELCOME</h1>
 <div style="color: #FF0000;">${errorMessage}</div>
<p>Please log in:</p>

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/WelcomeServlet" method="post">
  <h2>User Name:</h2> 
  <input type="text" name="User name" value="">
  <br>
  <br>
  <h2>Password:</h2> 
  <input type="password" name="Password" value="">
<br>  
  <input type="submit" value="Login">
  <br><br>
  <a href="http://localhost:8080/laksndlkasnbfslkasdfnlk/CreateAccount">Create New Account</a>
</form>


</div> 

</body>
</html>