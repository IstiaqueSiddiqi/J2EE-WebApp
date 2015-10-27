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
<div class="content">
<br/>
<table width="55%" border="1" align="center" cellspacing="0" cellpadding="3">
  <tr height="70">
    <th scope="row" colspan="3"><font color="#339933;"  size="5px">Faculty</font></th>
  </tr>
  
  <tr height="40">
    <th scope="row" align="left">Name</th>
    <th scope="row">Qualification</th>
     <th scope="row">Type</th>
  </tr>
 <%!Connection con = DBCon.getCon();
 String msg="";%>
	<%if(con==null)
	{
		msg="Database Connection Failed!!";
	}
	else
	{
		PreparedStatement ps=con.prepareStatement("SELECT F_NAME, TYPE, F_QUALIFICATION FROM TEACHINGSTAFF");//creating preparedstatement object
        ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
        while(rs.next()){%>
  <tr height="30" align="center">
    <td scope="row" align="left"><%=rs.getString("f_name") %></td>
    <td><%=rs.getString("f_qualification") %></td>
    <td><%=rs.getString("type") %></td>
  </tr><%}} %>
</table>
<br/><br/>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>