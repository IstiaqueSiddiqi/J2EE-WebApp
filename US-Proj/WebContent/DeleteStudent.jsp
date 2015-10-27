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
		PreparedStatement ps=con.prepareStatement("SELECT STUDENT_ID FROM STUDENT");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        %>
      <form id="choice" name="choice" action="StudentId" method="post">
    <table width="34%" align="center">
    <tr>
     <th height="63" colspan="2" scope="row">Delete Student Record</th>
     <td><input type="hidden" id="pageName" name="pageName" value="DeleteStudent"/></td>
  	 </tr>
	<tr>
    <th scope="row"><div align="left">Student Id</div></th>
    <td width="54.5%">
    <select name="getId" id="getId" onchange="selectedChoice()"><option value="Select">Select Student ID</option>
    <%while(rs.next())
    {%><option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option><%} %>
    </select>
    </td>  
    </tr>
    </table>
    </form>
    
    <form name="del" action="StudentDelete" method="post">
    <table width="34%" align="center">
    <tr>
    <th scope="row"><div align="left">Course Id</div></th>
    <td>
    <input type="hidden" name="student_id" id="student_id" value="${sessionScope.student_id}" />
    <input type="text" name="course_id" id="course_id" value="${sessionScope.course_id}" readonly/>
    </td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Student Name</div></th>
    <td><input type="text" name="sname" id="sname"  value="${sessionScope.sname}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Gender</div></th>
    <td><input type="text" name="gender" id="gender"  value="${sessionScope.gender}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Date of Birth</div></th>
    <td><input type="text" name="dob" id="dob"  value="${sessionScope.dob}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Father's Name</div></th>
    <td><input type="text" name="fname" id="fname"  value="${sessionScope.fname}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Mother's Name</div></th>
    <td><input type="text" name="fname" id="fname"  value="${sessionScope.fname}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Category</div></th>
    <td><input type="text" name="category" id="category"  value="${sessionScope.category}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Religion</div></th>
    <td><input type="text" name="religion" id="religion"  value="${sessionScope.religion}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Nationality</div></th>
    <td><input type="text" name="nationality" id="nationality"  value="${sessionScope.nationality}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Address</div></th>
    <td><input type="text" name="address" id="address"  value="${sessionScope.address}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Mobile No</div></th>
    <td><input type="text" name="mobileNo" id="mobileNo"  value="${sessionScope.mobileNo}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">e-mail</div></th>
    <td><input type="text" name="email" id="email"  value="${sessionScope.email}"  readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Status</div></th>
    <td><input type="text" name="status" id="status"  value="${sessionScope.status}" readonly/></td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Verification</div></th>
    <td><input type="text" name="verification" id="verification" value="${sessionScope.verification}" readonly/></td>
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