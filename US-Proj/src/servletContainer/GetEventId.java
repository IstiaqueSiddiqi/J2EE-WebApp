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
 * Servlet implementation class GetEventId
 */
@WebServlet("/EventId")
public class GetEventId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEventId() {
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
			String event_id, date_posted="", event_date="", description="", venue="";
			event_id=request.getParameter("getId");
			try{
				PreparedStatement ps=con.prepareStatement("SELECT DATE_POSTED, EVENT_DATE, DESCRIPTION, VENUE FROM EVENTS WHERE EVENT_ID="+event_id);//creating preparedstatement object
				ResultSet rs=ps.executeQuery();
				rs.next();
				date_posted=rs.getString("date_posted");
				event_date=rs.getString("event_date");
				description=rs.getString("description");
				venue=rs.getString("venue");
			
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
           }catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			//request.getSession().setAttribute("msg",msg);
			request.getSession().setAttribute("event_id",event_id);
			request.getSession().setAttribute("date_posted",date_posted);
			request.getSession().setAttribute("event_date",event_date);
			request.getSession().setAttribute("description",description);
			request.getSession().setAttribute("venue",venue);
			
			String pageName=request.getParameter("pageName");
			if(pageName.equals("UpdateEvent"))
			{
				response.sendRedirect("UpdateEvent.jsp");
			}
			else
			{
				response.sendRedirect("DeleteEvent.jsp");
			}
		}
	}

}
