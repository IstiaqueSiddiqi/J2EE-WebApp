package servletContainer;

import java.io.*;
import javax.servlet.*;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.DBCon;

/**
 * Servlet implementation class InsertCourse
 */
@WebServlet("/NewCourse")
public class InsertCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCourse() {
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
			course_type=request.getParameter("course_type");
			course_id="";
			course_title=request.getParameter("course_title");
			//course_type=request.getParameter("course_type");
			duration=request.getParameter("duration");
			exam_type=request.getParameter("exam_type");
			description=request.getParameter("description");
			try{
				PreparedStatement ps1=con.prepareStatement("SELECT COURSEID.NEXTVAL FROM DUAL");//creating preparedstatement object
				ResultSet rs1=ps1.executeQuery();
				rs1.next();
				course_id=rs1.getString(1);
			PreparedStatement ps=con.prepareStatement("INSERT INTO COURSE VALUES(?,?,?,?,?,?)");//creating preparedstatement object
            ps.setString(1,course_id);
            ps.setString(2,course_title.toUpperCase());
            ps.setString(3,course_type.toUpperCase());
            ps.setString(4,duration.toUpperCase());
            ps.setString(5,exam_type.toUpperCase());
            ps.setString(6,description.toUpperCase());
            
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
			response.sendRedirect("InsertCourse.jsp");
		}
	}

}
