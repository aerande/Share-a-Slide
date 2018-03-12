<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Contact Us</title>
</head>
<body>
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
		<section class="about">
			<section class="sub_about">
			<h1>Why Use Share-a-Slide</h1>
			<p class="why_share">Share-a-Slide is the best community for sharing
			 presentations. Share-a-Slide features a vibrant 
			 professional and educational community that 
			 regularly comments, favorites and downloads content. 
			 Individuals and organizations upload documnets to SlideShare to share idea, 
			 conduct research, connect with others, and generate leads for thier business. 
			 Anyone can view presentations and documents on topics that interest them, 
			 download them and reuse for their own work.</p>
			
			</section>
		</section>
		<section class="contactus">
			<section class="sub_contactus">
			<h1>Contact Us</h1>
			<h3 class="add_contactus">Address: </h3><p>Illinois Institute of Technology</p><span>3300 S Federal St, Chicago, IL 60616</span>
			<h3>E-mail: </h3><p>spuranik@hawk.iit.edu</p><p>magnani@hawk.iit.edu</p><p>aerande@hawk.iit.edu</p><p>imagotra@hawk.iit.edu</p>
			</section>
		</section>
	</div>
	<div class="footer">
		<a href="login.jsp"> Login </a>
        <a href="privacy&terms.jsp"> Privacy Policy </a>
        <a href="privacy&terms.jsp"> Terms and Conditions </a>
        <a href="contactus.jsp"> Contact Us </a>
        <a href="#top"> Back to Top </a>
	</div>
</div>
</body>
</html>