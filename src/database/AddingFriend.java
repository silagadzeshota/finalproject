package database;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddingFriend
 */
@WebServlet("/AddingFriend")
public class AddingFriend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddingFriend() {
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
		String thisname=(String) session.getAttribute("name");		
		String enteredName = request.getParameter("Friend");
		
		
		try {
			if (DBFunctions.alreadyFriends(thisname,enteredName)) {			
				request.setAttribute("errorMessage", "You are already friends!");
				request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		try {
			if (DBFunctions.requestExists(thisname,enteredName)) {			
				request.setAttribute("errorMessage", "Already sent");
				request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			if (DBFunctions.requestExists(enteredName,thisname)) {
				request.setAttribute("errorMessage", "That person requested you");
				request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);
				return;
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		try {
			if (personExists(enteredName)&&!enteredName.equals(thisname)) {				
				PreparedStatement statement =Main.getConnection().prepareStatement("INSERT INTO requests(sender,receiver) VALUES("+"'"+thisname+"', '"+enteredName+"')");				
				statement.executeUpdate();			

				request.setAttribute("errorMessage", "Request has been sent");
				request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);
				return;
				
			} else {
				request.setAttribute("errorMessage", "Uncorrect name!");
				request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	boolean personExists(String name) throws SQLException, Exception {		
		PreparedStatement statement =Main.getConnection().prepareStatement("SELECT login FROM users WHERE login =" + "'" + name + "'");			
		ResultSet result=statement.executeQuery();
		System.out.println(name);
		while (result.next()) {
			return true;
		}
		return false;		
	}
	

}
