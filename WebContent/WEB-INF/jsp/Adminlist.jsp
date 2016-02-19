<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title> Guys | User Details</title>  
</head>  
<body>  
 <center>  
  
  <div style="color: teal; font-size: 30px"> Guys | User  
   Details</div>  
  
  <c:if test="${!empty adminList}">  
   <table border="1" bgcolor="black" width="600px">  
    <tr  
     style="background-color: teal; color: white; text-align: center;"  
     height="40px">  
     
     <td>User Name</td>
     <td>Password</td>  
     <td>First Name</td>  
     <td>Last Name</td>  
     <td>Email</td>  
     <td>Phone</td>  
    <!-- <td>Edit</td>  
     <td>Delete</td>  -->
    </tr>  
    <c:forEach items="${adminList}" var="admin">  
     <tr  
      style="background-color: red; color: black; text-align: center;"  
      height="30px">  
      
      
      <td><c:out value="${admin.userName}" />  
      </td>
      <td><c:out value="${admin.password}" />  
      </td>  
      <td><c:out value="${admin.firstName}" />  
      </td>  
      <td><c:out value="${admin.lastName}" />  
      </td>  
      <td><c:out value="${admin.email}" />  
      </td>  
      <td><c:out value="${admin.phone}" />  
      </td> 
      <!--   
      <td><a href="edit?id=${user.id}">Edit</a></td>  
      <td><a href="delete?id=${user.id}">Delete</a></td>  -->
      
     </tr>  
    </c:forEach>  
   </table>  
  </c:if>  
  
  
  <a href="form">Click Here to add new User</a>  
 </center>  
</body>  
</html>