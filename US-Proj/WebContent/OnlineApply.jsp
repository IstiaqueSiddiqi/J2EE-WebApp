<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Application</title>
</head>
<body>
<jsp:include page="Header.jsp" />
<br/>
<div class="content">
<div class="innerContent">
<font color="#339933;" size="5px"><p align="center">Online Application</p></font>
<table border="0" >
	<thead></thead>
    <tbody>
    <tr><td colspan="4"><strong>Personal Details</strong></td></tr>
    <tr>
    <td>Application No:</td><td> <input type="text" /></td><td>&nbsp;</td><td><area /><br /><input type="file" /></td>
    </tr>
    <tr>
    <td>Applicant Name</td><td><input type="text" placeholder="First Name" /></td><td><input type="text" placeholder="Middle Name" /></td><td><input type="text" placeholder="Last Name" /></td>
    </tr>
    <tr>
    <td>Gender</td><td><select><option>MALE</option><option>FEMALE</option><option>OTHER</option></select></td><td>Date of Birth</td><td><input type="date" /></td>
    </tr>
    <tr>
    <td>Father's Name</td><td><input type="text" /></td><td>Mother's Name</td><td><input type="text" /></td>
    </tr>
    <tr>
    <td>Category</td><td><select><option>GEN</option><option>SC</option><option>ST</option><option>OBC</option></select></td><td>Religion</td><td><input type="text" /></td>
    </tr>
    <tr>
    <td>Nationality</td><td><input type="text" /></td><td>Person with Disability</td><td><select><option>YES</option><option>NO</option></select></td>
    </tr>
    <tr>
    <td>Address</td><td><textarea></textarea></td><td>Phone</td><td><input type="text" /></td>
    </tr>
    <tr>
    <td>Mobile</td><td><input type="text" /></td><td>e-mail</td><td><input type="email" /></td>
    </tr>
    <tr><td colspan="4"><strong>Application Fee Details</strong></td></tr>
    <tr><td>Demand Draft Number <input type="text" /></td><td>Amount <input type="text" /></td><td>Date of Issue <input type="date" /></td><td>Bank's Name <input type="text" /></td></tr>
    <tr><td colspan="4"><strong>Educational Details</strong></td></tr>
    <tr><td colspan="4">
    <table border="1" width="100%">
    <tr align="center"><td>Qualification</td><td>Board/University</td><td>%/CGPA</td><td>Year of Passing</td></tr>
    <tr align="center"><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td></tr>
    <tr align="center"><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td></tr>
    <tr align="center"><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td></tr>
    <tr align="center"><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td></tr>
    <tr align="center"><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td></tr>
    <tr align="center"><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td><td><input type="text" /></td></td></tr>
    </table>
    </td></tr>
    <tr><td colspan="4">
    <p ><strong>Declaration by the Candidate</strong></p>
    
    <p><input type="checkbox" /> I have carefully read the admission eligibility requirements and I understand that my candidature is liable to be cancelled if any declaration made by me is found to be incorrect or if I am not found eligible for admission at any stage.</p>
    </td></tr>
    
    </tbody>
    <tfoot>
    <tr><td colspan="4" align="center"><input type="submit" class="btn"/> <input type="reset" class="btn"/></td></tr>
    </tfoot>
 </table>
</div>
</div>
<br/><br/>
<jsp:include page="Footer.jsp" />
</body>
</body>
</html>