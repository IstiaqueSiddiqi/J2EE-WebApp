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
		PreparedStatement ps=con.prepareStatement("SELECT EVENT_ID FROM EVENTS");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        %>
     <form id="choice" name="choice" action="EventId" method="post">
    <table width="34%" align="center">
    <tr>
     <th height="63" colspan="2" scope="row">Delete Event</th>
     <td><input type="hidden" id="pageName" name="pageName" value="DeleteEvent"/></td>
  	 </tr>
	<tr>
    <th scope="row"><div align="left">Event Id</div></th>
    <td width="55.5%">
    <select name="getId" id="getId" onchange="selectedChoice()"><option value="Select">Select Event ID</option>
    <%while(rs.next())
    {%><option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option><%} %>
    </select>
    </td>  
    </tr>
    </table>
    </form>
    
    <form name="del" action="EventDelete" method="post">
    <table width="34%" align="center">
    <tr>
    <th scope="row"><div align="left">Last Date Posted</div></th>
    <td>
    <input type="hidden" name="event_id" id="event_id" value="${sessionScope.event_id}" />
    <input type="text" name="last_posted" id="last_posted"  value="${sessionScope.date_posted}" readonly/>
    </td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Last Event Date</div></th>
    <td>
    <input type="text" name="last_event_date" id="last_event_date"  value="${sessionScope.event_date}" readonly/>
    </td>
    </tr>
    <tr>
    <th scope="row"><div align="left">Dated Posted</div></th>
   <td>
   <%java.util.Date date = new java.util.Date(); 
    String todayDate=new java.text.SimpleDateFormat("MMM-dd-yyyy").format(date);%> 
   <input type="text" name="date_posted" value="<%=todayDate %>" readonly/>
   </td>
  </tr>
    <tr>
    <th scope="row"><div align="left">New Event Date</div></th>
   <td>
   <input type="date" name="event_date"/>
   </td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Event Description</div></th>
    <td><textarea name="description" readonly>${sessionScope.description}</textarea></td>
  </tr>
  <tr>
    <th scope="row"><div align="left">Venue</div></th>
    <td><textarea name="venue" readonly>${sessionScope.venue}</textarea></td>
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