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
	var message=document.update.mesg.value;
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
		PreparedStatement ps=con.prepareStatement("SELECT COURSE_ID FROM COURSE");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        %>
     <!--<form id="choice" name="choice" action="SelectRow" method="post"> <form name="update" action="UpdateTable" method="post"> -->
    <form id="choice" name="choice" action="SelectRow" method="post">
    <table width="34%" align="center">
    <tr>
     <th height="63" colspan="2" scope="row">Update Course</th>
     <td><input type="hidden" id="pageName" name="pageName" value="UpdateCourse"/></td>
  	 </tr>
	<tr>
    <th scope="row"><div align="left">Course Id</div></th>
    <td width="62%">
    <select name="getId" id="getId" onchange="selectedChoice()" ><option value="Select">Select Course ID</option>
    <%while(rs.next())
    {%><option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option><%} %>
    </select>
    
    </td>  
    </tr>
    </table>
    </form> 
    
    <form name="update" action="UpdateTable" method="post">
    <table width="34%" align="center">
    <tr>
    <th scope="row"><div align="left">Course Name</div></th>
    <td>
    <input type="hidden" name="course_id" id="course_id" value="${sessionScope.course_id}"/>
    <input type="text" name="course_title" id="course_title" value="${sessionScope.course_title}"/>
    </td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Course Type</div></th>
    <td><input type="text" name="course_type" id="course_type"  value="${sessionScope.course_type}"/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Duration</div></th>
    <td><input type="text" name="duration" id="duration" value="${sessionScope.duration}" /></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Exam Type</div></th>
    <td><input type="text" name="exam_type" id="exam_type" value="${sessionScope.exam_type}" /></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Description</div></th>
    <td><textarea name="description" id="description">${sessionScope.description}</textarea></td>
    </tr>
    <tr>
    <td colspan="2"><input type="hidden" name="mesg" value="${sessionScope.msg}" /></td>
    </tr>
    <tr>
    <th scope="row">&nbsp;</th>
    <td>
    <input type="submit" value="Save" onClick = message() class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" class="btn"/>
    </td>
    </tr>
    </table>
    </form><%} %>
    </div>
</body>
</html>