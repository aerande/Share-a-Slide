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
  
  <script>
  	function selectYear(){
  		var d = new Date();
  		var nowYear = d.getFullYear();
  		var yearloop = "<option value='0'>Select</option>";
  		
  		for(var i = nowYear; i > nowYear - 56 ; i--){
  			yearloop += "<option value='"+i+"'>"+i+"</option>";
  			
  		}
  		
  		document.getElementById('Year').innerHTML = yearloop;
  	}
  	
  	function selectDay(){
  		var dayloop = "<option value='0'>Select</option>";
  		
  		for(var i=1;i<=31;i++){
  			dayloop += "<option value='"+i+"'>"+i+"</option>";
  		}
  		
  		document.getElementById('Day').innerHTML = dayloop;
  	}
  	
  	function saggregate(){
  		selectYear();
  		selectDay();
  	}
  </script>
<title>Insert title here</title>
</head>
<body onload="saggregate()">
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
	<div class="content_signup">
		<h2 align="center">Sign Up</h2>
			<form action="Signup" method="post" class="signup_form" name="signupform">
				<fieldset class="field_signup">
				<table class="table_signup">
					<tr>
					<td class="td_label">First Name</td>
					<td><input type="text" class="login_input" name="signup_first_name" placeholder="First Name" required /></td>
					</tr>
					<tr>
					<td class="td_label">Last Name</td>
					<td><input type="text" class="login_input" name="signup_last_name" placeholder="Last Name" required /></td>
					</tr>
					<tr>
					<td class="td_label">Email</td>
					<td><input type="text" class="login_input" name="signup_email" placeholder="Email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Match the format"/></td>
					</tr>
					<tr>
					<td class="td_label">Username</td>
					<td><input type="text" class="login_input" name="signup_username" placeholder="User Name" title="Select any username" required /></td>
					</tr>
					<tr>
					<td class="td_label">Password</td>
					<td><input type="password" class="login_input" name="signup_password" placeholder="Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"/></td>
					</tr>
					<tr>
					<td class="td_label">Confirm Password</td>
					<td><input type="password" class="login_input" name="signup_con_password" placeholder="Confirm Password" required /></td>
					</tr>
					<tr>
					<td class="td_label">Date of Birth</td>
					<td>
					<select value="Month" name="Month" title="Month">
						<option value="0">Select</option>
						<option value="January">January</option>
						<option value="February">February</option>
						<option value="March">March</option>
						<option value="April">April</option>
						<option value="May">May</option>
						<option value="June">June</option>
						<option value="July">July</option>
						<option value="August">August</option>
						<option value="September">September</option>
						<option value="October">October</option>
						<option value="November">November</option>
						<option value="December">December</option>
					</select>
					<select id="Day" value="Day" name="Day" title="Day">

					</select>
					<select id="Year" value="Year" name="Year" title="Year">
						
					</select>
					</td>
					</tr>
					<tr>
					<td class="td_label">Gender</td>
					<td><input type="radio" name="signup_gender" value="Male" >Male</input>
					<input type="radio" name="signup_gender" value="Female">Female</input></td>
					</tr>
					<tr>
					<td class="td_label">Phone</td>
					<td><input type="text" class="login_input" name="signup_phone" placeholder="Phone" required/></td>
					</tr>
				</table>
					
					<div class="signup_terms">
						<input type="checkbox" checked="checked" value="1" name="remember_checkbox"/>
						<label>Accept the </label><a href="/">Terms of Service</a>
					</div>
					<div>
						<div class="button_signup">
							<input type="submit" value="Signup" name="signup_button" onclick="homenew.jsp"/>
						</div>
						<div class="button_reset">
							<input type="reset" value="Reset" name="signup_reset_button"/>
						</div>
					</div>
				</fieldset>
				<hr>
				<div class="signup_login">
					<a href="login.jsp">Already a member? Login here!</a>
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