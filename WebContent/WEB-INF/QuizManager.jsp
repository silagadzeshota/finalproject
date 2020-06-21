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
<title>Welcome to Quiz</title>

<style>

body{
	 background-image: url("http://thepapist.org/wp-content/uploads/2015/09/question.jpg");
}
.button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: yellow;
    padding: 6px 3px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
  
    margin: 4px 2px;
    cursor: pointer;
}



</style>
</head>
<body>

Please Choose Quiz:
<br>
<br>


<%!
  	
	class quiz{
		String quizCreator;
		String description;
		int practiceallowed;
		int randomized;
		int index;
		
		public quiz(String a,String b,int c,int rand,int practiceallowe) {
			quizCreator=a;
			description=b;
			index=c;
			randomized=rand;
			practiceallowed=practiceallowe;
			
		}
	}

  	ArrayList<quiz> getRequests() {
  		ArrayList<quiz> reqinfo = new ArrayList<quiz>();  		
		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT id,description,creator,randomized,practiceallowed FROM quizes");			
	  		ResultSet result=statement.executeQuery();	
			while (result.next()) {
				String description=result.getString("description");
				String creator=result.getString("creator");
				int index=result.getInt("id");
				int rand=result.getInt("randomized");
				int pa=result.getInt("practiceallowed");
				reqinfo.add(new quiz(creator,description,index,rand,pa));			
			}			
		}catch (Exception e) {System.out.println(e);} 

		
  		return reqinfo;
  		
  		
  		
  	}	
  	
  	class pair{
  		int first;
  		int second;
  		public pair(int a,int b){
  			first=a;
  			second=b;
  		}
  	}
  	
  	pair getfirstindex(int id){
  		String idd=Integer.toString(id);
  		int f=0;
  		int s=0;
  		try {
  			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT id FROM questions WHERE quiznumber="+idd);			
  	  		ResultSet result=statement.executeQuery();	
  			while (result.next()) {
  				s++;
  				if (f==0)
  					f=result.getInt("id");			
  			}			
  		}catch (Exception e) {System.out.println(e);}
  		return new pair(f,s);
  		
  	}
  	
	%>


	<%
	
	ArrayList<quiz> ar;
	ar=getRequests();
	 
	
	for (quiz s : ar) {
		int f=getfirstindex(s.index).first;
		int ss=getfirstindex(s.index).second;
		out.println("Author: "+s.quizCreator+"\n");
		out.println("\n");
		%>
		<br>
		
		<% 
		out.println("Description: "+s.description+"\n");		
		%>				
		
		 <form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizSummaryPageManager" method="post">
		 <input class="button" type="submit" name="quizname" value="Take the quiz">
		 		 
		 <input type="hidden" name="hiddenfield1" value="<% out.print(f); %>">
		 <input type="hidden" name="hiddenfield2" value="<% out.print(ss+f-1); %>">
		 <input type="hidden" name="hiddenfield3" value="<% out.print(s.index); %>">
		 <input type="hidden" name="pr" value="<% out.print(s.practiceallowed); %>">		 
		</form>		
		<br>
		<br>
		
		<%	
		
	}		
	%>





</body>
</html>