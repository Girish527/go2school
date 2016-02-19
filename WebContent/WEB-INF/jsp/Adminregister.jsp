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
      <td>USERNAME:</td>  
      <td>${admin1.userName} </td>  
      </tr>
      
   <tr style="background-color: white; color: orange; text-align: center;"  
      height="30px">  
      <td>PASSWORD:</td>  
      <td>${admin1.password} </td>  
      </tr>
   
   <tr style="background-color: white; color: orange; text-align: center;"  
      height="30px">  
      <td>FIRSTNAME:</td>  
      <td>${admin1.firstName} </td>  
      </tr>
      <tr style="background-color: white; color: blue; text-align: center;"  
      height="30px">
      <td>LASTNAME</td>
      <td>${admin1.lastName} </td> 
      </tr> 
     <tr style="background-color: white; color: green; text-align: center;"  
      height="30px">
      <td>EMAIL</td>
      <td>${admin1.email}</td>
      </tr> 
      <tr style="background-color: white; color: red; text-align: center;"  
      height="30px"> 
      <td>PHONE</td>
      <td>${admin1.phone}</td>  
     </tr>  
  </table>  
  <%System.out.println("hello girish register sucessful"); %> 
<%out.println("after this only it: "+(50+30));%>

<h1>registration successful</h1>
<h1><a href="AdminEdit.htm?id=${admin1.id}">EDIT YOUR DETAILS</a></h1>
<h1><a href="Adminlist.htm">Click Here to find who register</a></h1>
<h1><a href="Adminemail1.htm?id=${admin1.id}">click here for send email and download pdf file </a></h1>
<%out.close();%>
</center>
</body>
</html>