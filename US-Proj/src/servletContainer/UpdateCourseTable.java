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
 * Servlet implementation class UpdateCourseTable
 */
@WebServlet("/UpdateTable")
public class UpdateCourseTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCourseTable() {
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
			String course_id, course_title, course_type, duration, exam_type, description;
			course_id=request.getParameter("course_id");
			course_title=request.getParameter("course_title");
			course_type=request.getParameter("course_type");
			duration=request.getParameter("duration");
			exam_type=request.getParameter("exam_type");
			description=request.getParameter("description");
			try{
				
			PreparedStatement ps=con.prepareStatement("UPDATE COURSE SET COURSE_TITLE=?,COURSE_TYPE=?,DURATION=?,EXAM_TYPE=?,DESCRIPTION=? WHERE COURSE_ID=?");//creating preparedstatement object
            ps.setString(1,course_title);
            ps.setString(2,course_type);
            ps.setString(3,duration);
            ps.setString(4,exam_type);
            ps.setString(5,description);
            ps.setString(6,course_id);
            
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
			response.sendRedirect("UpdateCourse.jsp");
		}
	}

}
