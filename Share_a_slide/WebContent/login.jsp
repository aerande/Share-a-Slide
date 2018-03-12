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
 
<title>Insert title here</title>
</head>
<body>

<header class="top-bar" id="top">
	<div class="left">
		<a href="home.jsp"><img class="logo" alt="ShareaSlide" src="images/logo.png">
		<span class="heading"> SlideShare<span></a>
		<form name="search" action="Home" method="post">
		<input type="text" placeholder="Search Keywords" class="search" name="search_bar">
		<input type="submit" value="Search" name="search" class="search_button"/>
		<a href="signup.jsp" class="signup">Sign Up</a>
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
	<div class="content_login">
		<h2 align="center">Login to our website</h2>
			<form action="Login" method="post" class="login_form" name="loginform">
				<fieldset class="field_login">
					<input type="text" class="login_input" id="login_username" name="login_username" placeholder="Username or Email" required/>
					<input type="password" class="login_input" name="login_password" placeholder="Password" required/>
					
					<div>
						<input type="checkbox" checked="checked" value="1" name="remember_checkbox"/>
						<label>Keep me logged in</label>
					</div>
					<div>
						
							<!-- <a href="homenew.jsp" class="button_login">Login</a> -->
							<input type="submit" value="Login" name="login_button" />
						
						<div class="forgot_login">
							<a href="/" title="Click here to set new password">Forgot password?</a>
						</div>
					</div>
				</fieldset>
				<hr>
				<div class="login_signup">
					<a href="signup.jsp">Not a member? Sign up here!</a>
				</div>
			</form>

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

