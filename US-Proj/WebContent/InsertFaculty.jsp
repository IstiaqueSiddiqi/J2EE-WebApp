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
<form name="insert" action="NewFaculty" method="post">
<table width="34%" align="center">
	<tr>
    <th height="63" colspan="2" scope="row">New Faculty</th>
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
    <th scope="row"><div align="left">Faculty Name</div></th>
    <td><input type="text" name="faculty_name" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Faculty Type</div></th>
    <td>
    <select name="type">
    <option value="Part-Time">Part-Time</option>
    <option value="Full-Time">Full-Time</option>
    </select>
    <!-- <input type="text" name="type" /> -->
    </td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Highest Qualification</div></th>
    <td><input type="text" name="faculty_qualification" /></td>
  </tr>
  <tr><td colspan="2"><input type="hidden" name="mesg" value="${sessionScope.msg1}" /></td></tr>
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