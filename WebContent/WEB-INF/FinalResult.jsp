<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

#header {
    background-color:blue;
    color:white;
    text-align:center;
    padding:0.003px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
</head>
<body>
<div id="header" >
YOU GOT THE SCORE:
<br>
<%
out.print(request.getAttribute("mypoints"));

%>
<br>
OUT OF:
<br>
<%
out.print(request.getAttribute("totalpoints"));
%>
<br>
Total time: <% out.print(session.getAttribute("timeelapsed")); %> Seconds.

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizManager" method="get">
  <input class="button" type="submit"  value="Take a quiz" >
</form>

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk//WelcomeServlet" method="get">
  <input type="submit" name="home" value="Home" >
</form> 

</div>
</body>
</html>