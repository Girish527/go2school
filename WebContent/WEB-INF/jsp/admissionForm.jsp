<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title> Admission Form</title>  
</head>  
<body>  
 <center>  
  <div id="wrapper">                              

	<div>                     
		<jsp:include page="header.jsp" />
	</div> 


	<div id="content">  
  
  <div style="color: teal; font-size: 30px"> Admission Form</div>  
   <br/><br/><br/>
 <!--   <c:url var="userRegistration" value="saveUser.htm" /> -->
  
  <form:form id="registerForm" modelAttribute="student" method="post"  
   action="register.htm?adminid=${school.adminid}">  
   <table width="400px" height="150px"> 
      
    <tr>  
     <td><form:label path="firstName">First Name</form:label>  
     </td>  
     <td><form:input path="firstName" />  
     </td>  
    </tr>  
    <tr>  
     <td><form:label path="lastName">Last Name</form:label>  
     </td>  
     <td><form:input path="lastName" />  
     </td>  
    </tr>  
    <tr>  
     <td><form:label path="email">Email</form:label>  
     </td>  
     <td><form:input path="email" />  
     </td>  
    </tr>  
    
    <tr>  
     <td><form:label path="phone">Phone</form:label>  
     </td>  
     <td><form:input path="phone" />  
     </td>  
    </tr> 
     
     <tr>  
     <td><form:label path="schoolName">SchoolName</form:label>  
     </td>  
     <td><form:input path="schoolName" value="${school.schoolName}" />  
     </td>  
    </tr> 
    <tr>  
     <td><form:label path="place">Place</form:label>  
     </td>  
     <td><form:input path="place" />  
     </td>  
    </tr> 
    <tr>  
     <td></td>  
     <td><input type="submit" value="Register" /></td>
     <td><input type="reset"  value="clear"/></td>
    </tr>  
   </table>  
  </form:form>  
    
  <a href="schoolPage">Goto Home Page</a> 
  <a href="list">Click Here to see student List</a> 
  </div>


	<!-- end #content -->

	<!-- Please do not remove the "Design by" information. -->
	<div>
	<jsp:include page="footer.jsp" />
	
			</div>
	<!-- end footer -->

</div>
<!-- end #wrapper -->
 
 </center>  
</body>  
</html>