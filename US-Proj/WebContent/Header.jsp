<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
<link href="stylesheet/style.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>

</head>
<body class="container">
<div class="header">

<div class="navbar">
<div class="left-navbar">
<ul>
<li class="navbar-style"><a href="StudentLogin.jsp">Students</a></li>
<li class="navbar-style"><a href="Faculty.jsp">Faculty</a></li>
<li class="navbar-style"><a href="Alumni.jsp">Alumni</a></li>
</ul>
</div>
<div class="searchbar">
<form class="search-navbar-style" method="get" action="https://www.google.co.in/webhp?gws_rd=cr&ei=FoF6UpLdJsm3rgfU9YHAAQ#q=aliah+university" name="search" target="_blank">
        	<input class="searchBorserStyle" type="text" placeholder="Search" />
        </form>
</div>
<div class="right-navbar">
<ul>
<li class="navbar-style"><a href="Academic Calender.jsp">Calender</a></li>
<li class="navbar-style"><a href="Map.jsp">Map</a></li>
<li class="navbar-style"><a href="Directory.jsp">Directory</a></li>
</ul>
</div>
</div>

<div class="banner">
<div class="aliahlogo"><a href="index.jsp"><img src="img/aliah.png" width="143" height="137" alt="aliahlogo"></a></div>

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
<!--<div style="height:50px;">
<div style="border:1px solid #339933; height:50px; float:left; width:49.8%; background-color: #339933;">
<marquee direction="right" scrollamount="3" scrolldelay="5" width="95%"><img src="img/surahalaq1.jpg" /></marquee>
</div>
<div style="border:1px solid #339933; height:35px; float:right; width:49.9%; background-color: #339933; padding-top:15px;" align="right">
<marquee scrollamount="2" scrolldelay="10" direction="left" width="95%">Taught man that which he knew not.</marquee>
</div>
</div>  -->
<div class="menu">
<ul id="MenuBar1" class="MenuBarHorizontal">
  <li><a class="MenuBarItemSubmenu" href="#">ABOUT AU</a>
    <ul>
      <li><a href="Founder.jsp">Founder</a></li>
      <li><a href="History.jsp">History</a></li>
      <li><a href="VC.jsp">VC's Welcome</a></li>
      <li><a href="Administration.jsp">Administration</a></li>
      <li><a href="VacantPost.jsp">Vaccant Positions</a></li>
    </ul>
  </li>
  <li> <a href="#">ADMISSION</a>
      <ul>
        <li><a href="UgAdmission.jsp">Undergraduate</a></li>
        <li><a href="PgAdmission.jsp">Postgraduate</a></li>
        <li><a href="phdAdmission.jsp">Ph. D</a></li>
        <li><a href="InformationBrochure_2013.pdf" target="_blank">AUAT- Information Brouchure</a></li>
        <li><a href="PhDMatter_Spring_2013-14.pdf" target="_blank">AURET- Information Brouchure</a></li>
    </ul>
    
  </li>
  <li><a class="MenuBarItemSubmenu" href="#">ACADEMIC</a>
    <ul>
      <li><a class="MenuBarItemSubmenu" href="#">Course of Study</a>
        <ul>
          <li><a href="Ug.jsp">Undergraduate</a></li>
          <li><a href="Pg.jsp">Postgraduate</a></li>
          <li><a href="Phd.jsp">Ph. D</a></li>
        </ul>
      </li>
      <li><a href="Curricula.jsp">Academic Department</a></li>
      <li><a href="Faculty.jsp">Faculties</a></li>
      <li><a href="Academic Calender.jsp">Academic Calender</a></li>
    </ul>
  </li>
  <li><a href="Research.jsp">RESEARCH</a></li>
  <li><a href="PhotoGallery.jsp">CAMPUS LIFE</a></li>
  <li><a href="#">TRAINING & PLACEMENT</a>
  	 <ul>
          <li><a href="Skill_pertining_to_Interview_cracking_2.pdf" target="_blank">Training</a></li>
          <li><a href="Placement.jsp">Placement</a></li>
          <li><a href="SkillDev.jsp">Skill Development Areas</a></li>
        </ul>
  </li>
</ul> 
</div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>