package database;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.beans.editors.IntegerEditor;

/**
 * Servlet implementation class QuizQuestionManager
 */
@WebServlet("/QuizQuestionManager")
public class QuizQuestionManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static ResultSet rs;
	public static boolean d=false;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuizQuestionManager() {
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
		
		String f=request.getParameter("hiddenfield1");
		String s=request.getParameter("hiddenfield2");
		
	
		if (s!=null){

			long tEnd = System.currentTimeMillis();
			session.setAttribute("quizid", request.getParameter("hiddenfield3"));
			session.setAttribute("startingtime", tEnd);

			session.setAttribute("Mode",request.getParameter("quiz"));
			session.setAttribute("Ordered",request.getParameter("question"));
			session.setAttribute("Pages",request.getParameter("page"));
			session.setAttribute("Correction",request.getParameter("aaa"));
			System.out.println(request.getParameter("page"));	
			if ((boolean)request.getParameter("page").equals("0")) {
					
				session.setAttribute("startingtime",System.currentTimeMillis());
				request.setAttribute("quizid", request.getParameter("hiddenfield3"));
				System.out.println(request.getParameter("page"));
				request.getRequestDispatcher("/WEB-INF/SinglePage.jsp").forward(request, response);	
				return;
			}
			

			session.setAttribute("startid", f);
			session.setAttribute("finalid", s);
			s=null;
			session.setAttribute("mypoints", "0");
			//session.setAttribute("numquest",ss);
			session.setAttribute("current", f);
			request.setAttribute("current",f);
			//session.setAttribute("current",Integer.parseInt(f));		
			request.getRequestDispatcher("/WEB-INF/QuestionPage.jsp").forward(request, response);
		} else {			
			
			
			
			String t=(String)session.getAttribute("current");
				
				PreparedStatement statement = null;
				try {
					statement = Main.getConnection().prepareStatement("SELECT questiontype FROM questions WHERE id="+t);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}					
				ResultSet rs = null;
				try {
					rs = statement.executeQuery();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				int type=0;
				try {
					while(rs.next()){
						type=rs.getInt("questiontype");
					}
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				String myanswer = null;
			
				if (type!=3){
					myanswer=(String)request.getParameter("myanswer");
				}else{
					myanswer=request.getParameter("quiz");
				}
				System.out.println(myanswer+"ss");
				if (myanswer.length()==0) {
					myanswer="ambls;lperow49";
				}
				
				try {
					//System.out.println((String) session.getAttribute("mypoints"));
					//System.out.println("qqq");
					String a=(String) session.getAttribute("mypoints");
					int b=Integer.parseInt(a);
					b=b+DBFunctions.checkAnswer(myanswer,t);
					
					session.setAttribute("mypoints", Integer.toString(b));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				if (Integer.parseInt((String)session.getAttribute("finalid"))<Integer.parseInt((String)session.getAttribute("current"))+1){
					long tFinish = System.currentTimeMillis();
					double elapsedSeconds = (tFinish-(long)session.getAttribute("startingtime")) / 1000.0;
					session.setAttribute("timeelapsed", elapsedSeconds);
					request.setAttribute("mypoints", session.getAttribute("mypoints"));
					int a=-Integer.parseInt(((String)session.getAttribute("startid")))+Integer.parseInt(((String)session.getAttribute("finalid")))+1;
					request.setAttribute("totalpoints", Integer.toString(a));
					
					try {
						System.out.println(session.getAttribute("Mode"));
						if (((String)session.getAttribute("Mode")).equals("1")) DBFunctions.addingActivity((String)session.getAttribute("quizid"),(String)session.getAttribute("mypoints"),(String)session.getAttribute("name"),(int) (elapsedSeconds*1000));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					request.getRequestDispatcher("/WEB-INF/FinalResult.jsp").forward(request, response);	
					return;
				}
				int m=Integer.parseInt(t);
				m++;
				t=Integer.toString(m);
				session.setAttribute("current", t);
				request.setAttribute("current",t);
				request.getRequestDispatcher("/WEB-INF/QuestionPage.jsp").forward(request, response);
				
			}

			
		}


	
	

}
