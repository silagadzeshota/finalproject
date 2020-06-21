<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>


body {
    background-image: url("http://cdn.wonderfulengineering.com/wp-content/uploads/2014/07/background-wallpapers-32.jpg");
     background-repeat: no-repeat;
    background-attachment: fixed;
}




#header {

    color:white;
    text-align:center;
    
    padding:0.003px;
}


#headerr {

    color:red;
    text-align:center;
    
    padding:0.003px;
}

.button {
    background-color: transparent;
    border: 1px;
    color: red;
    padding: 5px 0.23px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}


</style>

<%@  page 
import="java.sql.PreparedStatement,database.Main,java.sql.ResultSet,java.util.ArrayList,java.sql.PreparedStatement,
javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpSession,javax.servlet.http.HttpServlet,javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,java.sql.ResultSet,java.sql.PreparedStatement,java.sql.SQLException"
 
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
</head>
<body>


	<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/SingleQuizManager" method="post">
<%!
class question{
	int type;
	String text;
	String correct;
	String ans1;
	String ans2;
	String ans3;
	String ans4;
	
	public question(int t,String tx,String cr,String a,String b,String c,String d){
		type=t;
		text=tx;
		correct=cr;
		ans1=a;
		ans2=b;
		ans3=c;
		ans4=d;
	}
	
}



ArrayList <question> getQuestion(int id) {
  		question q=null;
  		ArrayList <question> qu=new ArrayList <question>();
  		
		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT questiontype,question,correct,ans1,ans2,ans3,ans4 FROM questions WHERE quiznumber="+Integer.toString(id));			
	  		ResultSet result=statement.executeQuery();
	  		
			while (result.next()) {
				int a=result.getInt("questiontype");
			
				String b=result.getString("question");
				String c=result.getString("correct");
				
				String d=result.getString("ans1");
				
				String e=result.getString("ans2");
				
				String f=result.getString("ans3");
				
				String g=result.getString("ans4");
				q=new question(a,b,c,d,e,f,g);
				qu.add(q);
			}			
		}catch (Exception e) {System.out.println(e);} 

		
  		return qu;
  		
  		
  		
  	}	
  	  	
	%>
	
	<%

	ArrayList <question> questions=getQuestion(Integer.parseInt((String)request.getAttribute("quizid")));
	int qnum=0;
	for (question q:questions){
	qnum++;
	%>
	<br>	
		<div id="header">
	The question number: <%out.print(qnum); %>
	>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
		</div>
	<br>
	<br>
	<%		
		if (q.type==1){
			%>
			<div id="header">
			 Please answer the following question:
			 <br>
			 <br>
			 <%
			 
			 out.print(q.text);
			 
			 %>		 
			 <br>
			 <br>
			 
			 <input type="text" id ="asd1" name="<%out.print(qnum); %>" ><br>				 
			
			<br>
			<br>
			</div>
			<%
		}else
		if (q.type==2){
			%>
			<div id="header">
			 Please fill in the blank:
			 <br>
			 <br>
			 <%
			 
			 out.print(q.text);
			 
			 %>		 
			 <br>
			 <br>
			 
			 <input type="text" id="myanswer" name="<%out.print(qnum); %>" > 
			 			 		 
			 		
			
			<br>
			<br>
			</div>
			<%
		}else
		if (q.type==3){
			%>
			<div id="header">
			Please select the correct answer:
			<br>
			<br>
			<% 
			
			out.print(q.text);
			
			%>
				<br>
				<br>		
						
			<input type="radio" id="11" name="<%out.print(qnum); %>" value=<% out.print(q.ans1); %> checked > <% out.print(q.ans1); %><br>
			<input type="radio" id="22" name="<%out.print(qnum); %>" value=<% out.print(q.ans2); %>> <% out.print(q.ans2); %><br>  
			<input type="radio" id="33" name="<%out.print(qnum); %>" value=<% out.print(q.ans3); %>> <% out.print(q.ans3); %> <br>
			<input type="radio" id="44" name="<%out.print(qnum); %>" value=<% out.print(q.ans4); %>> <% out.print(q.ans4); %><br>
			
				
			
						 
			
			</div>
			<%
		}else{	
		%>
		<div id="header">
		What is depicted on the image?
		<br>
		<br>		
		<img src="<%out.print(q.text);%>" width="500" height="300"/>
		<br>
		<input type="text" id="myanswer" name="<%out.print(qnum); %>">	 	
				 
		
		</div>
		<%
		}
	
	
	}
	%>
	<%
	
	
	%>
		<div id="headerr">
	

	<input class="button" type="submit"  value="submit">
	</div>
	
	
		 			 
	</form>





</body>
</html>