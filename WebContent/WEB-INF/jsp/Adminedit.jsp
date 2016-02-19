<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title> Edit User Details</title>  
</head>  
<body>  
 <center>  
  
  <div style="color: teal; font-size: 30px"> Edit Details</div>  
  
  
   
  <form:form id="registerForm" modelAttribute="admin" method="post"  
   action="Adminupdate.htm?id=${admin.id}">  
   <table width="400px" height="150px"> 
   <tr>  
     <td><form:label path="userName">User Name</form:label></td>  
     <td><form:input path="userName" value="${adminEdit.userName}" /></td>  
    </tr> 
    <tr>  
     <td><form:label path="password">password</form:label></td>  
     <td><form:input path="password" value="${adminEdit.firstName}" /></td>  
    </tr>  
    <tr>  
     <td><form:label path="firstName">First Name</form:label></td>  
     <td><form:input path="firstName" value="${adminEdit.password}" /></td>  
    </tr>  
    <tr>  
     <td><form:label path="lastName">Last Name</form:label></td>  
     <td><form:input path="lastName" value="${adminEdit.lastName}"/></td>  
    </tr>  
    <tr>  
     <td><form:label path="email">Email</form:label></td>  
     <td><form:input path="email" value="${adminEdit.email}"/></td>  
    </tr>  
    <tr>  
     <td><form:label path="phone">Phone</form:label></td>  
     <td><form:input path="phone" value="${adminEdit.phone}"/></td>  
    </tr>  
    <tr>  
     <td></td>  
     <td><input type="submit" value="Update" />  
     </td>  
    </tr>  
   </table>  
  </form:form>  
  
  
    
 </center>  
</body>  
</html>  