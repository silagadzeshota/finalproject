<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>


body {
    background-image: url("https://extension.org/wp-content/uploads/2015/03/canstockphoto8172384.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
}
input[type="text"]
{
    background: transparent;
    border: 0.2;
 
}

#header {
    
    color:white;
    text-align:center;
    padding:0.003px;
}



</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Question</title>
</head>
<body>

<div id="header">

<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/SaveQuestion" method="post">



  <input type="radio" id="1" name="quiz" value="1" checked> Question-Response <br>
  <input type="radio" id="2" name="quiz" value="2"> Fill in the Blank <br>  
  <input type="radio" id="3" name="quiz" value="3"> Multiple Choice <br>
  <input type="radio" id="4" name="quiz" value="4"> Picture-Response Questions <br>
  <br><br>  




Please enter the question (or the link to the image)<input type="text" name="question" value="">
<br>
<br>



Correct answer <input type="text" name="answer" value="">
<br>

Please enter the answer (if applicable) <input type="text" name="answer1" value="">
<br>

Please enter the answer(if applicable) <input type="text" name="answer2" value="">
<br>

Please enter the answer(if applicable) <input type="text" name="answer3" value="">
<br>
Please enter the answer(if applicable) <input type="text" name="answer4" value="">


<br>
<br>


	<input type="submit" value="Create" >
	

</form>

	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/FinishCreation" method="get">
	<input type="submit" value="Finish Creation" name="finish" >
	</form>

</div>
</body>
</html>