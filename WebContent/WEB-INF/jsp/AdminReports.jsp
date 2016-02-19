<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.goschool.daoimplementations.AdminPageDaoImpl" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*,com.goschool.beans.UDFile" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Go2YourSchool</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Chivo:400,900" rel="stylesheet" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/adminspecificpage.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>

<div id="wrapper">
       <%@include file="AdminPageHeader.jsp" %>
       
	<div id="page" class="container">
		<div id="content">
			<div class="title">
				<h2>Edit Your Activities</h2>
				<span class="byline">You can edit and perform operations on your Data</span>
           </div>
           
<% 
		UDFile udfile=(UDFile)request.getAttribute("udfile");
        Connection connection=AdminPageDaoImpl.DBConnection();
		DatabaseMetaData metadata=connection.getMetaData();
		String[] names={"TABLE"};
		ResultSet tables=metadata.getTables(null,"%","%",names);
		
		%>	
		
		
		
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
    <script type="text/javascript">	
	//$('#btnUpload').click(function () {
		function DFunction() {
			alert("coming");
    var uploadpath = $('#file').val();
    var fileExtension = uploadpath.substring(uploadpath.lastIndexOf(".") + 1, uploadpath.length);
  
    if ($('#file').val().length == 0) {
        // write error message
        alert("choose required file");
        return false;
    }

    if (fileExtension == "xls" || fileExtension == "xlsx") {
        //write code for success
        alert("file uploaded successfully");
    }
    else {
        //error code - select only excel files
        alert("please upload only .xls and xlsx files only");
        return false;
    }
  }
		
		
		
		
		
	</script>
		
		
		<form:form id="ExcelReport" modelAttribute="udfile" method="post" action="AdminExcelView.htm">
		<h1>select to generate excel report</h1>
		<select name="dropDownTables">
		<%while(tables.next()){ 
		 String TempTableName=tables.getString("TABLE_NAME");/*System.out.println("in the jsp table name---->"+TempTableName);*/%>
		<option value="<%=tables.getString("TABLE_NAME")%>"><%=tables.getString("TABLE_NAME")%></option>
		<%} %>		
		</select><br/>
		<input type="submit" value="GetReport" />
		</form:form>
	
      <br/>						
	<form:form id="ExportExcel" method="post" enctype="multipart/form-data" action="AdminExportExcel.htm" onsubmit="return DFunction();" style="margin: 0 auto;">
        <table>
        <tr>
       <td> Upload your file please:</td>
        <td><input type="file" id="file1" name="file" accept=".xls,.xlsx"/></td></tr>
        <tr>
        <td><input id="btnUpload" type="submit" value="upload" onclick="return DFunction();" /></td>
        <td><input type="reset" value="clear"/></td></tr>
        <form:errors path="file" cssStyle="color: #ff0000;" />
     </table>
    </form:form>
			<span> 
			<%
			if(udfile!=null){
				%>
				<script> alert('<%= udfile.msg%>');</script>
				
				<% 
			}
			%>
			 </span>		
									
		</div> <!--content-->
	</div>  <!-- page-->
</div> <!-- wrapper -->
<%@include file="AdminPageFooter.jsp" %>
</body>
</html>