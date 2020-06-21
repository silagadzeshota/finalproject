package database;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class FriendRequestManager
 */
@WebServlet("/FriendRequestManager")
public class FriendRequestManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FriendRequestManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requester=request.getParameter("requester");		
		HttpSession session = request.getSession();
		String thisname=(String) session.getAttribute("name");
		try {
			DBFunctions.deleteRequest(requester,thisname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/FriendsRequest.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String requester=request.getParameter("requester");		
		HttpSession session = request.getSession();
		String thisname=(String) session.getAttribute("name");
		
		System.out.println(requester);

		System.out.println(thisname);
		
		try {
			DBFunctions.deleteRequest(requester,thisname);
			DBFunctions.addFriendship(requester,thisname);
			DBFunctions.addNewPair(requester,thisname);
			DBFunctions.addNewPair(thisname,requester);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/FriendsRequest.jsp");
		dispatch.forward(request, response);	
		
	}

}
