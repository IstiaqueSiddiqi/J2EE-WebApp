<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="Header.jsp" />
<br/><br/>
<table width="50%"  border="0" align="center">
  <tr>
    <th height="54" colspan="4" scope="row">Student Details</th>
    <td><input type="hidden" id="pageName" name="pageName" value="StudentPage"/></td>
  </tr>
  <tr>
    <td width="21%" scope="row"><div align="left">Student Name</div></td>
    <td colspan="3"><input type="text" name="sname" id="sname"  value="${sessionScope.sname}"  readonly/></td>
  </tr>
  <tr>
    <td scope="row"><div align="left">Gender</div></td>
    <td width="31%"><input type="text" name="gender" id="gender"  value="${sessionScope.gender}"  readonly/></td>
    <td width="20%">Date of Birth</td>
    <td width="28%"><input type="text" name="dob" id="dob"  value="${sessionScope.dob}"  readonly/></td>
  </tr>
  <tr>
    <td height="27" scope="row"><div align="left">Father's Name</div></td>
    <td><input type="text" name="fname" id="fname"  value="${sessionScope.fname}"  readonly/></td>
    <td>Mother's Name</td>
    <td><input type="text" name="fname" id="fname"  value="${sessionScope.fname}"  readonly/></td>
  </tr>
  <tr>
    <td scope="row"><div align="left">Category</div></td>
    <td><input type="text" name="category" id="category"  value="${sessionScope.category}"  readonly/></td>
    <td>Religion</td>
    <td><input type="text" name="religion" id="religion"  value="${sessionScope.religion}"  readonly/></td>
  </tr>
  <tr>
    <td scope="row"><div align="left">Nationality</div></td>
    <td><input type="text" name="nationality" id="nationality"  value="${sessionScope.nationality}"  readonly/></td>
    <td>Mobile</td>
    <td><input type="text" name="mobileNo" id="mobileNo"  value="${sessionScope.mobileNo}"  readonly/></td>
  </tr>
  <tr>
    <td scope="row"><div align="left">e-mail</div></td>
    <td colspan="3"><input type="text" name="email" id="email"  value="${sessionScope.email}"  readonly/></td>
  </tr>
  <tr>
    <td height="43" scope="row"><div align="left">Address</div></td>
    <td colspan="3"><textarea name="address" readonly>${sessionScope.address}</textarea> </td>
  </tr>
  <tr>
    <th height="54" colspan="4" scope="row">
    <form action="index.jsp">
    <input type="submit" value="Logout" class="btn" />
    </form>
    </th>
  </tr>
</table>

<br/><br/><br/><br/>
<jsp:include page="Footer.jsp" />
</body>
</html>