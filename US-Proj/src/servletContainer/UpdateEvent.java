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
 * Servlet implementation class UpdateEvent
 */
@WebServlet("/EventUpdate")
public class UpdateEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEvent() {
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
			String event_id, date_posted="", event_date="", description="", venue="",last_posted="", last_event_date="";
			event_id=request.getParameter("event_id");
			date_posted=request.getParameter("date_posted");
			event_date=request.getParameter("event_date");
			description=request.getParameter("description");
			venue=request.getParameter("venue");
			
			last_posted=request.getParameter("last_posted");
			last_event_date=request.getParameter("last_event_date");

			try{
				
			PreparedStatement ps=con.prepareStatement("UPDATE EVENTS SET DATE_POSTED=?, EVENT_DATE=?, DESCRIPTION=?,VENUE=? WHERE EVENT_ID="+event_id);//creating preparedstatement object
            ps.setString(1,date_posted);
            ps.setString(2,event_date);
            ps.setString(3,description);
            ps.setString(4,venue);
                     
            
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
			response.sendRedirect("UpdateEvent.jsp");
		}
	}

}
