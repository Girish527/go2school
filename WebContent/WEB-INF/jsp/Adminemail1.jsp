<%@ page language="java" contentType="text/html; charset=UTF-8"  
 pageEncoding="UTF-8"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<%@page import=" java.util.Properties" %>   
<%@page import="javax.mail.BodyPart" %>  
<%@page import=" javax.mail.Message" %> 
<%@page import ="javax.mail.MessagingException" %> 
<%@page import ="javax.mail.Multipart" %> 
<%@page import ="javax.mail.SendFailedException" %> 
<%@page import=" javax.mail.Session"  %> 
<%@page import ="javax.mail.Transport"%> 
<%@page import ="javax.mail.internet.InternetAddress"%> 
<%@page import=" javax.mail.internet.MimeBodyPart" %> 
<%@page import=" javax.mail.internet.MimeMessage"  %> 
<%@page import="javax.mail.internet.MimeMultipart" %>  




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
 
   
<%

            
try {
                          
        String Host = "smtp.gmail.com";
        String Password = "986646514698";
        String From = "ggguru74@gmail.com";
        String ToAddress = "girish.gorantla@gmail.com";  //Receivers email id     
        Properties Props = System.getProperties();
        Props.put("mail.smtp.host", Host);
        Props.put("mail.smtps.auth", "true");
        Props.put("mail.smtp.starttls.enable", "true");
        
        Session Session1 = Session.getInstance(Props, null);

        MimeMessage message = new MimeMessage(Session1);

        message.setFrom(new InternetAddress(From));

        message.setRecipients(Message.RecipientType.TO, ToAddress);

        message.setSubject("Test Email");

        BodyPart MessageBodyPart = new MimeBodyPart();
         
             message.setSubject("from goschool");
        MessageBodyPart.setText("you registered sucessfully");
      
        
        
        
        Multipart Multipart = new MimeMultipart();

        Multipart.addBodyPart(MessageBodyPart);

        MessageBodyPart = new MimeBodyPart();     

        message.setContent(Multipart);

        try {
            Transport Tr = Session1.getTransport("smtps");
            Tr.connect(Host, From, Password);
            Tr.sendMessage(message, message.getAllRecipients());            
            Tr.close();
                       
            System.out.println("fine email sending");
            System.out.println("");
               

        } catch (SendFailedException sfe) {
            
        	System.out.println("failed due to either internet/code");
        	
        }

             }
         
                 catch (Exception e) {
                	 System.out.println("failed due to either internet/code");
        e.printStackTrace();
    }



   %>



<table border=0>
   
   <tr style="background-color: white; color: orange; text-align: center;"  
      height="30px">  
      <td>USERNAME:</td>  
      <td>${adminpdf.userName} </td>  
      </tr>
      </table>
      
      
  <%System.out.println("hello girish");%> 
<%System.out.println("in the backend the mail is working ");%>
<h1>registration successful</h1>
<a href="Adminlist.htm">Click Here to admission form</a>

<jsp:forward page="Adminpdf.jsp"></jsp:forward>


</center>
</body>
</html>