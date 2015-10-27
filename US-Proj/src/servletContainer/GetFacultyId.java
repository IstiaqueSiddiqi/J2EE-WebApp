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
 * Servlet implementation class GetFacultyId
 */
@WebServlet("/FacultyId")
public class GetFacultyId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFacultyId() {
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
			String f_id, course_id="", faculty_name="", type="", faculty_qualification="";
			f_id=request.getParameter("getId");
			try{
				PreparedStatement ps=con.prepareStatement("SELECT COURSE_ID, F_NAME, TYPE, F_QUALIFICATION FROM TEACHINGSTAFF WHERE f_ID="+f_id);//creating preparedstatement object
				ResultSet rs=ps.executeQuery();
				rs.next();
				course_id=rs.getString("course_id");
				faculty_name=rs.getString("f_name");
				type=rs.getString("type");
				faculty_qualification=rs.getString("f_qualification");
			
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
           }catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			//request.getSession().setAttribute("msg",msg);
			request.getSession().setAttribute("f_id",f_id);
			request.getSession().setAttribute("course_id",course_id);
			request.getSession().setAttribute("faculty_name",faculty_name);
			request.getSession().setAttribute("type",type);
			request.getSession().setAttribute("faculty_qualification",faculty_qualification);
			
			String pageName=request.getParameter("pageName");
			if(pageName.equals("UpdateFaculty"))
			{
				response.sendRedirect("UpdateFaculty.jsp");
			}
			else
			{
				response.sendRedirect("DeleteFaculty.jsp");
			}
		}
	}

}
