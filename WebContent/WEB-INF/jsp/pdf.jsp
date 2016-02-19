<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<body bgcolor="orange">
<%@
page import="java.io.*, java.awt.Color, com.itextpdf.text.*, com.itextpdf.text.pdf.*"
%><%
response.setContentType( "application/pdf" );

// step 1:
Document document = new Document();
// step 2:
ByteArrayOutputStream buffer = new ByteArrayOutputStream();
PdfWriter.getInstance( document, buffer );
// step 3:
document.open();
// step 4:
%>	
<center>
<%
String filename = "C:/Users/hp s/Desktop/logo.jpg";
Image image = Image.getInstance(filename);
image.setAbsolutePosition(500f, 650f);
document.add(image);
PdfPTable table = new PdfPTable(3); // 3 columns.

PdfPCell cell1 = new PdfPCell(new Paragraph("tabu"));
PdfPCell cell2 = new PdfPCell(new Paragraph("girish"));
PdfPCell cell3 = new PdfPCell(new Paragraph("rice"));

table.addCell(cell1);
table.addCell(cell2);
table.addCell(cell3);

document.add(table);
document.add(new Paragraph("Hello World"));
document.add(new Paragraph("girish"));
%>
</center>
<%
// step 5:
document.close();
// we output the writer as bytes to the response output
DataOutput output = new DataOutputStream( response.getOutputStream() );
byte[] bytes = buffer.toByteArray();
response.setContentLength(bytes.length);
for( int i = 0; i < bytes.length; i++ ) { output.writeByte( bytes[i] ); }
response.getOutputStream().flush();
response.getOutputStream().close();
%>

</body>
</html>
