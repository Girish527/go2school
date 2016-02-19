<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title> By Go2YourSchool.com</title>
<link href="css/schoolpage.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="main">                              

	<div id="header" style="background: #CDE691 url(${school.imagepath}) no-repeat;>                     
		<h1><a href="/">${school.schoolName }</a></h1>
		<h2><a href="http://www.chaitratech.com/">By FindYourSchool.com</a></h2>
	</div> 


	
	<div id="content">  
			
		<h2><a href="admissionForm.htm?adminid=${school.adminid}&id=${school.id}">Admission Form</a></h2>
		
		 <table border="1" bgcolor="black" width="300px">  
       <tr style="background-color: teal; color: white; text-align: center;"  
           height="40px">  
                <td>activityName</td>
            </tr>
            
           <!-- to get the details -->
            
        <c:forEach var="list" items="${RecentActivityList}">
            <tr style="background-color: blue; color: black; text-align: center;"  
                 height="30px">
                <td><font color="red">${list.recentactivity1}</font></td>   
                 </tr>
        </c:forEach>
    </table>

	</div>


	<!-- end #content -->

	<!-- Please do not remove the "Design by" information. -->
	<div>
	<jsp:include page="footer.jsp" />
	
	</div>
	<!-- end footer -->

</div>
</div>

<!-- end #wrapper -->
</body>
</html>