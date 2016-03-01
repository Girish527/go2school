<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" />
<title>ADMIN REGISTRATION FORM</title>
</head>
<body>
  <div class="container text-center">
<div class="row">
  <div class="col-lg-12">
    <h2 class = "text-success">Admin Sign Up</h2>
  </div>
</div>
  <form:form id="registerForm" modelAttribute="admin" method="post"
   action="Adminverify.htm">
   <div class="row form-group">
     <form:label path="firstName" class="col-lg-offset-2 col-lg-2 control-label">Firstname</form:label>
     <div class="col-lg-4">
       <form:input path="firstName" class = "form-control" placeholder = "John" />
     </div>
   </div>
   <div class="row form-group">
     <form:label path="lastName" class="col-lg-offset-2 col-lg-2 control-label">Lastname</form:label>
     <div class="col-lg-4">
       <form:input path="lastName" class = "form-control" placeholder = "Doe" />
     </div>
   </div>
   <div class="row form-group">
     <form:label path="userName" class="col-lg-offset-2 col-lg-2 control-label">Username</form:label>
     <div class="col-lg-4">
       <form:input path="userName" class = "form-control" placeholder = "Doe" />
     </div>
   </div>
   <div class="row form-group">
     <form:label path="email" class="col-lg-offset-2 col-lg-2 control-label">Email</form:label>
     <div class="col-lg-4">
       <form:input path="email" class = "form-control" placeholder = "johndoe@example.com" />
     </div>
  </div>
  <div class="row form-group">
    <form:label path="password" class="col-lg-offset-2 col-lg-2 control-label">Password</form:label>
    <div class="col-lg-4">
      <form:input path="password" class = "form-control" placeholder = "" />
    </div>
  </div>
  <div class="row form-group">
    <form:label path="phone" class="col-lg-offset-2  col-lg-2 control-label">Phone</form:label>
    <div class="col-lg-4">
      <form:input path="phone" class = "form-control" placeholder = "9094205852" />
    </div>
  </div>
  <div class="row form-group">
    <div class="col-lg-offset-4 col-lg-4">
      <button type="submit" class="btn btn-primary btn-block">Submit</button>
    </div>
  </div>
  </form:form>
</div>
<div class="container text-center">

<ul class="list-inline">
  <li>
    <a href="Adminemail1.htm?id=12" class="list-group-item">PDF testing</a>
  </li>
  <li>
    <a href="Adminlogin.htm" class="list-group-item">login</a>
  </li>
  <li>
    <a href="AdminExcelview.htm" class="list-group-item">excel</a>
  </li>
</ul>

</div>

 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/4.1.3/jquery.min.js"></script>
</body>
</html>
</html>
