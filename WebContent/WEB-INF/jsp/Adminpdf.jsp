<html>
<body bgcolor="orange">
<%@
page import="java.io.*,com.goschool.beans.Admin, java.awt.Color, com.itextpdf.text.*, com.itextpdf.text.pdf.*,javax.mail.util.ByteArrayDataSource,javax.mail.*,java.util.Properties,javax.activation.DataHandler,javax.mail.internet.*,java.net.URL"
%>
<% Admin adminpdf=(Admin)request.getAttribute("adminpdf");%>

<%
System.out.println("user name:"+adminpdf.getuserName());
response.setContentType( "application/pdf" );

// step 1:
Document Document = new Document(PageSize.A4, 50, 35, 50, 35);
//Document Document = new Document(PageSize.A4);
// step 2:
ByteArrayOutputStream Buffer = new ByteArrayOutputStream();
PdfWriter.getInstance( Document, Buffer );
// step 3:
Document.open();
// step 4:
%>	

<%
String FileName = "C:/Users/gorantlg/Desktop/images/closelabel.png";
Image Image1 = Image.getInstance(FileName);
Image1.setAbsolutePosition(10f, 755f);
//Image1.setAbsolutePosition(490f, 773f);
Document.add(Image1);

Paragraph p1;
p1=new Paragraph("");
Document.add(p1);
//newly resource code
 Paragraph P;
      P = new Paragraph("");
      P.add(new Chunk("Registration Form", FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.RED)));
      P.setAlignment(Paragraph.ALIGN_CENTER);
      P.setSpacingBefore(50);
      P.setSpacingAfter(20);
      Document.add(P);
      
      
//testing2
 PdfPTable Table = new PdfPTable(2);
      Table.setWidthPercentage(67);
      Table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
      //Table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
      //table.getDefaultCell().
      //Table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
      //Table.getDefaultCell().setFixedHeight(40);
      //Table.addCell("");
      //Table.addCell("");
      
      
      PdfPCell cell1 = new PdfPCell(new Paragraph("USER NAME :",FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.BLUE)));
      cell1.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell1.setFixedHeight(50f);
      cell1.setBorder(Rectangle.NO_BORDER);
      cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell1);
      
      
      PdfPCell cell2 = new PdfPCell(new Paragraph(adminpdf.getuserName(),FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.RED)));
      cell2.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell2.setFixedHeight(50f);
      cell2.setBorder(Rectangle.NO_BORDER);
      cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell2);
      
      PdfPCell cell3 = new PdfPCell(new Paragraph("FIRST NAME :",FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.BLUE)));
      cell3.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell3.setFixedHeight(50f);
      cell3.setBorder(Rectangle.NO_BORDER);
      cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell3);
      
      PdfPCell cell4 = new PdfPCell(new Paragraph(adminpdf.getFirstName(),FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.RED)));
      cell4.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell4.setFixedHeight(50f);
      cell4.setBorder(Rectangle.NO_BORDER);
      cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell4);
      
      PdfPCell cell5 = new PdfPCell(new Paragraph("LAST NAME :",FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.BLUE)));
      cell5.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell5.setFixedHeight(50f);
      cell5.setBorder(Rectangle.NO_BORDER);
      cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell5);
      
      PdfPCell cell6 = new PdfPCell(new Paragraph(adminpdf.getLastName(),FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.RED)));
      cell6.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell6.setFixedHeight(50f);
      cell6.setBorder(Rectangle.NO_BORDER);
      cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell6.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell6);
    
      
      PdfPCell cell7 = new PdfPCell(new Paragraph("EMAIL :",FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.BLUE)));
      cell7.setPaddingLeft(0f);
     // cell1.setPaddingTop(5f);
     // cell1.setPaddingBottom(5f);
      cell7.setFixedHeight(50f);
      cell7.setBorder(Rectangle.NO_BORDER);
      cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell7.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell7);
      
      
      PdfPCell cell8 = new PdfPCell(new Paragraph(adminpdf.getEmail(),FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.RED)));
      cell8.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell8.setFixedHeight(50f);
      cell8.setBorder(Rectangle.NO_BORDER);
      cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell8.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell8);
      
      PdfPCell cell9 = new PdfPCell(new Paragraph("PHONE :",FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.BLUE)));
      cell9.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell9.setFixedHeight(50f);
      cell9.setBorder(Rectangle.NO_BORDER);
      cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell9.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell9);
      
      PdfPCell cell10 = new PdfPCell(new Paragraph(adminpdf.getPhone(),FontFactory.getFont(FontFactory.HELVETICA, 24f, Font.BOLD, BaseColor.RED)));
      cell10.setPaddingLeft(0f);
      //cell1.setPaddingTop(5f);
      //cell1.setPaddingBottom(5f);
      cell10.setFixedHeight(50f);
      cell10.setBorder(Rectangle.NO_BORDER);
      cell10.setHorizontalAlignment(Element.ALIGN_CENTER);
      cell10.setVerticalAlignment(Element.ALIGN_MIDDLE);
      Table.addCell(cell10);
      
      
      Document.add(Table);


