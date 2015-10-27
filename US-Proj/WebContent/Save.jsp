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
<script>
function onEdit(btn)
{
	
    var id=btn.id;
    if(btn.value=="Edit")
    {
    	
    document.getElementById('course_title'+id).removeAttribute("Readonly");
    document.getElementById('course_type'+id).removeAttribute("Readonly");
    document.getElementById('duration'+id).removeAttribute("Readonly");
    document.getElementById('exam_type'+id).removeAttribute("Readonly");
    document.getElementById('description'+id).removeAttribute("Readonly");
    document.getElementById(id).value="Save";
    return false;
    }
    if(btn.value=="Save")
    {
    	alert(document.getElementById('course_id'+id).value);
    	 var form = document.createElement("form");
    	 document.body.appendChild(form);
    	    
    	    form.method = "POST";
    	    form.action = "UpdateTable";
    	    
    	    var element1 = document.createElement("input"); 
    	    element1.name="course_id";
    	    element1.value=document.getElementById('course_id'+id).value;
    	    element1.type="hidden";
    	    form.appendChild(element1);
    	    
    	    var element2 = document.createElement("input");
    	    element2.name="course_title";
    	    element2.value=document.getElementById('course_title'+id).value;
    	    element2.type="hidden";
    	    form.appendChild(element2); 
    	    
    	    var element3 = document.createElement("input"); 
    	    element3.name="course_type";
    	    element3.value=document.getElementById('course_type'+id).value;
    	    element3.type="hidden";
    	    form.appendChild(element3); 
    	    
    	    var element4 = document.createElement("input");
    	    element4.name="duration";
    	    element4.value=document.getElementById('duration'+id).value;
    	    element4.type="hidden";
    	    form.appendChild(element4); 
    	    
    	    var element5 = document.createElement("input"); 
    	    element5.name="exam_type";
    	    element5.value=document.getElementById('exam_type'+id).value;
    	    element5.type="hidden";
    	    form.appendChild(element5); 
    	    
    	    var element6 = document.createElement("input");
    	    element6.name="description";
    	    element6.value=document.getElementById('description'+id).value;
    	    element6.type="hidden";
    	    form.appendChild(element6); 
    	    
    	    document.body.appendChild(form);
    	    form.submit();
    document.getElementById('course_title'+id).setAttribute("Readonly" , "readonly");
    document.getElementById('course_type'+id).setAttribute("Readonly" , "readonly");
    document.getElementById('duration'+id).setAttribute("Readonly" , "readonly");
    document.getElementById('exam_type'+id).setAttribute("Readonly" , "readonly");
    document.getElementById('description'+id).setAttribute("Readonly" , "readonly");
    document.getElementById(id).value="Edit";
     return false;
    }
    
}
</script>
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
	PreparedStatement ps=con.prepareStatement("SELECT * FROM COURSE");//creating preparedstatement object
    ResultSet rs=ps.executeQuery();//executing statement for getting the data from database & the output will be in the form of ResultSet
    ResultSetMetaData rsm=rs.getMetaData();
    int col=rsm.getColumnCount();%>
    <table border=1 align="center" cellspacing="0" cellpadding="0" bordercolor="#999999" >
    <tr><!-- bgcolor="#0066FF" -->
    <th><font color="black">SLNO.</font></th>
    <%for(int i=1;i<=col;i++) {%>
    <th><font color="black"><%=rsm.getColumnName(i) %></font></th> 	   
    <%}%>
    <th><font color="black">EDIT</font></th>
    </tr>
    <%!int rowCount=0; %>
    <%while(rs.next()) {rowCount++;%>
    <tr>  <!-- bgcolor="#66CCCC"-->
    <td><input type="text" value="<%=rowCount %>" size="2" readonly/></td>
    <td><input type="text" id="course_id<%=rowCount%>" name="course_id<%=rowCount%>" value="<%=rs.getString(1) %>" hspace="0" vspace="0" readonly /></td>
    <td><input type="text" id="course_title<%=rowCount%>" name="course_title<%=rowCount%>" value="<%=rs.getString(2) %>" hspace="0" vspace="0" readonly /></td>
    <td><input type="text" id="course_type<%=rowCount%>" name="course_type<%=rowCount%>" value="<%=rs.getString(3) %>" hspace="0" vspace="0" readonly /></td>
    <td><input type="text" id="duration<%=rowCount%>" name="duration<%=rowCount%>" value="<%=rs.getString(4) %>" hspace="0" vspace="0" readonly /></td>
    <td><input type="text" id="exam_type<%=rowCount%>" name="exam_type<%=rowCount%>" value="<%=rs.getString(5) %>" hspace="0" vspace="0" readonly /></td>
    <td><input type="text" id="description<%=rowCount%>" name="description<%=rowCount%>" value="<%=rs.getString(6) %>" hspace="0" vspace="0" readonly /></td>
    <!-- <a  href="#"><img src="img/update.png" height="20" onClick="alert('That was not a proper email address')"/></a> -->
    <td align="center"><input type="button" id="<%=rowCount%>" value="Edit" onclick="onEdit(this)" class="btn"/></td>
    </tr>
    <%} %>
    </table>
    <%}%> 
    </div>
</body>
</html>