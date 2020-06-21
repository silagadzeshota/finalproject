<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<style>
input[type="text"]
{
    background: transparent;
    border: 0.2;
 
}

body {
    background-image: url("http://www.intrawallpaper.com/static/images/3d-nature-hd-free-wallpaper-backgrounds.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
}

#header {
    
    color:yellow;
    text-align:center;
    padding:0.003px;
}
#nav {
   
     text-align:center;
   

}

#footer {
    background-color:blue;
    color:white;
    clear:both;
    text-align:center;
    padding:5px;
}

.button {
     background-color: Transparent;
    border: none;
    color: white;
    padding: 5px 0.23px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 0.1px 0.01px;
    cursor: pointer;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>
<body>

<div id="header">
<h1>Welcome</h1>
</div>


<div id="nav">

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizManager" method="get">
  <input class="button" type="submit"  value="Take a quiz" >
</form>





<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/FriendRequestManager" method="get">

  <input  class="button" type="submit" value="Friends' requests" >
</form>


<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/FriendListManager" method="get">

  <input class="button" type="submit" value="My Friends" >
</form>

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/CheckNewMails" method="get">
  <input class="button" type="submit" value="Check My Mail" >
</form>




<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/CreateQuizManager" method="get">
  <input  class="button" type="submit" value="Create Quiz" >
</form>


<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/AddingFriend" method="post">
  
  

   
  <div style="color: #FF0000;">${errorMessage}</div>
  
  
  <input class="button" type="submit" value="Add friend">
  <input type="text" name="Friend" >
  <br><br>

</form> 


<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input  class="button" type="submit" value="Log Out" >
</form>
</div>






</body>
</html>