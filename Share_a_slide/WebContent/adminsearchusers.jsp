<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*, java.sql.*" %>
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
<%
HttpSession session1 = request.getSession(true);
String user = (String) session.getAttribute("UsernameSession");
ResultSet rs = null, rs1= null;
try {
	// Connect to Oracle
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "aniruddha16");
	con.setAutoCommit(false);
	Statement st = con.createStatement();
	rs = con.createStatement().executeQuery("select * from userprofile");
	rs1 = st.executeQuery("select * from userlogin");
	
}
catch(Exception e){
	e.printStackTrace();
}
%>
<header class="top-bar" id="top">
	<div class="left">
		<a href="homenew.jsp"><img class="logo" alt="ShareaSlide" src="images/logo.png">
		<span class="heading"> SlideShare<span></a>
		<form name="search" action="Home" method="post">
		<input type="text" placeholder="Search Keywords" class="search" name="search_bar">
		<input type="submit" value="Search" name="search" class="search_button"/>
		<!-- <a href="profile.jsp"> <img alt="profile" src="images/photo.png" class="nav_photo"></a> -->
		<span style="color: white; margin-left: 580px; font-size: 20px;"> <%= user %><span>
		<a href="home.jsp" class="upload" <% session1.invalidate(); %>>Logout</a>
		</form>

	</div>

	<div class="nav">
		<ul class="navele">
			<li class="navcommon"><a href="adminpage.jsp">Home</a></li>
			<li class="navcommon"><a href="adminsearchusers.jsp">Search Users</a></li>
			<li class="navcommon"><a href="adminapprove.jsp">Approval</a></li>
			<!-- <li class="navcommon"><a href="education.jsp">Education</a></li>
			<li class="navcommon"><a href="moretopics.jsp">More Topics</a></li> -->
		
		</ul>
	</div>

</header>
<div class="wrapper">
	<div class="content_login_admin">
	<h1>List of Users</h1>
	<form name="search_user" action="deleteuser" method="post">
	<table border='2' class="table_admin">
	<tr align="center">
	<td>User ID</td>
	<td>First Name</td>
	<td>Last Name</td>
	<td>Email</td>
	<td>DOB Month</td>
	<td>DOB Day</td>
	<td>DOB Year</td>
	<td>Gender</td>
	<td>Phone</td>
	</tr>
	<%
	while(rs.next()){
		%>
		<tr>

		<td><%= rs.getString(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
		<td><%= rs.getInt(6) %></td>
		<td><%= rs.getInt(7) %></td>
		<td><%= rs.getString(8) %></td>
		<td><%= rs.getString(9) %></td>
		</tr>
	<%}%>
	</table>
	Enter User ID to delete:
	<input type="text" name="delete_user" placeholder="Enter User ID"/>
	<br/>
	<input type="submit" name="delete_user_submit" value="Delete"/>
	</form>
	</div>
	<div class="footer">
        <a href="privacy&terms.jsp"> Privacy Policy </a>
        <a href="privacy&terms.jsp"> Terms and Conditions </a>
        <a href="contactus.jsp"> Contact Us </a>
        <a href="#top"> Back to Top </a>
	</div>
</div>
</body>
</html>