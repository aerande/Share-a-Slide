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
<title>home</title>
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
		<section class="background">
			<p class="learn">Learn.Share.Enjoy</p>
			<p class="quote">Share what you know and get what you want.</p>
		</section>
		<section class="row1">
			<section class="sub_content">
				<article class="ppt1">
				<figure>
					<img src="images/social.png" alt="social" >
				</figure>
				<p class="para_heading">Social Media</p>
				<p class="para_text">How to use social media to influence the world</p>
				<p class="learnmore"><a href="/"> Learn more... </a></p>
				</article>
				<article class="ppt2">
				<figure>
					<img src="images/java.png" alt="Java" >
				</figure>
				<p class="para_heading">Java Web Developer</p>
				<p class="para_text">The modern Java Web Developer</p>
				<p class="learnmore"><a href="/"> Learn more... </a></p>
				</article>
				<article class="ppt3">
				<figure>
					<img src="images/obama.png" alt="White House" >
				</figure>
				<p class="para_heading">White House</p>
				<p class="para_text">Best photos of 2015 from white house</p>
				<p class="learnmore"><a href="/"> Learn more... </a></p>
				</article>
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

</div>
</body>
</html>