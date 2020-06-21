package database;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailingSystemManager
 */
@WebServlet("/MailingSystemManager")
public class MailingSystemManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailingSystemManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		session.setAttribute("receiver",request.getParameter("requester"));
		try {
			DBFunctions.removeNotification((String)request.getParameter("requester"),(String)session.getAttribute("name"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println("st");
		//System.out.println(session.getAttribute("receiver"));
		//System.out.println("en");
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/SendMailPage.jsp");
		dispatch.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String sender=(String) session.getAttribute("name");
		String receiver=(String) session.getAttribute("receiver");
		String text=(String) request.getParameter("teqsti");
		
		PreparedStatement statement = null;
		try {
			statement = Main.getConnection().prepareStatement("INSERT INTO mailingtable(sender,receiver,messages) VALUES("+"'"+sender+"', '"+receiver+"' ,'"+text+"')");
			DBFunctions.addNotifications(sender,receiver);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}				
		try {
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/SendMailPage.jsp");
		dispatch.forward(request, response);	
		
		
		//PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO mailingtable(sender,receiver,messages) VALUES("+"'"+s+"', '"+r+"')");				
		//statement.executeUpdate();	
		

	}

}
