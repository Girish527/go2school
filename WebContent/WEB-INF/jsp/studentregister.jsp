<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
 
   <table border=0>
   <tr style="background-color: white; color: orange; text-align: center;"  
      height="30px">  
      <td>FIRSTNAME:</td>  
      <td>${student1.firstName} </td>  
      </tr>
      <tr style="background-color: white; color: blue; text-align: center;"  
      height="30px">
      <td>LASTNAME</td>
      <td>${student1.lastName} </td> 
      </tr> 
     <tr style="background-color: white; color: green; text-align: center;"  
      height="30px">
      <td>EMAIL</td>
      <td>${student1.email}</td>
      </tr> 
      <tr style="background-color: white; color: red; text-align: center;"  
      height="30px"> 
      <td>PHONE</td>
      <td>${student1.phone}</td>  
     </tr>  
  </table>  
  <%System.out.println("hello girish register sucessful"); %> 
<%out.println("after this only it: "+(50+30));%>
<h1>registration successful</h1>
<a href="list.htm">Click Here to admission form</a>
<a href="StudentMail.htm?id=${student1.id}">click here for send email and Download pdf file </a>

</center>
</body>
</html>