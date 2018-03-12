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
<title>Insert title here</title>
</head>
<body>
<header class="top-bar" id="top">
	<div class="left">
		<a href="homenew.jsp"><img class="logo" alt="ShareaSlide" src="images/logo.png">
		<span class="heading"> SlideShare<span></a>
		<form name="search" action="Home" method="post">
		<input type="text" placeholder="Search Keywords" class="search" name="search_bar">
		<input type="submit" value="Search" name="search" class="search_button"/>
		<a href="profile.jsp"> <img alt="profile" src="images/photo.png" class="nav_photo"></a>
		<a href="upload.jsp" class="upload" >Share</a>
		</form>
		
	<!--   <input type="button" class="signup" value="Sign Up"/>
	<input type="button" class="login" value="Login"/>-->
	</div>
	
	<div class="nav">
		<ul class="navele">
			<li class="navcommon"><a href="homenew.jsp">Home</a></li>
			<li class="navcommon"><a href="myfavorites.jsp">Favorites</a></li>
			<li class="navcommon"><a href="technology.jsp">Technology</a></li>
			<li class="navcommon"><a href="education.jsp">Education</a></li>
			<li class="navcommon"><a href="moretopics.jsp">More Topics</a></li>
		
		</ul>
	</div>

</header>

<div class="wrapper">
	<div class="content_aftlogin" >
		<section class="detailblock">
				<section class="sub_detailblock">
				<img src="images/photo.png" alt="photo" class="photo">
				<ul class="option">
					<li class="name"><p id="name"><%-- <%= request.getParameter("fname") %> --%>mayur</p></li>
					<li class="shareslide"><a href="upload.jsp";> Share </a></li>
					<li class="mypresentation"><a href="mypresentaion.jsp";> My Presenation </a></li>
       				<li class="myfavorite"><a href="myfavorites.jsp";> My Favorites </a></li>
        			<li class="profile"><a href="profile.jsp";> Profile </a></li>
        			<li class="logout_side"><a href="home.jsp";> Logout </a></li>
        		</ul>
				</section>
		</section>
		<section  class="profile_details">
		<h1>Profile Updated successfully....</h1>
		</section>
	</div>
	<div class="footer">
        <a href="privacy&termsaftlogin.jsp"> Privacy Policy </a>
        <a href="privacy&termsaftlogin.jsp"> Terms and Conditions </a>
        <a href="contactusaftlogin.jsp"> Contact Us </a>
        <a href="#top"> Back to Top </a>
	</div>
</div>
</body>
</html>