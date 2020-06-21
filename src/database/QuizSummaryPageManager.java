package database;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuizSummaryPageManager
 */
@WebServlet("/QuizSummaryPageManager")
public class QuizSummaryPageManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizSummaryPageManager() {
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
		String a1=(String)request.getParameter("hiddenfield3");
		String a2=(String)request.getParameter("hiddenfield2");
		String a3=(String)request.getParameter("hiddenfield1");
		String a4=(String)request.getParameter("pr");
		System.out.println("a");
		System.out.println(a4);
		System.out.println("b");
		HttpSession session = request.getSession();
	try {		
		request.setAttribute("quizid", a1);
		request.setAttribute("start", a3);
		request.setAttribute("finish", a2);
		request.setAttribute("prac", a4);
		request.setAttribute("user", session.getAttribute("name"));
		}catch (Exception e) {} 
		
		
		System.out.println((String)request.getAttribute("start")+" "+a1+" "+a2+" "+a3);
		
		request.getRequestDispatcher("/WEB-INF/QuizSummaryPage.jsp").forward(request, response);
		
		
	}

}
