package database;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.ParseConversionEvent;

/**
 * Servlet implementation class CreateAccount
 */
@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/CreatingAccountPage.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final char[] CHARS = "abcdefghijklmnopqrstuvwxyz0123456789.,-!".toCharArray();	
		// TODO Auto-generated method stub
		String EnteredName = request.getParameter("User name");
		String EnteredPassword=request.getParameter("Password");
		if (EnteredPassword.length()<=6) {
			request.setAttribute("errorMessage", "The password must be more the 6 digits");
			request.getRequestDispatcher("/WEB-INF/CreatingAccountPage.jsp").forward(request, response);			
			return;
		}
		
		try{
			PreparedStatement statement =Main.getConnection().prepareStatement("SELECT login,password FROM users WHERE login =" + "'" + EnteredName + "'");			
			ResultSet result=statement.executeQuery();
			
			while (result.next()) {
				request.setAttribute("errorMessage", "User Name already exists");
				request.getRequestDispatcher("/WEB-INF/CreatingAccountPage.jsp").forward(request, response);			
				return;
			}
	
			String init="";
			for(int k=0;k<EnteredPassword.length();k++) {
				for(int j=0;k<CHARS.length;j++) {
					if (EnteredPassword.charAt(k)==CHARS[j]) {
						init+=j;
						break;
					}
				}
			}
			byte[] pas=hexToArray(init);
			byte[] hashedpas=HashFunction(pas);			
			String stringedpas=hexToString(hashedpas);
			
			
			PreparedStatement st =Main.getConnection().prepareStatement("INSERT INTO users(login,password) VALUES("+"'"+EnteredName+"', '"+stringedpas+"')");
			st.executeUpdate();
			request.setAttribute("errorMessage", "Your account has been created");
			request.getRequestDispatcher("/WEB-INF/WelcomePage.jsp").forward(request, response);
			
		} catch(Exception e) {System.out.println(e);}
		
		
	}
	
	public static byte[] hexToArray(String hex) {
		byte[] result = new byte[hex.length()/2];
		for (int i=0; i<hex.length(); i+=2) {
			result[i/2] = (byte) Integer.parseInt(hex.substring(i, i+2), 16);
		}
	
		return result;
	}
	
	public static byte[] HashFunction(byte[] line) throws NoSuchAlgorithmException {
		MessageDigest dm=MessageDigest.getInstance("SHA");
		byte[] res=dm.digest(line);
		dm.update(res);
		return res;	
	}
	
	public static String hexToString(byte[] bytes) {
		StringBuffer buff = new StringBuffer();
		for (int i=0; i<bytes.length; i++) {
			int val = bytes[i];
			val = val & 0xff;  // remove higher bits, sign
			if (val<16) buff.append('0'); // leading 0
			buff.append(Integer.toString(val, 16));
		}
		return buff.toString();
	}

	

}
