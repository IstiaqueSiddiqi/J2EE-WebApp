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
 * Servlet implementation class InsertFaculty
 */
@WebServlet("/NewFaculty")
public class InsertFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFaculty() {
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
			String faculty_id, course_id, faculty_name, type, faculty_qualification;
			course_id=request.getParameter("course_id");
			faculty_name=request.getParameter("faculty_name");
			type=request.getParameter("type");
			faculty_qualification=request.getParameter("faculty_qualification");
			try{
				PreparedStatement ps1=con.prepareStatement("SELECT FACULTYID.NEXTVAL FROM DUAL");//creating preparedstatement object
				ResultSet rs1=ps1.executeQuery();
				rs1.next();
				faculty_id=rs1.getString(1);
			PreparedStatement ps=con.prepareStatement("INSERT INTO TEACHINGSTAFF VALUES(?,?,?,?,?)");//creating preparedstatement object
            ps.setString(1,faculty_id);
            ps.setString(2,course_id);
            ps.setString(3,faculty_name.toUpperCase());
            ps.setString(4,type.toUpperCase());
            ps.setString(5,faculty_qualification.toUpperCase());
            
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
			response.sendRedirect("InsertFaculty.jsp");
		}
	}

}
