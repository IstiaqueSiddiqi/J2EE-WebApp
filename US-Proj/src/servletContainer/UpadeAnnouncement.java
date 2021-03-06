package servletContainer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBCon;

/**
 * Servlet implementation class UpadeAnnouncement
 */
@WebServlet("/UpdateNews")
public class UpadeAnnouncement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpadeAnnouncement() {
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
		else{/*create sequence courseid maxvalue 999999999*/
			String news_id,description="",last_posted="", date_posted="";
			news_id=request.getParameter("news_id");
			description=request.getParameter("description");
			last_posted=request.getParameter("last_posted");
			date_posted=request.getParameter("date_posted");

			try{
				
			PreparedStatement ps=con.prepareStatement("UPDATE NEWS SET DESCRIPTION=?,DATE_POSTED=? WHERE NEWS_ID="+news_id);//creating preparedstatement object
            ps.setString(1,description);
            ps.setString(2,date_posted);
            
            int x=ps.executeUpdate();
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
            if(x!=0)
            	msg="Updation Successful";
            else
            	msg="Try again...";
			}catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			request.getSession().setAttribute("msg",msg);
			response.sendRedirect("UpdateAnnouncement.jsp");
		}
	}

}
