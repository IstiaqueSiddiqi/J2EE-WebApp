<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Photo Gallery</title>
<style>

/*POSITIONING THE PHOTOS*/

.photos img {
    position: relative;
}




/*TRANSLATION*/
.photos img:nth-of-type(1) {
    left: 50px;
    top: 50px;
}
 
.photos img:nth-of-type(2) {
    left: 150px;
    top: 100px;
}
 
.photos img:nth-of-type(3) {
    left: 250px;
    top: 50px;
}
 
.photos img:nth-of-type(4) {
    left: 350px;
    top: 150px;
}
 
.photos img:nth-of-type(5) {
    left: 450px;
    top: 50px;
}


/*ROTATION*/

.photos img:nth-of-type(1) {
    left: 50px;
    top: 50px;
    -webkit-transform: rotate(5deg);
    -moz-transform: rotate(5deg);
    -o-transform: rotate(5deg);
    transform: rotate(5deg);
}
 
.photos img:nth-of-type(2) {
    left: 150px;
    top: 100px;
    -webkit-transform: rotate(-10deg);
    -moz-transform: rotate(-10deg);
    -o-transform: rotate(-10deg);
    transform: rotate(-10deg);
}
 
.photos img:nth-of-type(3) {
    left: 250px;
    top: 50px;
    -webkit-transform: rotate(7deg);
    -moz-transform: rotate(7deg);
    -o-transform: rotate(7deg);
    transform: rotate(7deg);
}
 
.photos img:nth-of-type(4) {
    left: 350px;
    top: 150px;
    -webkit-transform: rotate(-3deg);
    -moz-transform: rotate(-3deg);
    -o-transform: rotate(-3deg);
    transform: rotate(-3deg);
}
 
.photos img:nth-of-type(5) {
    left: 450px;
    top: 50px;
    -webkit-transform: rotate(2deg);
    -moz-transform: rotate(2deg);
    -o-transform: rotate(2deg);
    transform: rotate(2deg);
}



/*ADDING THE HOVER EFFECTS*/

.photos img:hover {
    -webkit-transform: scale(1.5);
    -moz-transform: scale(1.5);
    -o-transform: scale(1.5);
    transform: scale(1.5);
    z-index: 10;
}




.photos img:hover {
    -webkit-transform: rotate(380deg) scale(1.5);
    -moz-transform: rotate(380deg) scale(1.5);
    -o-transform: rotate(380deg) scale(1.5);
    transform: rotate(380deg) scale(1.5);
    z-index: 10;
}


/*REFINING THE EFFECTS BY MANAGING TRANSITIONS*/
photos img {
    -webkit-transition: all 0.5s ease-out;
    -moz-transition: all 0.5s ease-out;
    -o-transition: all 0.5s ease-out;
    transition: all 0.5s ease-out;
}



/*ADDING BORDERS*/
.photos img {
    -webkit-transition: all 0.5s ease-out;
    -moz-transition: all 0.5s ease-out;
    -o-transition: all 0.5s ease-out;
    transition: all 0.5s ease-out;
    padding: 10px 10px 30px 10px;
    background: white;
    border: solid 1px black;
}
</style>
</head>
<body>
<jsp:include page="Header.jsp" />
<br/>
<div class="content">
<div class="innerContent">
<div class="photos"> 
    <img src="img/1.jpg" height="150" width="300" /> 
    <img src="img/2.jpg" height="150" width="300"/> 
    <img src="img/3.jpg" height="150" width="300"/> 
    <img src="img/4.jpg" height="149" width="229" /> 
    <img src="img/5.jpeg"  height="150" width="300"/> 
	<img src="img/6.JPG"  height="150" width="300"/> 
	<img src="img/7.jpg" height="150" width="300" /> 
	<img src="img/9.JPG" height="150" width="300" /> 
	<img src="img/10.JPG" height="150" width="300" /> 
</div>
</div>
</div>
<br/><br/><br/><br/>
<jsp:include page="Footer.jsp" />
</body>
</html>