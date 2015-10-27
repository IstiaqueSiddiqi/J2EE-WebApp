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
 * Servlet implementation class UpdateStudentTable
 */
@WebServlet("/UpdateStudent")
public class UpdateStudentTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentTable() {
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
			String student_id, course_id, sname, gender, dob, fname, mname, category, religion, nationality, address, mobileNo, email, status, verification;
			student_id=request.getParameter("student_id");
			course_id=request.getParameter("course_id");
			sname=request.getParameter("sname");
			gender=request.getParameter("gender");
			dob=request.getParameter("dob");
			fname=request.getParameter("fname");
			mname=request.getParameter("mname");
			category=request.getParameter("category");
			religion=request.getParameter("religion");
			nationality=request.getParameter("nationality");
			address=request.getParameter("address");
			mobileNo=request.getParameter("mobileNo");
			email=request.getParameter("email");
			status=request.getParameter("status");
			verification=request.getParameter("verification");
			try{
				
			PreparedStatement ps1=con.prepareStatement("DELETE STUDENT WHERE STUDENT_ID=?");
			ps1.setString(1,student_id);
			ps1.executeUpdate();
			PreparedStatement ps=con.prepareStatement("INSERT INTO STUDENT VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");//creating preparedstatement object
            ps.setString(1,student_id);
            ps.setString(2,course_id);
            ps.setString(3,sname);
            ps.setString(4,gender);
            ps.setString(5,dob);
            ps.setString(6,fname);
            ps.setString(7,mname);
            ps.setString(8,category);
            ps.setString(9,religion);
            ps.setString(10,nationality);
            ps.setString(11,address);
            ps.setString(12,mobileNo);
            ps.setString(13,email);
            ps.setString(14,status);
            ps.setString(15,verification);
            
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
			response.sendRedirect("UpdateStudent.jsp");
		}
	}

}
