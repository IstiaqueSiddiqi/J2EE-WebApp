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
 * Servlet implementation class GetColumnValue
 */
@WebServlet("/SelectRow")
public class GetColumnValue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetColumnValue() {
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
		else{/*create sequence courseid maxvalue 999999999;*/
			String course_id, course_title="", course_type="", duration="", exam_type="", description="";
			course_id=request.getParameter("getId");
			
			try{
				PreparedStatement ps=con.prepareStatement("SELECT COURSE_TITLE,COURSE_TYPE,DURATION,EXAM_TYPE,DESCRIPTION FROM COURSE WHERE COURSE_ID="+course_id);//creating preparedstatement object
				ResultSet rs=ps.executeQuery();
				rs.next();
				course_title=rs.getString("COURSE_TITLE");
				course_type=rs.getString("course_type");
				duration=rs.getString("duration");
				exam_type=rs.getString("exam_type");
				description=rs.getString("description");
			
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
           }catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			//request.getSession().setAttribute("msg",msg);
			request.getSession().setAttribute("course_id",course_id);
			request.getSession().setAttribute("course_title",course_title);
			request.getSession().setAttribute("course_type",course_type);
			request.getSession().setAttribute("duration",duration);
			request.getSession().setAttribute("exam_type",exam_type);
			request.getSession().setAttribute("description",description);
			
			String pageName=request.getParameter("pageName");
			if(pageName.equals("UpdateCourse"))
			{
				response.sendRedirect("UpdateCourse.jsp");
			}
			else
			{
				response.sendRedirect("DeleteCourse.jsp");
			}
		}
	}

}
