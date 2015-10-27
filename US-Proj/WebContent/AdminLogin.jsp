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
<div class="admin-bar"><div class="adminBorder"></div></div>
<br/>
<div class="form-content">
<div class="adminPanel">Admin Panel</div>
<div class="loginBox">
<form name="AdminLogin" id="AdminLogin" action="login" method="post">
Username <input type="text" id="userId" name="userId"/><br/><br/>
Password <input type="password" id="userPassword" name="userPassword"/><br/><br/>
<input type="submit" value="Login" class="btn"/>
</form>
<br/>
<font color="Red">
<%if(session.getAttribute("msg")!=null) %><%=session.getAttribute("msg") %>
</font>
</div>
<div class="line"></div>
</div>
</body>
</html>