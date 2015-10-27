package servletContainer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBCon;

/**
 * Servlet implementation class GetNewsId
 */
@WebServlet("/NewsId")
public class GetNewsId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNewsId() {
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
			String news_id,description="", date_posted="";
			news_id=request.getParameter("getId");
			try{
				PreparedStatement ps=con.prepareStatement("SELECT DESCRIPTION,DATE_POSTED FROM NEWS WHERE NEWS_ID="+news_id);//creating preparedstatement object
				ResultSet rs=ps.executeQuery();
				rs.next();
				description=rs.getString("description");
				date_posted=rs.getString("date_posted");
			
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
           }catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			//request.getSession().setAttribute("msg",msg);
			request.getSession().setAttribute("news_id",news_id);
			request.getSession().setAttribute("description",description);
			request.getSession().setAttribute("date_posted",date_posted);
			
			String pageName=request.getParameter("pageName");
			if(pageName.equals("UpdateAnnouncement"))
			{
				response.sendRedirect("UpdateAnnouncement.jsp");
			}
			else
			{
				response.sendRedirect("DeleteAnnouncement.jsp");
			}
		}
	}

}
