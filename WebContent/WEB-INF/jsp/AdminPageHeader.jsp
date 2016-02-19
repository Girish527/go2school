<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Go2YourSchool</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Chivo:400,900" rel="stylesheet" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/adminspecificpage.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href="#"><%=session.getAttribute("SchoolName")%></a></h1>
				<p>by <a href="http://www.Go2Yourschool.com/" rel="nofollow">Go2YourSchool</a></p>
			</div>  <!--logo-->
		</div> <!--header-->
	</div>  <!--header wrapper-->
	<div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="AdminpageHome.htm">Home</a></li>
				<li><a href="AdminRecentActivies.htm">RecentActivity</a></li>
				<li><a href="AdminReports.htm">Reports</a></li>
				<li><a href="AdminTableCreation.htm">CreateTables</a></li>
				<li><a href="#" onclick="changeContact()">Contact</a></li>
			</ul>
		</div>
		<!-- end #menu --> 
	</div>  <!--menu- wrapper-->
	</div>  <!--  wrapper  -->
</body>
</html>