<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
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
		<a href="profile.jsp"> <img alt="profile" src="images/photo.png" class="nav_photo" title="Click here to update your profile"></a>
		<a href="upload.jsp" class="upload" >Share</a>
		</form>
	</div>
	
	<div class="nav">
		<ul class="navele">
			<li class="navcommon"><a href="home.jsp">Home</a></li>
			<li class="navcommon"><a href="myfavorites.jsp">Favorites</a></li>
			<li class="navcommon"><a href="technology.jsp">Technology</a></li>
			<li class="navcommon"><a href="education.jsp">Education</a></li>
			<li class="navcommon"><a href="moretopics.jsp">More Topics</a></li>
		
		</ul>
	</div>

</header>
<%
HttpSession session1 = request.getSession(true);
String user = (String) session1.getAttribute("UsernameSession");
String first_name=null, last_name=null, email=null, username=null, password=null, dob_month=null, gender=null, phone=null;
int uid=0, dob_day=0, dob_year=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
	con.setAutoCommit(false);
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select * from userlogin where username='"+user+"'");
	if(rs1.next()){
		uid = rs1.getInt(1);
		username = rs1.getString(2);
		password = rs1.getString(3);
	}
	
	ResultSet rs = st.executeQuery("select * from userprofile where user_id='"+uid+"'");
	
	while(rs.next()){
		first_name = rs.getString(2);
		last_name = rs.getString(3);
		email = rs.getString(4);
		dob_month = rs.getString(5);
		dob_day = rs.getInt(6);
		dob_year = rs.getInt(7);
		gender = rs.getString(8);
		phone = rs.getString(9);
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
<div class="wrapper">
	<div class="content">
		<section class="detailblock">
				<section class="sub_detailblock">
				<img src="images/photo.png" alt="photo" class="photo">
				<ul class="option">
					<li class="name"><p><%= first_name %></p></li>
					<li class="shareslide"><a href="upload.jsp";> Share </a></li>
					<li class="mypresentation"><a href="mypresentaion.jsp";> My Presenation </a></li>
       				<li class="myfavorite"><a href="myfavorites.jsp";> My Favorites </a></li>
        			<li class="profile"><a href="profile.jsp";> Profile </a></li>
        			<li class="logout_side"><a href="home.jsp";> Logout </a></li>
        		</ul>
				</section>
		</section>
		<section  class="profile_details">
		<h2>Profile</h2>
		<form name="viewprofileform" method="post" action="Profile">
				<table>
					<tbody><tr>
					<td class="td_label">First Name</td>
					<td><input type="text" class="login_input" name="signup_first_name" value="<%= first_name%>"></td>
					</tr>
					<tr>
					<td class="td_label">Last Name</td>
					<td><input type="text" class="login_input" name="signup_last_name" value="<%= last_name%>"></td>
					</tr>
					<tr>
					<td class="td_label">Email</td>
					<td><input type="text" class="login_input" name="signup_email" value="<%= email%>"></td>
					</tr>
					<tr>
					<td class="td_label">Username</td>
					<td><input type="text" class="login_input" name="signup_username" value="<%= username%>" readonly></td>
					</tr>
					<tr>
					<td class="td_label">Password</td>
					<td><input type="password" class="login_input" name="signup_password" placeholder="New Password"></td>
					</tr>
					<tr>
					<td class="td_label">Confirm Password</td>
					<td><input type="password" class="login_input" name="signup_con_password" placeholder="Confirm New Password"></td>
					</tr>
					<tr>
					<td class="td_label">Date of Birth</td>
					<td>
					<select value="Month" name="Month" title="Month">
						<option value="0"><%= dob_month %></option>
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
						<option value="default"><%= dob_day %></option>
					</select>
					<select id="Year" value="Year" name="Year" title="Year">
						<option value="default"><%= dob_year %></option>
					</select>
					</td>
					</tr>
					<tr>
					<td class="td_label">Gender</td>
					<td><input type="radio" name="signup_gender" >Male
					<input type="radio" name="signup_gender">Female</td>
					</tr>
					<tr>
					<td class="td_label">Phone</td>
					<td><input type="text" class="login_input" name="signup_phone" value="<%= phone%>"></td>
					</tr>
					<tr>
					<td colspan="2" style="padding-left: 155px; padding-top: 30px;"><input type="submit" value="Update"></td>
					</tr>
				</tbody></table>
			</form>
		</section>
	</div>
	<div class="footer">
        <a href="privacy&termsaftlogin.jsp"> Privacy Policy </a>
        <a href="privacy&termslogin.jsp"> Terms and Conditions </a>
        <a href="contactusaftlogin.jsp"> Contact Us </a>
        <a href="#top"> Back to Top </a>
	</div>
</div>

</body>
</html>