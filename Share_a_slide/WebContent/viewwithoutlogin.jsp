<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>View Presentation</title>
</head>
<body>
<div class="complete">
<header class="top-bar" id="top">
	<div class="left">
		<a href="home.jsp"><img class="logo" alt="ShareaSlide" src="images/logo.png">
		<span class="heading"> SlideShare<span></a>
		<form name="search" action="Home" method="post">
		<input type="text" placeholder="Search Keywords" class="search" name="search_bar">
		<input type="submit" value="Search" name="search" class="search_button"/>
		<a href="signup.jsp" class="signup" >Sign Up</a>
		<a href="login.jsp" class="login">Login</a>
		</form>
	<!--   <input type="button" class="signup" value="Sign Up"/>
	<input type="button" class="login" value="Login"/>-->
	</div>
	
	<div class="nav">
		<ul class="navele">
			<li class="navcommon"><a href="home.jsp">Home</a></li>
			<li class="navcommon"><a href="login.jsp">Favorites</a></li>
			<li class="navcommon"><a href="login.jsp">Technology</a></li>
			<li class="navcommon"><a href="login.jsp">Education</a></li>
			<li class="navcommon"><a href="login.jsp">More Topics</a></li>
		
		</ul>
	</div>

</header>


<div class="wrapper">
	<div class="content">
		<div class="content_ppt_nologin">
			<div class="display_ppt_nologin">
			</div>
			<a class="prev_nologin" > < </a>
			<a class="prev_nologin next_nologin">></a>
		</div>

	</div>
	<div class="footer">
		<a href="javascript:void(0)";> Login </a>
        <a href="javascript:void(0)";> Privacy Policy </a>
        <a href="javascript:void(0)";> Terms and Conditions </a>
        <a href="javascript:void(0)";> Contact Us </a>
        <a href="#top";> Back to Top </a>
	</div>
</div>
</div>

</body>
</html>