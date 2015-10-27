<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

function resetValue() 
{
	var v=document.getElementById("mesg").value="";
}
</SCRIPT>
</head>
<body onLoad="resetValue()">

<jsp:include page="administratorPage.jsp"/>
<!--<jsp:include page="administratorPage.jsp" />-->

<div class="form-content">
<form name="insert" action="NewCourse" method="post">
<table width="34%" align="center">
	<tr>
    <th height="63" colspan="2" scope="row">New Course</th>
  </tr>
    <tr>
    <th scope="row"><div align="left">Course Name</div></th>
    <td><input type="text" name="course_title" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Course Type</div></th>
    <td>
    <select name="course_type">
    <option>Select Course Type</option>
    <option value="UG">UG</option>
    <option value="PG">PG</option>
    <option value="Ph.D">Ph.D</option>
    <option value="Diploma">Diploma</option>
    </select>
    <!-- <input type="text" name="course_type" /> -->
    </td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Duration</div></th>
    <td><input type="text" name="duration" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Exam Type</div></th>
    <td><input type="text" name="exam_type" /></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Description</div></th>
    <td><textarea name="description"></textarea></td>
  </tr>
  <tr><td colspan="2"><input type="hidden" name="mesg" id="mesg" value="${sessionScope.msg}" /></td></tr>
  <tr>
    <th scope="row">&nbsp;</th>
    <td><input type="submit" value="Submit" onClick = message() class="btn"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="Reset" class="btn" />
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
</form>
</div>
</body>
</html>