package database;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveQuestion
 */
@WebServlet("/SaveQuestion")
public class SaveQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveQuestion() {
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
		
		String radioButton= request.getParameter("quiz");		
		String correctAnswer= request.getParameter("answer");
		String question=request.getParameter("question");
		String ans1=request.getParameter("answer1");
		
		
		String ans2=request.getParameter("answer2");
		String ans3=request.getParameter("answer3");
		String ans4=request.getParameter("answer4");
	
		
		try {
			DBFunctions.addQuestion(radioButton, question,correctAnswer, ans1, ans2, ans3, ans4);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/Question.jsp");
		dispatch.forward(request, response);			
	}

}
