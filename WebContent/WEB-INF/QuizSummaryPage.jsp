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
<title>Quiz Summary Page</title>
<style>


#header {
    background-color:yellow;
    color:black;
    text-align:center;
    padding:0.003px;
}


</style>

</head>


<body>

<div id="header">

<br>


		<form action="http://localhost:8080/laksndlkasnbfslkasdfnlk/QuizQuestionManager" method="post">
		
		<input class="button" type="submit" name="quizname" value=" Take Quiz ! "><br>		 
		 <input type="hidden" name="hiddenfield1" value="<% out.print(request.getAttribute("start")); %>">
		 <input type="hidden" name="hiddenfield2" value="<% out.print(request.getAttribute("finish")); %>">
		 <input type="hidden" name="hiddenfield3" value="<% out.print(request.getAttribute("quizid")); %>">
		
			
<%
	String t1=(String)request.getAttribute("prac");


	if (t1.equals("1")) {
		%>
	
		 <input type="radio" id ="2" name="quiz" value="1"checked> Graded Mode
		 <input type="radio" id="1" name="quiz" value="0" > Practice Mode<br>
		
		<%
	} else {
		%>
		
		 <input type="hidden" id ="2" name="quiz" value="1"checked> 
		 <input type="hidden" id="1" name="quiz" value="0" > <br>
		
		<%
				
		
	}

%>	 
		
		 
		  <input type="radio" id="6" name="page" value="1"checked> Multiple Pages
		 <input type="radio" id="5" name="page" value="0" > Single Page<br>
		  <input type="radio" id="6" name="aaa" value="1"checked> Immediate correction
		 <input type="radio" id="5" name="aaa" value="0" > Grade after completion<br>
		 	</form>

		<%!
			class quiz{
				String user;
				int points;
				int time;
				int id;
				public quiz(String user,int points,int time,int id){
					this.user=user;
					this.points=points;
					this.time=time;
					this.id=id;
				}
			};	
		
		
			ArrayList <quiz> getQuiz(String user,int id){
				ArrayList <quiz> res=new ArrayList<quiz>();
				try{
					PreparedStatement statement =Main.getConnection().prepareStatement("SELECT taker,points,timing,quizid FROM activitylog WHERE taker="+"'"+user+"' AND quizid="+id+" ORDER BY id DESC LIMIT 5");					
					ResultSet rs=statement.executeQuery();
					while(rs.next()){
						quiz q=new quiz(user,rs.getInt("points"),rs.getInt("timing"),rs.getInt("quizid"));
						res.add(q);
					}	
				}catch (Exception e) {System.out.println(e);} 
				
				return res;
			}
		
			
			ArrayList <quiz> getHighest(int id){
				ArrayList <quiz> res=new ArrayList<quiz>();
				try{
					PreparedStatement statement =Main.getConnection().prepareStatement("SELECT * FROM activitylog WHERE quizid="+id+" ORDER BY points DESC LIMIT 5");					
					ResultSet rs=statement.executeQuery();
					while(rs.next()){
						quiz q=new quiz(rs.getString("taker"),rs.getInt("points"),rs.getInt("timing"),rs.getInt("quizid"));
						res.add(q);
					}	
				}catch (Exception e) {System.out.println(e);} 
				return res;
			}
			
			ArrayList <quiz> getAll(int id){
				ArrayList <quiz> res=new ArrayList<quiz>();
				try{
					PreparedStatement statement =Main.getConnection().prepareStatement("SELECT * FROM activitylog WHERE quizid="+id);					
					ResultSet rs=statement.executeQuery();
					while(rs.next()){
						quiz q=new quiz(rs.getString("taker"),rs.getInt("points"),rs.getInt("timing"),rs.getInt("quizid"));
						res.add(q);
					}	
				}catch (Exception e) {System.out.println(e);}
				return res;
			}
			
			
			
		%>
		<br>
		My history:
		<br>
		<%
			
			String user=(String)request.getAttribute("user");
			int id=Integer.parseInt((String)request.getAttribute("quizid"));
			ArrayList<quiz> myQuiz=getQuiz(user,id);
			int t=0;
			for (quiz s:myQuiz){
				out.println("Final Score: "+s.points+" in "+((double)(s.time/(double)1000))+" seconds.");
				%><br><% 
				if (t>=5)
					break;
				t++;
			}
			
			
			%>
			<br>
			<br>
			History of highest performers of all time:
			<br>
			<% 
			myQuiz=getHighest(id);
			for (quiz s:myQuiz){
				out.println("User: "+s.user+" Final Score: "+s.points+" in "+((double)(s.time/(double)1000))+" seconds.");
				%><br><% 
			}
			
			
			%>
			<br>
			<br>
			Statistics on average:
			<br>
			<% 
			myQuiz=getAll(id);
			int total=myQuiz.size();
			double sum=0;
			double time=0;
			for (quiz s:myQuiz){
				 sum+=s.points;
				 time+=s.time;
			}
			sum/=(double) total;
			time/=(double) total;
			time/=(double) 1000;
			out.println("This quiz has been written "+total+" times by users");
			%><br><%
			out.println("Averagely users got "+sum+" points in average time of "+time+" seconds");
			%><br><% 
		%>
		</div>
</body>
</html>