<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
       <%@include file="AdminPageHeader.jsp" %>
       
	<div id="page" class="container">
		<div id="content">
			<div class="title">
				<h2>Edit Your Activities</h2>
				<span class="byline">You can edit and perform operations on your Data</span>
           </div>
           
           <div style="text-align:center">
			<form:form modelAttribute="recent" method="post" action="saveRecentActivity.htm">
        <table>
            <tr>
                <td><form:label path="recentactivity1">EnterActivityName:</form:label></td>
                <td><form:textarea height="3" width="30" path="recentactivity1" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="addActivity" /></td>
            </tr>
        </table>
    </form:form>  
   
    
       <table border="1" bgcolor="black" width="600px">  
       <tr style="background-color: teal; color: white; text-align: center;"  
           height="40px">  
                <td>activityName</td>
                <td>Edit</td>  
                <td>Delete</td>
            </tr>
            
           <!-- to get the details -->
            
        <c:forEach var="list" items="${RecentActivityList}">
            <tr style="background-color: blue; color: black; text-align: center;"  
                 height="30px">
                <td><font color="red">${list.recentactivity1}</font></td>   
                <td><a href="editRecentActivityList.htm?id=${list.id}"><font color="red">Edit</font></a></td>  
                <td><a href="deleteRecentActivityList.htm?id=${list.id}"><font color="red">Delete</font></a></td>          
            </tr>
        </c:forEach>
    </table>
    </div>
		</div> <!--content-->
	</div>  <!-- page-->
</div> <!-- wrapper -->
<%@include file="AdminPageFooter.jsp" %>
</body>
</html>
