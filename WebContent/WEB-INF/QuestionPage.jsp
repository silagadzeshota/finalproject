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
<title>Questions</title>
<style>

body {

    background-image: url("https://dqam6mam97sh3.cloudfront.net/blog/ausl/wp-content/uploads/sites/2/2015/02/homer.png");
    background-repeat: no-repeat;
    background-attachment: fixed;
        
}

</style>
</head>
<body>

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



  	question getQuestion(int id) {
  		question q=null;  		
  		
		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT questiontype,question,correct,ans1,ans2,ans3,ans4 FROM questions WHERE id="+Integer.toString(id));			
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
			}			
		}catch (Exception e) {System.out.println(e);} 

		
  		return q;
  		
  		
  		
  	}	
  	  	
	%>
	<script >
	
	
	function enable1(){
		if (document.getElementById("myanswer").disabled) {
		document.getElementById("myanswer").disabled=false;
		}

	}
	
	function enable2(){
		if (document.getElementById("myanswer").disabled) {
		document.getElementById("myanswer").disabled=false;
		}
		
	}
	

	function enable3(){
		if (document.getElementById("11").disabled) {
		document.getElementById("11").disabled=false;
		document.getElementById("22").disabled=false;
		document.getElementById("33").disabled=false;
		document.getElementById("44").disabled=false;
		}
	}

	function enable4(){
		if (document.getElementById("myanswer").disabled) {
			document.getElementById("myanswer").disabled=false;			
		}
	}


	
	function check() {		
		document.getElementById("themain").disabled=true;

		
		var ty=document.getElementById("type").value;
		
		if (ty!=3&&document.getElementById("myanswer").value=="") {
			document.getElementById("demo").innerHTML ="You are wrong, the answer is "+document.getElementById("cor").value;
			document.getElementById("myanswer").disabled=true;
			return;
		}
		
		
		if (ty==1) {
			
			if (document.getElementById("myanswer").value==document.getElementById("ans1").value||document.getElementById("myanswer").value==document.getElementById("ans2").value||document.getElementById("myanswer").value==document.getElementById("ans3").value||document.getElementById("myanswer").value==document.getElementById("ans4").value||document.getElementById("myanswer").value==document.getElementById("cor").value) {
				document.getElementById("demo").innerHTML ="You are correct, the answer is "+document.getElementById("myanswer").value;
				document.getElementById("myanswer").disabled=true;
				return;			
			} else document.getElementById("demo").innerHTML ="You are wrong, the answer is "+document.getElementById("cor").value;
			document.getElementById("myanswer").disabled=true;
			
		}
		if (ty==2) {
			if (document.getElementById("myanswer").value==document.getElementById("cor").value) {
				document.getElementById("demo").innerHTML ="You are correct, the answer is "+document.getElementById("myanswer").value;
				document.getElementById("myanswer").disabled=true;
				return;
			}
			if (document.getElementById("myanswer").value==document.getElementById("ans1").value) {
				document.getElementById("demo").innerHTML ="You are correct, the answer is "+document.getElementById("myanswer").value;
				document.getElementById("myanswer").disabled=true;
				return;
			}
			if (document.getElementById("myanswer").value==document.getElementById("ans2").value) {
				document.getElementById("demo").innerHTML ="You are correct, the answer is "+document.getElementById("myanswer").value;
				document.getElementById("myanswer").disabled=true;
				return;
			}
			if (document.getElementById("myanswer").value==document.getElementById("ans3").value) {
				document.getElementById("demo").innerHTML ="You are correct, the answer is "+document.getElementById("myanswer").value;
				document.getElementById("myanswer").disabled=true;
				return;
			}
			if (document.getElementById("myanswer").value==document.getElementById("ans4").value) {
				
				document.getElementById("demo").innerHTML ="You are correct, the answer is "+document.getElementById("myanswer").value;
				document.getElementById("myanswer").disabled=true;
				return;
			}
			document.getElementById("demo").innerHTML ="You are wrong, the possible answer is "+document.getElementById("cor").value;
			
		}
		if (ty==3) {			
		
			var myans;
			if (document.getElementById("11").checked) {
				myans=document.getElementById("11").value;								
			}
			if (document.getElementById("22").checked) {
				myans=document.getElementById("22").value;			
			}
			if (document.getElementById("33").checked) {
				myans=document.getElementById("33").value;			
			}
			if (document.getElementById("44").checked) {
				myans=document.getElementById("44").value;			
			}
			
			document.getElementById("11").disabled=true;
			document.getElementById("22").disabled=true;
			document.getElementById("33").disabled=true;
			document.getElementById("44").disabled=true;
			
			
			
			
			if (document.getElementById("cor").value==myans) {
				document.getElementById("demo").innerHTML ="You are correct, the answer is: "+myans;
				return;
			} else document.getElementById("demo").innerHTML ="You are wrong, the answer is: "+document.getElementById("cor").value;
			
			 
		}
		
		if (ty==4) {
			if (document.getElementById("myanswer").value==document.getElementById("ans1").value||document.getElementById("myanswer").value==document.getElementById("ans2").value||document.getElementById("myanswer").value==document.getElementById("ans3").value||document.getElementById("myanswer").value==document.getElementById("ans4").value||document.getElementById("myanswer").value==document.getElementById("cor").value) {
				document.getElementById("myanswer").disabled=true;
				document.getElementById("demo").innerHTML ="You are correct the image depicts: "+document.getElementById("myanswer").value;
			} else document.getElementById("demo").innerHTML ="You are wrong, the image depicts: "+document.getElementById("cor").value;
			document.getElementById("myanswer").disabled=true;
		}

		
  		
	}
	
	</script>


	<%

		question q=getQuestion(Integer.parseInt((String)request.getAttribute("current")));		
		
		String cu=(String)request.getAttribute("current");
	
		request.setAttribute("current",cu);
		
		if (q.type==1){
			%>
			 Please answer the following question:
			 <br>
			 <br>
			 <%
			 
			 out.print(q.text);
			 
			 %>		 
			 <br>
			 <br>
			 <form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
			 <input type="text" id ="myanswer" name="myanswer"  value=""><br>				 
			 <button type="submit" name="submitbutton" value="Next Question" onclick="enable1()"> submit </button>					 
			</form>
			<%
			
			 if (session.getAttribute("Correction").equals("1")) {
				%>
				
				
				
				<input type="hidden" id="type" value="<% out.print(q.type); %>">
				 <input type="hidden" id="cor" value="<% out.print(q.correct); %>">			
				 <input type="hidden" id="ans1" value="<% out.print(q.ans1); %>">
				 <input type="hidden" id="ans2" value="<% out.print(q.ans2); %>">
				 <input type="hidden" id="ans3" value="<% out.print(q.ans3); %>">
				 <input type="hidden" id="ans4" value="<% out.print(q.ans4); %>">
				<button id="themain" onclick="check()" >Check Answer</button>
				<p id="demo"></p>
				<%
			}	
			 %>		
			<br>
			<br>
			<%
		}else
		if (q.type==2){
			%>
			 Please fill in the blank:
			 <br>
			 <br>
			 <%
			 
			 out.print(q.text);
			 
			 %>		 
			 <br>
			 <br>
			 <form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
			 <input type="text" id="myanswer" name="myanswer" value="">			 		 
			 <button type="submit" name="submitbutton" value="Next Question" onclick="enable2()"> submit </button>			 		 
			 </form>		
			 <%
			 if (session.getAttribute("Correction").equals("1")) {
					%>
					
					
					<button id="themain" onclick="check()">Check Answer</button>
				 <input type="hidden" id="type" value="<% out.print(q.type); %>">	
				 <input type="hidden" id="cor" value="<% out.print(q.correct); %>">			
				 <input type="hidden" id="ans1" value="<% out.print(q.ans1); %>">
				 <input type="hidden" id="ans2" value="<% out.print(q.ans2); %>">
				 <input type="hidden" id="ans3" value="<% out.print(q.ans3); %>">
				 <input type="hidden" id="ans4" value="<% out.print(q.ans4); %>">
				 <p id="demo"></p>
					<%
				}	
				
			 %>
			<br>
			<br>
			<%
		}else
		if (q.type==3){
			%>
			Please select the correct answer:
			<br>
			<br>
			<% 
			
			out.print(q.text);
			
			%>
				<br>
				<br>		
						
			<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
			<input type="radio" id="11" name="quiz" value=<% out.print(q.ans1); %> checked > <% out.print(q.ans1); %><br>
			<input type="radio" id="22" name="quiz" value=<% out.print(q.ans2); %>> <% out.print(q.ans2); %><br>  
			<input type="radio" id="33" name="quiz" value=<% out.print(q.ans3); %>> <% out.print(q.ans3); %> <br>
			<input type="radio" id="44" name="quiz" value=<% out.print(q.ans4); %>> <% out.print(q.ans4); %><br>
			
				
			
			 <button type="submit" name="submitbutton" value="Next Question" onclick="enable3()"> submit </button>				 
			</form>
			<%
			 if (session.getAttribute("Correction").equals("1")) {
					%>
					
					
					<button id="themain" onclick="check()">Check Answer</button>
						<p id="demo"></p>		
					 <input type="hidden" id="type" value="<% out.print(q.type); %>">	
					 <input type="hidden" id="cor" value="<% out.print(q.correct); %>">			
					 <input type="hidden" id="ans1" value="<% out.print(q.ans1); %>">
					 <input type="hidden" id="ans2" value="<% out.print(q.ans2); %>">
					 <input type="hidden" id="ans3" value="<% out.print(q.ans3); %>">
					 <input type="hidden" id="ans4" value="<% out.print(q.ans4); %>">		
					<%
				}	
				
			 %>
			
			<%
		}else{	
		%>
		What is depicted on the image?
		<br>
		<br>		
		<img src="<%out.print(q.text);%>" width="500" height="300"/>
		
		<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
		<input type="text" id="myanswer" name="myanswer"  value="">
		
		 <button type="submit" name="submitbutton" value="Next Question" onclick="enable4()"> submit </button>	
		 			 
		</form>
		<%
		 if (session.getAttribute("Correction").equals("1")) {
				%>
				
				
				<button id="themain" onclick="check()">Check Answer</button>
				<p id="demo"></p>
				<input type="hidden" id="type" value="<% out.print(q.type); %>">	
					 <input type="hidden" id="cor" value="<% out.print(q.correct); %>">			
					 <input type="hidden" id="ans1" value="<% out.print(q.ans1); %>">
					 <input type="hidden" id="ans2" value="<% out.print(q.ans2); %>">
					 <input type="hidden" id="ans3" value="<% out.print(q.ans3); %>">
					 <input type="hidden" id="ans4" value="<% out.print(q.ans4); %>">						
				<%
			}	
			
		 %>
		
		<%
		}
	
	%>



</body>
</html>