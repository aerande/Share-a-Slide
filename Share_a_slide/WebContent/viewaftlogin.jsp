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
 <link rel="stylesheet" type="text/css" href="http://www.htmlcommentbox.com/static/skins/default/skin.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function viewLoop(n){
	var container = document.getElementById("display_ppt_div");
	for(i=0;i<n;i++){
		container.insertAdjacentHTML('beforeend', '<img class="display_image" alt="" src="C:/My Data/Share_a_slide/Download/ForView/images/ppt_images'+i+'.png">');
	}
}
</script>
<title>View Presentation</title>

</head>
<%
int ir = Integer.parseInt(request.getParameter("i"));
%>
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
<%
HttpSession session1 = request.getSession(true);
String user = (String) session.getAttribute("UsernameSession");

%>
<div class="wrapper">
	<div class="content_aftlogin_view" >
		<section class="detailblock">
				<section class="sub_detailblock">
				<img src="images/photo.png" alt="photo" class="photo">
				<ul class="option">
					<li class="name"><p><%= user %></p></li>
					<li class="shareslide"><a href="upload.jsp"> Share </a></li>
					<li class="mypresentation"><a href="mypresentation.jsp"> My Presentation </a></li>
       				<li class="myfavorite"><a href="myfavorites.jsp"> My Favorites </a></li>
        			<li class="profile"><a href="profile.jsp"> Profile </a></li>
        			<li class="logout_side"><a href="home.jsp" <%session.invalidate(); %>> Logout </a></li>
        		</ul>
				</section>
		</section>
		<div class="content_ppt">
		<a class="prev" onclick="plusDivs(-1)"> &#10094; </a>
	 		<div id="display_ppt_div" class="display_ppt">
				<img class="display_image" alt="" src="images/Download/ForView/Images/ppt_image0.png">
				<img class="display_image" alt="" src="images/Download/ForView/Images/ppt_image1.png">
				<img class="display_image" alt="" src="images/Download/ForView/Images/ppt_image2.png">
				<img class="display_image" alt="" src="images/Download/ForView/Images/ppt_image3.png">
				<img class="display_image" alt="" src="images/Download/ForView/Images/ppt_image4.png">
			</div>
		<a class="next" onclick="plusDivs(1)">&#10095;</a>
		<form action="down" method="post" name="download_ppt">
		<input type="submit" name="download_ppt" value="Download" class="download_ppt">
		</form>
		
		<!-- begin htmlcommentbox.com -->
 <div id="HCB_comment_box"><a href="http://www.htmlcommentbox.com">HTML Comment Box</a> is loading comments...</div>

 <script type="text/javascript" language="javascript" id="hcb">
 if(!window.hcb_user){
	 hcb_user={  };
	 } 
 (function(){
	 s=document.createElement("script");
	 s.setAttribute("type","text/javascript");
	 s.setAttribute("src", "http://www.htmlcommentbox.com/jread?page="+escape((window.hcb_user && hcb_user.PAGE)||(""+window.location)).replace("+","%2B")+"&opts=470&num=10");
	 if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})(); /*-->*/ </script>
<!-- end htmlcommentbox.com -->
		</div>

		<script type="text/javascript">
		var slideIndex = 1;
		showDivs(slideIndex);
		
		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}
		
		function showDivs(n) {
		  var i;
		  var x = document.getElementsByClassName("display_image");
		  if (n > x.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = x.length}
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";  
		  }
		  x[slideIndex-1].style.display = "block";  
		}
		</script>
	
	</div>
	<div class="footer">
        <a href="privacy&termsaftlogin.jsp"> Privacy Policy </a>
        <a href="privacy&termsaftlogin.jsp"> Terms and Conditions </a>
        <a href="contactusaftlogin.jsp"> Contact Us </a>
        <a href="#top"> Back to Top </a>
	</div>
</div>

</div>



</body>
</html>