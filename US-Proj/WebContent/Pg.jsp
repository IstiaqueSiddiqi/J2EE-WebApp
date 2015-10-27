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
</head>
<body>
<jsp:include page="Header.jsp" />
<br/>
<div class="content">
<div class="innerContent">
<div class="left">
<font color="#339933;" size="5px">Postgraduate Courses</font><br/><br/><br/>
<table width="90%" border="1" align="center" cellspacing="0" cellpadding="3">
  <tr height="40">
  	<th align="left" scope="row">SL No.</th>
   	<th align="left" scope="row">PROGRAME/COURSE NAME</th>
  	<th align="center" scope="row">COURSE TYPE</th>
  	<th align="center" scope="row">DURATION</th>  
  	<th align="center" scope="row">
  	<table width="100%" cellspacing="0" cellpadding="3">
  	  <tr>
  	    <th scope="row" colspan="3">NUMBER OF INTAKES</th>
	    </tr>
  	  <tr>
  	    <th scope="row">GE*</th>
  	    <th>PC**</th>
  	    <th>TOTAL</th>
	    </tr>
    </table>
  	</th>  
  </tr>
  <%!Connection con = DBCon.getCon();
   String msg="";%>
	<%if(con==null)
	{
		msg="Database Connection Failed!!";
	}
	else
	{
		PreparedStatement ps=con.prepareStatement("SELECT COURSE_TITLE, COURSE_TYPE, DURATION FROM COURSE WHERE COURSE_TYPE='PG'");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        int rowCount=0;
        while(rs.next()){rowCount++;%>
  <tr height="40">
  	<td align="left"><%=rowCount %></td>
  	<td align="left"><%=rs.getString("course_title") %></td>
  	<td align="center"><%=rs.getString("course_type") %></td>
  	<td align="center"><%=rs.getString("duration") %></td>
  	<td align="center">
	<table width="100%" cellspacing="0" cellpadding="3">
  	  <tr>
  	    <td>35</td>
  	    <td>01</td>
  	    <td>36</td>
	    </tr>
    </table>
	</td>
  </tr><%}} %>
</table>
</div>
<br/>
<span class="fontStyle">*GN - General **PC-Physically Challenged</span>
<br/><br/><br/><br/>
<strong class="fontStyle">Download: </strong>
<a href="InformationBrochure_2013.pdf" target="_blank" class="linkStyle">AUAT-Information Brouchure</a>
</div>
</div>
<br/><br/><br/><br/>
<jsp:include page="Footer.jsp" />
</body>
</html>