<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Header.jsp" />
<br/>
<div class="form-content">
<div class="adminPanel">Student Login</div>
<div class="loginBox">
<form name="ValidateStudent" id="ValidateStudent" action="StudentValidation" method="post" class="fontStyle">
<br/>Student Id <input type="text" id="SId" name="SId"/><br/><br/>
<input type="submit" value="Login" class="btn"/>
</form>
<br/>
<font color="Red">
<%if(session.getAttribute("msg")!=null) %><%=session.getAttribute("msg") %>
</font>
</div>
<div class="line"></div>
</div>
<br/><br/>
<jsp:include page="Footer.jsp" />
</body>
</html>