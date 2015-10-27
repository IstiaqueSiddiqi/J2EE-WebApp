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
 * Servlet implementation class InsertEvent
 */
@WebServlet("/AddEvent")
public class InsertEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEvent() {
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
			String event_id, description, date_posted, event_date,venue;
			event_id="";
			date_posted=request.getParameter("date_posted");
			event_date=request.getParameter("event_date");
			description=request.getParameter("description");
			venue=request.getParameter("venue");
			try{
				PreparedStatement ps1=con.prepareStatement("SELECT EVENTID.NEXTVAL FROM DUAL");//creating preparedstatement object
				ResultSet rs1=ps1.executeQuery();
				rs1.next();
				event_id=rs1.getString(1);
			PreparedStatement ps=con.prepareStatement("INSERT INTO EVENTS VALUES(?,?,?,?,?)");//creating preparedstatement object
            ps.setString(1,event_id);
            ps.setString(2,date_posted);
            ps.setString(3,event_date);
            ps.setString(4,description);
            ps.setString(5,venue);
            
            int x=ps.executeUpdate();
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
            if(x!=0)
            	msg="Insert Successful";
            else
            	msg="Try again...";
			}catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			request.getSession().setAttribute("msg",msg);
			response.sendRedirect("InsertEvent.jsp");
		}

	}

}
