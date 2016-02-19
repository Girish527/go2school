<html>
<head>
<title>java mail </title>
</head>
<body>
    
 //not that much use
    
<%@page import=" java.util.Properties" %>   
<%@page import="javax.mail.BodyPart" %>  
<%@page  import=" javax.mail.Message" %> 
<%@page  import ="javax.mail.MessagingException" %> 
<%@page import ="javax.mail.Multipart" %> 
<%@page import ="javax.mail.SendFailedException" %> 
<%@page import=" javax.mail.Session"  %> 
<%@page import ="javax.mail.Transport"%> 
<%@page import ="javax.mail.internet.InternetAddress"%> 
<%@page import=" javax.mail.internet.MimeBodyPart" %> 
<%@page import=" javax.mail.internet.MimeMessage"  %> 
<%@page import="javax.mail.internet.MimeMultipart" %>  


<%
//String paswd="";
//String wrongid="";
//String username="";
            
try {
                          
       // paswd="abc";
        //username="abc";
        String host = "smtp.gmail.com";
        String Password = "986646514698";
        String from = "ggguru74@gmail.com";
        String toAddress = "girish.gorantla@gmail.com";  //Receivers email id     
        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        
        Session session1 = Session.getInstance(props, null);

        MimeMessage message = new MimeMessage(session1);

        message.setFrom(new InternetAddress(from));

        message.setRecipients(Message.RecipientType.TO, toAddress);

        message.setSubject("Test Email");

        BodyPart messageBodyPart = new MimeBodyPart();
         
             message.setSubject("from goschool");
        messageBodyPart.setText("you registered sucessfully");
      
        
        
        
        Multipart multipart = new MimeMultipart();

        multipart.addBodyPart(messageBodyPart);

        messageBodyPart = new MimeBodyPart();     

        message.setContent(multipart);

        try {
            Transport tr = session1.getTransport("smtps");
            tr.connect(host, from, Password);
            tr.sendMessage(message, message.getAllRecipients());            
            tr.close();
            
            
            System.out.println("fine email sending");
               

        } catch (SendFailedException sfe) {
            
        	System.out.println("failed due to either internet/code");
        	
        }

             }
         
                 catch (Exception e) {
                	 System.out.println("failed due to either internet/code");
        e.printStackTrace();
    }



   %>

</body>
</html>
