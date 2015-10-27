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
	var message=document.del.mesg.value;
	 alert(message);
}

function selectedChoice()
{
	document.getElementById('choice').submit();
}

/*function resetField()
{
	document.getElementById("course_id").value="";
	document.getElementById("course_title").value="";
	document.getElementById("course_type").value="";
	document.getElementById("description").value="";
	document.getElementById("duration").value="";
	document.getElementById("exam_type").value="";
}*/

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
		PreparedStatement ps=con.prepareStatement("SELECT f_ID FROM TEACHINGSTAFF");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        %>
      <form id="choice" name="choice" action="FacultyId" method="post">
    <table width="34%" align="center">
    <tr>
     <th height="63" colspan="2" scope="row">Delete Faculty Record</th>
     <td><input type="hidden" id="pageName" name="pageName" value="DeleteFacultyt"/></td>
  	 </tr>
	<tr>
    <th scope="row"><div align="left">Faculty Id</div></th>
    <td width="47.5%">
    <select name="getId" id="getId" onchange="selectedChoice()"><option value="Select">Select Faculty ID</option>
    <%while(rs.next())
    {%><option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option><%} %>
    </select>
    </td>  
    </tr>
    </table>
    </form>
    
    <form name="del" action="FacultyDelete" method="post">
    <table width="34%" align="center">
    <tr>
    <th scope="row"><div align="left">Course Id</div></th>
    <td>
    <input type="hidden" name="f_id" id="f_id" value="${sessionScope.f_id}" />
    <input type="text" name="course_id" id="course_id" value="${sessionScope.course_id}" readonly/>
    </td>
    </tr>
     <tr>
    <th scope="row"><div align="left">Faculty Name</div></th>
    <td><input type="text" name="faculty_name" value="${sessionScope.faculty_name}"/></td>
  </tr>
    <tr>
    <th scope="row"><div align="left">Faculty Type</div></th>
    <td><input type="text" name="type" id="type"  value="${sessionScope.type}"/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Highest Qualification</div></th>
    <td><input type="text" name="faculty_qualification" value="${sessionScope.faculty_qualification}"/></td>
  </tr>
    <tr>
    <td colspan="2"><input type="hidden" name="mesg" value="${sessionScope.msg}" /></td>
    </tr>
    <tr>
    <th scope="row">&nbsp;</th>
    <td>
    <input type="submit" value="Delete" onClick = message() class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" class="btn"/>
    </td>
    </tr>
    </table>
    </form><%} %>
    </div>
</body>
</html>