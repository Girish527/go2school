<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>ADMIN REGISTRATION FORM</title>  
</head>  
<body>  
 <center>  
  
  <div style="color: teal; font-size: 30px"> ADMIN REGISTRATION FORM</div>  
    
  <form:form id="loginForm" modelAttribute="admin" method="post"  
   action="Adminloginverify.htm">  
   <table width="400px" height="150px"> 
   
   
   <tr>  
     <td><form:label path="userName">USER NAME</form:label>  
     </td>  
     <td><form:input path="userName" />  
     </td>  
    </tr>  
       
    <tr>  
     <td><form:label path="password">PASSWORD</form:label>  
     </td>  
     <td><form:password path="password" />  
     </td>  
    </tr>  
    <tr>
     <td></td>  
     <td><input type="submit" value="login" /></td>
    </tr>  
   </table>  
  </form:form>  
 
 </center>  
</body>  
</html>