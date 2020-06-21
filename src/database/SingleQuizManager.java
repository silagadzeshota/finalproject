package database;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SingleQuizManager
 */
@WebServlet("/SingleQuizManager")
public class SingleQuizManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingleQuizManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession();
		String quizid=(String)session.getAttribute("quizid");
		int mypoints=0;
		
		int z=0;

		try {					
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT questiontype,question,correct,ans1,ans2,ans3,ans4 FROM questions WHERE quiznumber="+quizid);			
	  		ResultSet result=statement.executeQuery();
	  		
	  		
			while (result.next()) {
				
				z++;				
				String s="";				
				s=s+z;			
				
				String myans=(String)request.getParameter(s);
				if (myans.length()==0) myans="flkplkwe;k234";				
								
				String type=result.getString("questiontype");
				
				if (type!="3") {
				
					if (result.getString("correct").equals(myans)||result.getString("ans1").equals(myans)||result.getString("ans2").equals(myans)||result.getString("ans3").equals(myans)||result.getString("ans4").equals(myans)){
						mypoints++;
					}
				} else {
					if (result.getString("correct").equals(myans)) mypoints++;
				}

			}			
		}catch (Exception e) {System.out.println(e);}
		
		
		
		long tFinish = System.currentTimeMillis();
		double elapsedSeconds = (tFinish-(long)session.getAttribute("startingtime")) / 1000.0;
		session.setAttribute("timeelapsed", elapsedSeconds);
		request.setAttribute("mypoints", mypoints);
		
		request.setAttribute("totalpoints", z);
		
		try {
			String f="";
			f=f+mypoints;
			if (((String)session.getAttribute("Mode")).equals("1")) DBFunctions.addingActivity((String)session.getAttribute("quizid"),f,(String)session.getAttribute("name"),(int) (elapsedSeconds*1000));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/WEB-INF/FinalResult.jsp").forward(request, response);	
		return;
		
		
		
		
	}

}
