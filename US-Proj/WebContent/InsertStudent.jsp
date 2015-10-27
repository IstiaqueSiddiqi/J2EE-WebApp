<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="model.DBCon"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.annotation.WebServlet"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<SCRIPT language = javascript>
function message() 
{
	 var message=document.insert.mesg.value;
	  alert(message);
}
</SCRIPT>
</head>
<body>

<jsp:include page="administratorPage.jsp"/>
<div class="form-content">
<%!Connection con = DBCon.getCon();
   String msg="";%>
	<%if(con==null)
	{
		msg="Database Connection Failed!!";
	}
	else
	{
		PreparedStatement ps=con.prepareStatement("SELECT COURSE_ID FROM COURSE");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        %>
<form name="insert" action="NewStudent" method="post">
<table width="34%" align="center">
	<tr>
    <th height="63" colspan="2" scope="row">New Student</th>
  </tr>
    <tr>
    <th scope="row"><div align="left">Course Id</div></th>
    <td>
    <select name="course_id"><option value="Select">Select Course ID</option>
    <%while(rs.next())
    {%><option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option><%} %>
    </select>
    </td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Student Name</div></th>
    <td><input type="text" name="sname" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Gender</div></th>
    <td>
    <select name="gender">
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
    </select>
    </td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Date of Birth</div></th>
    <td><input type="date" name="dob" /></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Father's Name</div></th>
    <td><input type="text" name="fname" /></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Mother's Name</div></th>
    <td><input type="text" name="mname" /></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Category</div></th>
    <td>
	<select name="category">
    <option value="GEN">GEN</option>
    <option value="SC">SC</option>
    <option value="ST">ST</option>
    <option value="OBC">OBC</option>
    </select>
	</td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Religion</div></th>
    <td><input type="text" name="religion" /></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Nationality</div></th>
    <td><input type="text" name="nationality" /></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Address</div></th>
    <td><textarea name="address"></textarea></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">Mobile No</div></th>
    <td><input type="text" name="mobileNo" /></td>
  </tr>
   <tr>
    <th scope="row"><div align="left">e-mail</div></th>
    <td><input type="email" name="email" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Status</div></th>
    <td><input type="text" name="status" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Verification</div></th>
    <td>
    <select name="verification">
    <option value="Verified">Verified</option>
    <option value="Not Verified">Not Verified</option>
    </select>
    <!-- <input type="text" name="verification" /> -->
    </td>
  </tr>
  <tr><td colspan="2"><input type="hidden" name="mesg" value="${sessionScope.msg}" /></td></tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td><input type="submit" value="Submit" onClick = message() class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" class="btn"/>
</td>
  </tr>
  <%--
  <%if(session.getAttribute("msg")!=null){ %>
  <tr>
  <td colspan="2"><%=session.getAttribute("msg") %></td>
  </tr>
  <%} %>
  --%>
</table>
</form><%} %>
</div>
</body>
</html>