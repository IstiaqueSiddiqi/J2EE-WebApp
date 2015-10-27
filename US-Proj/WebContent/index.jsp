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

<title>Welcome to Aliah University, Kolkata</title>
</head>
<body>
<jsp:include page="Header.jsp" />
<div class="slide-show"><img src="img/au.jpg" width="100%" height="350"/></div>
<div class="content">
<div class="innerContent" style="padding-left:0px;	padding-right:0px;">

<!-- <div style="margin-left:20px; margin-right:20px;">
<p><font color="#339933;" style="font-family:papyrus; font-weight:bold">VISION AND MISSION</font></p>
<p>
Aliah University is marching on with a vision to recapture the ambience and dynamic cultural heritage of the
Madrasah system, to expand and deepen it, to evolve it further with a successful outreach into the emerging areas in
each branch of modern science, technology, social studies, and humanities. It aims to instill the dynamism of its
glorious heritage of the past among all its students, so that they can successfully cope with the critical needs and
challenges of the present and contribute to the future advancement of science, technology, and human civilization. It
also hopes to develop within its students the love and respect for the fellow citizens of the country and to cherish the
ideals of secularism and national integrity.
</p>

<p><font color="#339933;" style="font-family:papyrus; font-weight:bold">MOTTO OF THE UNIVERSITY</font></p>
<p>
The motto of the University is "Advancement of Education and Culture", in Arabic, "Taqdeem-ut-Ta'leem waasSaqafah."
</p>
</div> -->
<%!Connection con = DBCon.getCon();
 String msg="";%>
	<%if(con==null)
	{
		msg="Database Connection Failed!!";
	}
	else
	{
		PreparedStatement ps=con.prepareStatement("SELECT EVENT_DATE, DESCRIPTION, VENUE FROM EVENTS");//creating preparedstatement object
		PreparedStatement pstm=con.prepareStatement("SELECT DESCRIPTION FROM NEWS");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();
		ResultSet rs1=pstm.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        %>
<div class="event">
<div class="event-head">EVENTS</div>
<div class="event-body"><%while(rs.next()){%>
<font color="#339933"><strong><%=rs.getString("EVENT_DATE") %>:</strong></font> <%=rs.getString("DESCRIPTION") %>  at <%=rs.getString("VENUE") %><br/><br/><%} %>
</div>
</div>

<div class="announcement">
<div class="announcement-head">ANNOUNCEMEMT</div>
<div class="announcement-body">No Announcement Yet..</div>
</div>


<div class="news">
<div class="news-head">NEWS</div>
<div class="news-body"><marquee direction="up" scrolldelay="150" scrollamount="4" height="350" onmouseover="stop()" onmouseout="start()"><%while(rs1.next()){%><p><a href="News.jsp" class="linkStyle" ><%=rs1.getString("DESCRIPTION") %> <%} %></a></p></marquee></div>
</div><%} %>
</div>
</div>
<br/>
<jsp:include page="Footer.jsp" />
</body>
</html>