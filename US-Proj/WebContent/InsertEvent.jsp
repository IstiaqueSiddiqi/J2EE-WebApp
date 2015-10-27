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
</SCRIPT>
</head>
<body>

<jsp:include page="administratorPage.jsp"/>
<!--<jsp:include page="administratorPage.jsp" />-->

<div class="form-content">
<form name="insert" action="AddEvent" method="post">
<table width="34%" align="center">
	<tr>
    <th height="63" colspan="2" scope="row">Add New Event</th>
  </tr>
   <tr>
    <th scope="row"><div align="left">Date Posted</div></th>
   <td>
    <%java.util.Date date = new java.util.Date(); 
    String todayDate=new java.text.SimpleDateFormat("MMM-dd-yyyy").format(date);%>
   <input type="text" name="date_posted" value="<%=todayDate %>" readonly/>
   </td>
   </tr>
   <tr>
    <th scope="row"><div align="left">Event Date</div></th>
   <td>
    <input type="date" name="event_date"/>
   </td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Event Description</div></th>
    <td><textarea name="description"></textarea></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Venue</div></th>
    <td><textarea name="venue"></textarea></td>
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
</form>
</div>
</body>
</html>