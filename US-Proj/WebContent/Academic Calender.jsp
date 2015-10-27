<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Academic Calender</title>
<!--<style type="text/css">
	.linkStyle
	{
		color:#000;
	}
	.linkStyle:hover
	{
	text-decoration:underline
	}
</style>-->

</head>
<body>
<jsp:include page="Header.jsp" />
<div class="content">
<div class="innerContent">
<br/><br/><br/><br/>
<center class="fontStyle">
<a href="Academic_Calendar_Even_Semester.pdf" class="linkStyle" target="_blank">
	Academic Calendar: Session 2012-2013 (Even Semester) with list of Holidays</a><br/><br/><br/>
<a href="Academic_Calendar_Odd_Semester.pdf" class="linkStyle" target="_blank">
Academic Calendar: Session 2012-2013 (Odd Semester) with list of Holidays</a>
</center>
</div>
</div>
<br/><br/>
<jsp:include page="Footer.jsp" />
</body>
</html>