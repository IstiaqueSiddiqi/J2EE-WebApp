<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css" />
<link href="AdminMenu/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<script src="AdminMenu/SpryMenuBar.js" type="text/javascript"></script>

</head>
<body class="container">

<div class="banner">
<div class="aliahlogo"><a href="index.jsp"><img src="img/aliah.png" width="143" height="137" alt="aliahlogo" /></a></div>
<div class="aliahheading">
		<a href="index.jsp">
    	<img src="img/heading1.jpg" width="200" height="44" alt="urduheading" /><br>
        <img src="img/heading2.jpg" width="200" height="44" alt="bengaliheading" />
        </a>
</div>
<div class="aliah-university"><a href="index.jsp">ALIAH<br />UNIVERSITY</a>
<div class="subhead">(A UGC approved autonomous Institution under the Dept. of Minority Affairs and Madrasah Education, Govt. of West Bengal)</div>
</div>
</div>

<div class="admin-bar">
<div class="adminBorder">
<div align="right">
<%if(session.getAttribute("username")!=null){ %><strong>Welcome, <%=session.getAttribute("username") %></strong>
<%java.util.Date date = new java.util.Date(); 
String todayDate=new java.text.SimpleDateFormat("EEE, dd-MMM-yyyy hh:mm a").format(date);%>
&nbsp;[<a href="AdminLogin.jsp"><font color="#FFFFFF"><strong>Logout</a></strong></font>] &nbsp;[<%=todayDate %>]<%} %>
</div>
</div>
</div>
</body>
</html>