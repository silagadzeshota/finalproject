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
<title>Quiz</title>
</head>
<body>

<script>

function Check() {	
    document.getElementById("demo").innerHTML = "Hello World";    
}


</script>



<%!
	
  	  	
%>


	<%

while (true) {
		
		

		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT questiontype,question,correct,ans1,ans2,ans3,ans4 FROM questions WHERE id="+(String)request.getAttribute("current"));			
	  		ResultSet result=statement.executeQuery();
	  		
			while (result.next()) {
				int a=result.getInt("questiontype");			
				String b=result.getString("question");
				String c=result.getString("correct");				
				String d=result.getString("ans1");				
				String e=result.getString("ans2");				
				String f=result.getString("ans3");				
				String g=result.getString("ans4");
					
				
				if (a==1){
					%>
					 Please answer the following question:
					 <br>
					 <br>
					 <%
					 
					 out.print(b);
					 
					 %>		 
					 <br>
					 <br>
					 <form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
					 <input type="text" name="myanswer" >		 
					 <button type="button" name="submitbutton" value="submit" onclick="Check()"></button>
					 			 			 
					</form>		
					<br>
					<br>
					<%
				}else
				if (a==2){
					%>
					 Please fill in the blank:
					 <br>
					 <br>
					 <%
					 
					 out.print(b);
					 
					 %>		 
					<br>
					<br>
					<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
					<input type="text" name="myanswer">		 
					<input type="submit" name="submitbutton" value="submit">			 		 
					</form>		
					<br>
					<br>
					<%
				}else
				if (a==3){
					%>
					Please select the correct answer:
					<br>
					<br>
					<% 
					
					out.print(b);
					
					%>
						<br>
						<br>		
								
					<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
					<input type="radio" id="1" name="quiz" value=<% out.print(d); %> checked> <% out.print(d); %><br>
					<input type="radio" id="2" name="quiz" value=<% out.print(e); %>> <% out.print(e); %><br>  
					<input type="radio" id="3" name="quiz" value=<% out.print(f); %>> <% out.print(f); %> <br>
					<input type="radio" id="4" name="quiz" value=<% out.print(g); %>> <% out.print(g); %><br>
					 <input type="submit" name="submitbutton" value="submit">			 
					</form>
					<%
				}else{
								
					
				}			
			
				
				
			}			
		}catch (Exception e) {System.out.println(e);} 
		
		
		
		
		
		
		if(request.getAttribute("current").equals(request.getAttribute("final"))) {
			break;	
		}
		
	}

		

	%>


</body>











</html>