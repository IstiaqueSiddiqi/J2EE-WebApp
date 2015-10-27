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
 * Servlet implementation class GetStudentId
 */
@WebServlet("/StudentId")
public class GetStudentId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudentId() {
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
			String student_id, course_id="", sname="", gender="", dob="", fname="", mname="", category="", religion="", nationality="", address="", mobileNo="", email="", status="", verification="";
			student_id=request.getParameter("getId");
			try{
				PreparedStatement ps=con.prepareStatement("SELECT COURSE_ID, SNAME, GENDER, DOB, FNAME, MNAME, CATEGORY, RELIGION, NATIONALITY, ADDRESS, MOBILENO, EMAIL, STATUS, VERIFICATION FROM STUDENT WHERE STUDENT_ID="+student_id);//creating preparedstatement object
				ResultSet rs=ps.executeQuery();
				rs.next();
				course_id=rs.getString("course_id");
				sname=rs.getString("sname");
				gender=rs.getString("gender");
				dob=rs.getString("dob");
				fname=rs.getString("fname");
				mname=rs.getString("mname");
				category=rs.getString("category");
				religion=rs.getString("religion");
				nationality=rs.getString("nationality");
				address=rs.getString("address");
				mobileNo=rs.getString("mobileNo");
				email=rs.getString("email");
				status=rs.getString("status");
				verification=rs.getString("verification");
			
            /*used for altering the databases & used for insert,update,delete, drop.
             * And int value denotes the number of rows affected by the query
             */
           }catch(Exception e){
				System.out.println(e);
				msg="databse error..";
			}
			//request.getSession().setAttribute("msg",msg);
			request.getSession().setAttribute("student_id",student_id);
			request.getSession().setAttribute("course_id",course_id);
			request.getSession().setAttribute("sname",sname);
			request.getSession().setAttribute("gender",gender);
			request.getSession().setAttribute("dob",dob);
			request.getSession().setAttribute("fname",fname);
			request.getSession().setAttribute("mname",mname);
			request.getSession().setAttribute("category",category);
			request.getSession().setAttribute("religion",religion);
			request.getSession().setAttribute("nationality",nationality);
			request.getSession().setAttribute("address",address);
			request.getSession().setAttribute("mobileNo",mobileNo);
			request.getSession().setAttribute("email",email);
			request.getSession().setAttribute("status",status);
			request.getSession().setAttribute("verification",verification);
			
			String pageName=request.getParameter("pageName");
			if(pageName.equals("UpdateStudent"))
			{
				response.sendRedirect("UpdateStudent.jsp");
			}
			else if(pageName.equals("DeleteStudent"))
			{
				response.sendRedirect("DeleteStudent.jsp");
			}
		}
	}

}
