 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
       <%@include file="AdminPageHeader.jsp"%>
       
	<div id="page" class="container">
		<div id="content">
			<div class="title">
				<h2>Welcome <%=session.getAttribute("AdminName")%></h2>
				<span class="byline">You can edit and perform operations on your Data</span>
           </div>
			<p>
            You can Edit activities by using Recent Activity Tab.
             </p>
			<p>
            You can Generate reports using Reports Tab.
             </p>
            
            <p>
            You can create tables in Database using Create Tables Tab.
             </p>
		</div> <!--content-->
	</div>  <!-- page-->
</div> <!-- wrapper -->
<%@include file="AdminPageFooter.jsp" %>
</body>
</html>
