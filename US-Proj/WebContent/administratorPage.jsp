<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="AdminHeader.jsp" /><br/>
<div class="menu-content">
<ul id="MenuBar1" class="MenuBarVertical">
  <li><a class="MenuBarItemSubmenu" href="#">Course</a>
    <ul>
      <li><a href="InsertCourse.jsp">Add New Course</a></li>
      <li><a href="UpdateCourse.jsp">Edit Course</a></li>
      <li><a href="DeleteCourse.jsp">Delete Course</a></li>
      <li><a href="CourseTable.jsp">Course Table</a></li>
    </ul>
  </li>
  <li><a href="#">Student</a>
  <ul>
      <li><a href="InsertStudent.jsp">Add New Student</a></li>
      <li><a href="UpdateStudent.jsp">Edit Student Info</a></li>
      <li><a href="DeleteStudent.jsp">Delete Student</a></li>
    </ul>
  </li>
  <li><a href="#">Teaching Staff</a>
  <ul>
      <li><a href="InsertFaculty.jsp">Add New Faculty</a></li>
      <li><a href="UpdateFaculty.jsp">Edit Faculty</a></li>
      <li><a href="DeleteFaculty.jsp">Delete Faculty</a></li>
    </ul>
  </li>
  <li><a href="#">News</a>
  <ul>
      <li><a href="InsertAnnouncement.jsp">Add Announcement</a></li>
      <li><a href="UpdateAnnouncement.jsp">Edit Announcement</a></li>
      <li><a href="DeleteAnnouncement.jsp">Delete Announcement</a></li>
    </ul>
  </li>
  <li><a href="#">Events</a>
  <ul>
      <li><a href="InsertEvent.jsp">Add New Event</a></li>
      <li><a href="UpdateEvent.jsp">Update Event</a></li>
      <li><a href="DeleteEvent.jsp">Delete Event</a></li>
    </ul>
  </li>
</ul>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>