//PdfPTable table = new PdfPTable(3); // 3 columns.

//PdfPCell cell1 = new PdfPCell(new Paragraph("tabu"));
//PdfPCell cell2 = new PdfPCell(new Paragraph("girish"));
//PdfPCell cell3 = new PdfPCell(new Paragraph("rice"));

//table.addCell(cell1);
//table.addCell(cell2);
//table.addCell(cell3);

//document.add(table);
Document.add(new Paragraph("Hello World"));
Document.add(new Paragraph("girish"));
%>

<%
// step 5:
Document.close();
// we output the writer as bytes to the response output
response.reset();
try
{
//DataOutput output = new DataOutputStream( response.getOutputStream() );
//byte[] Bytes = Buffer.toByteArray();
//response.setContentLength(Bytes.length);
//for( int i = 0; i < Bytes.length; i++ ) { output.writeByte( Bytes[i] ); }
//response.getOutputStream().flush();
//response.getOutputStream().close();


//ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
//wb.write(outByteStream);

byte [] outArray = Buffer.toByteArray();
response.setContentLength(outArray.length);
response.setHeader("Expires:", "0"); // eliminates browser caching
//response.setHeader("Content-Disposition", "attachment; filename=girish.pdf");
OutputStream outStream=response.getOutputStream();
outStream.write(outArray);
outStream.flush();  
outStream.close();
response.getOutputStream().close();


}catch(Exception e)
{
	System.out.println("the error may be"+e.getMessage());
}


%>


<%

try {
    
    String host = "smtp.gmail.com";
    String Password = "986646514698";
    String from = "ggguru74@gmail.com";
    String toAddress = "girish.gorantla@gmail.com";  //Receivers email id     
    Properties props = System.getProperties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtps.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    
    javax.mail.Session session1 = javax.mail.Session.getInstance(props, null);

    MimeMessage message = new MimeMessage(session1);

    message.setFrom(new InternetAddress(from));

    message.setRecipients(Message.RecipientType.TO, toAddress);

    message.setSubject("Test Email");

    BodyPart messageBodyPart = new MimeBodyPart();
     
         message.setSubject("from goschool");
    messageBodyPart.setText("you registered sucessfully");
  
    MimeBodyPart attachment=new MimeBodyPart();
    ByteArrayDataSource dataSource=new ByteArrayDataSource(new ByteArrayInputStream(Buffer.toByteArray()), "application/pdf");
    attachment.setDataHandler(new DataHandler(dataSource));
    attachment.setFileName("RegistrationForm.pdf");
    
    
    
    Multipart multipart = new MimeMultipart();

    multipart.addBodyPart(messageBodyPart);
    multipart.addBodyPart(attachment);
    
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
