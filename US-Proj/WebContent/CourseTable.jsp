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
<style type="text/css">
.search_box 
{
  padding: 8px;
  font-family: Verdana;
  font-size: 15px;
  width:40%;
}
</style>


 <script type="text/javascript">
        function doSearch() {
    		var searchText = document.getElementById("searchBox").value;
    		var targetTable = document.getElementById("courseTable");
    		var targetTableColCount;

    		//Loop through table rows
    		for (var rowIndex = 0; rowIndex < targetTable.rows.length; rowIndex++) {
    			var rowData = '';

    			//Get column count from header row
    			if (rowIndex == 0) {
    				targetTableColCount = targetTable.rows.item(rowIndex).cells.length;
    				continue; //do not execute further code for header row.
    			}

    			//Process data rows. (rowIndex >= 1)
    			for (var colIndex = 0; colIndex < targetTableColCount; colIndex++) {
    				var cellText = '';

    				if (navigator.appName == 'Microsoft Internet Explorer')
    					cellText = targetTable.rows.item(rowIndex).cells.item(colIndex).innerText;
    				else
    					cellText = targetTable.rows.item(rowIndex).cells.item(colIndex).textContent;

    				rowData += cellText;
    			}

    			// Make search case insensitive.
    			rowData = rowData.toLowerCase();
    			searchText = searchText.toLowerCase();

    			//If search term is not found in row data
    			//then hide the row, else show
    			if (rowData.indexOf(searchText) == -1)
    				targetTable.rows.item(rowIndex).style.display = 'none';
    			else
    				targetTable.rows.item(rowIndex).style.display = 'table-row';
    		}
    	}
    </script>


</head>
<body>
<jsp:include page="administratorPage.jsp"/>
<div class="form-content">
<h3 align="center">Course Table</h3>
<div align="center"><input type="text" id="searchBox" onkeyup="doSearch()" class="search_box" placeholder="Advance Search"/></div>
<br />

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
    <table id="courseTable" border=1 align="center" cellspacing="0" cellpadding="3">
    <tr><!-- bgcolor="#0066FF" -->
    <th>SLNO.</th>
    <%for(int i=1;i<=col;i++) {%>
    <th><%=rsm.getColumnName(i) %></th> 	   
    <%}%>
    </tr>
    <%!int rowCount=0; %>
    <%while(rs.next()) {rowCount++;%>
    <tr>  <!-- bgcolor="#66CCCC"-->
    <td><%=rowCount %></td>
    <td><%=rs.getString(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getString(3) %></td>
    <td><%=rs.getString(4) %></td>
    <td><%=rs.getString(5) %></td>
    <td><%=rs.getString(6) %></td>
    <!-- <a  href="#"><img src="img/update.png" height="20" onClick="alert('That was not a proper email address')"/></a> -->
    </tr>
    <%} %>
    </table>
    <%}%> 
</div>
</body>
</html>