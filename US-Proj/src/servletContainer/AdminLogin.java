package servletContainer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBCon;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/login")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		Connection con=DBCon.getCon();
		
		String msg="";
		if(con==null)
			msg="database error";
		else
		{
			String userId=request.getParameter("userId");
			String userPassword=request.getParameter("userPassword");
			
			try
			{
				PreparedStatement ps=con.prepareStatement("SELECT ADMINID FROM ADMINDB WHERE ADMINID=? AND ADMINPASSWORD=?");//creating preparedstatement object
				ps.setString(1, userId);
				ps.setString(2, userPassword);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next())
				{
					//String adminId=rs.getString(1);
					request.getSession().setAttribute("username",userId);
					response.sendRedirect("administratorPage.jsp");
				}
				else
				{
					request.getSession().setAttribute("msg","Invalid Username or Password");
					response.sendRedirect("AdminLogin.jsp");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				msg="databse error..";
				request.getSession().setAttribute("msg","Invalid Username or Password");
				response.sendRedirect("AdminLogin.jsp");
			}
			finally
			{
				try 
				{
					con.close();
				} 
				catch (SQLException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
