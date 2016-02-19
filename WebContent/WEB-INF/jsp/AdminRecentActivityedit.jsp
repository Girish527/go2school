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
  
  
   
  <form:form id="registerForm" modelAttribute="activityEdit" method="post"  
   action="AdminRecentActivityUpdate.htm?id=${activityEdit.id}">  
   <table width="400px" height="150px"> 
   <tr>  
     <td><form:label path="recentactivity1">Activity Name</form:label></td>  
     <td><form:input path="recentactivity1" value="${activityEdit.recentactivity1}" /></td>  
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