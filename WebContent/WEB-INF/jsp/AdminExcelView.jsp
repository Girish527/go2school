<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hslf.model.Sheet"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.goschool.beans.UDFile" %>
<%@ page import="org.apache.poi.hssf.usermodel.*" %>
<%@page import="org.apache.poi.ss.usermodel.CellStyle" %>
<%@page import="org.apache.poi.ss.usermodel.*" %>
<%@page import="com.goschool.daoimplementations.AdminPageDaoImpl" %>
<%@page import="org.apache.poi.ss.usermodel.DataValidationConstraint.ValidationType"%>
<%@page import="org.apache.poi.ss.util.CellRangeAddressList" %>
<%@page import="org.apache.poi.ss.util.CellRangeAddress" %>
<%@page import="org.apache.poi.hssf.usermodel.HSSFDataValidationHelper"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.ComparisonOperator"%>
<%@page import="org.apache.poi.ss.usermodel.DataValidation"%>
<%@page import="org.apache.poi.ss.usermodel.DataValidationConstraint"%>
<%@page import="org.apache.poi.ss.usermodel.DataValidationHelper"%>
<%@page import="org.apache.poi.ss.util.CellRangeAddressList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ExcelSheet</title>
</head>
<body>

<%
/*  for future response
   AdminPageDaoImpl adminDao=new AdminPageDaoImpl();
   Connection connection=adminDao.DBConnection();
   Class.forName("com.mysql.jdbc.Driver");    
   String url="jdbc:mysql://localhost:3306/schooldb";
   Connection connection=DriverManager.getConnection(url,"root","Girish@527");
	
	*/
	
	//this code is to get udfile---tablename 
	UDFile udfile=(UDFile)request.getAttribute("udfile");
	
	//data base connection & result set details
	Connection connection=AdminPageDaoImpl.DBConnection();
	PreparedStatement stmt=connection.prepareStatement("select * from admin");
	ResultSet rs=stmt.executeQuery();
	ResultSetMetaData colInfo=rs.getMetaData();
	
	// create a small spreadsheet
	HSSFWorkbook wb = new HSSFWorkbook();
	HSSFSheet sheet = (HSSFSheet)wb.createSheet("sheet");
	//sheet.protectSheet("girish");
	short rowIndex=0;
	//Sheet sheet=wb.createSheet();
	//execute sql query
	
	//get list of column name and store them as first row
	//sheet.setDefaultColumnWidth(30);  
	List<String> colNames=new ArrayList<String>();
	HSSFRow rowhead=   sheet.createRow(rowIndex++);
	HSSFCell cell=null;
	
	
	//creating style for sheet
	CellStyle headerRowStyle = wb.createCellStyle();
	//Font font=wb.createFont();
	//font.setBoldweight(HSSFFont.)
    headerRowStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
    headerRowStyle.setFillForegroundColor(IndexedColors.LIGHT_ORANGE.getIndex());
    headerRowStyle.setBorderBottom(CellStyle.BORDER_THIN);
    headerRowStyle.setBorderTop(CellStyle.BORDER_THIN);
    headerRowStyle.setBorderRight(CellStyle.BORDER_THIN);
    headerRowStyle.setBorderLeft(CellStyle.BORDER_THIN);
	System.out.println("total count of columns"+colInfo.getColumnCount());
	
	
	
	
	//this is for data validation


/*
CellRangeAddressList addressList = new CellRangeAddressList(0, 200, 0, 0);
int n=DataValidationConstraint.ValidationType.INTEGER;
System.out.println("the value of integer validation"+n);
int[] validationTypes = new int[]{ValidationType.INTEGER,ValidationType.ANY,ValidationType.TEXT_LENGTH}; */
/*
*
*very important for future reference
*
//DVConstraint dvConstraint = DVConstraint.createExplicitListConstraint(new String[]{"10", "20", "30"});
//DVConstraint dvConstraint= DVConstraint.createNumericConstraint(DVConstraint.ValidationType.INTEGER,DVConstraint.OperatorType.BETWEEN, "10", "100");
   

//Create an any rule. Numberic method is only one that support Validation Type.
//DataValidationConstraint constraint = dataValidationHelper.createNumericConstraint(DataValidationConstraint.ValidationType.INTEGER, 
  //          DataValidationConstraint.OperatorType.GREATER_OR_EQUAL,"1",null); 

//DataValidation dataValidation = new HSSFDataValidation (addressList, constraint);
//DataValidation dataValidation =dataValidationHelper.createValidation(constraint, addressList);
//dataValidation.setSuppressDropDownArrow(false);
//sheet.addValidationData(dataValidation);

*/


DataValidationHelper dataValidationHelper = sheet.getDataValidationHelper();
// here doing for validation operation
   CellRangeAddressList addressList1 =null;
   CellRangeAddressList addressList2 =null;

   DVConstraint NConstraint=null;//numeric
   DVConstraint SConstraint=null;//string
   DVConstraint DCConstraint=null;//decimal
   DVConstraint DTConstraint=null;//date
   DVConstraint TLConstraint=null;//textlength
   DVConstraint ISActiveConstraint = DVConstraint.createExplicitListConstraint(new String[]{"0", "1"});
   DVConstraint EmailConstraint=null;
   
   DataValidation SdataValidation =null;  
   DataValidation NdataValidation =null;
   DataValidation DCdataValidation =null;
   DataValidation DTdataValidation =null;
   DataValidation TLdataValidation =null;
   DataValidation ISActivedataValidation =null;
   DataValidation EmaildataValidation =null;
    
   
   //providing default for first column in every sheet--------------working
   addressList1 = new CellRangeAddressList(0, 10000, 0, 0);
   NConstraint= DVConstraint.createNumericConstraint(DVConstraint.ValidationType.INTEGER,DVConstraint.OperatorType.BETWEEN, "1","100000");
   NdataValidation =dataValidationHelper.createValidation(NConstraint, addressList1);
   NdataValidation.setSuppressDropDownArrow(false);
   sheet.addValidationData(NdataValidation);
   System.out.println("the"+0+"value is number");
   
   //providing for email validations
   //String EMAIL_PATTERN = "*@.abcdefghijklmnopqrstuvwxyz"+"ABCDEFGHIJKLMNOPQRSTUVWXYZ"+"0123456789";
   String strFormula="this email validation" ;//"AND(FIND(" +"'@'"+ ",A2),FIND(" +"."+",A2),ISERROR(FIND(" +" "+",A2)))";
   for(int i=0;i<1;/*strFormula.length()*/i++)
   {
	   System.out.println(strFormula);
   }
   addressList1 = new CellRangeAddressList(0, 10000, 6, 6);
   String list1[]={"ISNUMBER(G1)","AND(G1>200,G1<300)","COUNTIF($G$1:G1,G1)>1"};
  // String ref=(char)('@')+"";
   //EmailConstraint=DVConstraint.createCustomFormulaConstraint("AND(FIND("+'@'+",$A$2),FIND(.,$A$2),ISERROR(FIND( ,$A$2)))");
   //((ISNUMBER(G15))& (COUNTIF($G$15:G15,G15)>1))&(AND(G15>200,G15<300)) //need to combine two formulas
   //int k=5;
   //String str="AND(NOT(ISERROR(FIND(\"@\",$G$1"+k+"))),NOT(ISERROR(FIND(\".\",$G$1"+k+"))),ISERROR(FIND(\" \",$G$1"+k+")))";
   //EmailConstraint=DVConstraint.createCustomFormulaConstraint("AND(NOT(ISERROR(FIND(\"@\",$G))),NOT(ISERROR(FIND(\".\",$G))),ISERROR(FIND(\" \",$G)))");
   
   //providing validations for remaining column
  for(int i=2;i<=colInfo.getColumnCount();i++)
   {	
	  
	 addressList1 = new CellRangeAddressList(0, 10000, i-1, i-1);	  
	  //this small code for autosize column
	 sheet.autoSizeColumn(i-1);	  
	 String ColumnName=colInfo.getColumnName(i); 
	 int ColumnType=colInfo.getColumnType(i);
	 int ColumnSize=colInfo.getColumnDisplaySize(i);
	 String SColumnSize=Integer.toString(ColumnSize);
	 
	 
	 NConstraint= DVConstraint.createNumericConstraint(DVConstraint.ValidationType.INTEGER,DVConstraint.OperatorType.BETWEEN, "0","1000000000");
	 SConstraint= DVConstraint.createNumericConstraint(DVConstraint.ValidationType.ANY,DVConstraint.OperatorType.IGNORED,null,null);
	 DCConstraint= DVConstraint.createNumericConstraint(DVConstraint.ValidationType.DECIMAL,DVConstraint.OperatorType.GREATER_OR_EQUAL,"0.0000000000000",null);
	 DTConstraint= DVConstraint.createDateConstraint(DVConstraint.OperatorType.BETWEEN,"01/01/1000","31/12/9999","dd/MM/yyyy");
	 TLConstraint= DVConstraint.createNumericConstraint(DVConstraint.ValidationType.TEXT_LENGTH,DVConstraint.OperatorType.LESS_OR_EQUAL,SColumnSize,null); 
     
     //this code is for email validation
     System.out.println("the column name is"+ColumnName);
     if (ColumnName.equals("isactive"))
     {
    	   ISActivedataValidation =dataValidationHelper.createValidation(ISActiveConstraint, addressList1);
    	   ISActivedataValidation.setSuppressDropDownArrow(false);
    	   sheet.addValidationData(ISActivedataValidation);
    	   System.out.println("the"+0+"value is number");
    	   
     }
     else if(ColumnName.equals("email"))
     {
    	 addressList1 = new CellRangeAddressList(0, 20, 6, 6);
    	 
    	 //HSSFRow dataRow1=null;
    	 //for(int j=2;j<200;j++)
    	 //{
    	 //dataRow1=sheet.createRow(2);
    	 //cell=dataRow1.createCell((short)2);//,Cell.CELL_TYPE_FORMULA);
    	 //cell.setCellType(Cell.CELL_TYPE_FORMULA);
    	 //cell.setCellFormula("AND(NOT(ISERROR(FIND(\"@\",$G$15))),NOT(ISERROR(FIND(\".\",$G$15))),ISERROR(FIND(\" \",$G$15)))");
    	 //cell.setCellValue("girish");
    	 
    	 //cell.setCellValue("girish");
    	 /*EmailConstraint=DVConstraint.createCustomFormulaConstraint(str1);*/
    	 for(int j=14;j<=15;j++)
    	 {
    	   addressList1 = new CellRangeAddressList(0, 20, 6, 6);
    	   EmailConstraint=DVConstraint.createCustomFormulaConstraint("ISERROR(FIND(\"@\",G"+j+"))");
           EmaildataValidation =dataValidationHelper.createValidation(EmailConstraint, addressList1);
           EmaildataValidation.setSuppressDropDownArrow(false);	       
    	 }
    	 //}
    	 sheet.addValidationData(EmaildataValidation);
  	   System.out.println("the formula in email is");  
     }
     else if (ColumnType == Types.VARCHAR)
	  {
		SdataValidation =dataValidationHelper.createValidation(TLConstraint, addressList1);
		SdataValidation.setSuppressDropDownArrow(false);
		sheet.addValidationData(SdataValidation);
		System.out.println("the"+i+"value is varchar");
		
	}
	else if(ColumnType == Types.INTEGER)
	{
		NdataValidation =dataValidationHelper.createValidation(NConstraint, addressList1);
		NdataValidation.setSuppressDropDownArrow(false);
		sheet.addValidationData(NdataValidation);
		System.out.println("the"+i+"value is number");
	}
	else if(ColumnType == Types.DECIMAL)
	{
		DCdataValidation =dataValidationHelper.createValidation(DCConstraint, addressList1);
		DCdataValidation.setSuppressDropDownArrow(false);
		sheet.addValidationData(DCdataValidation);
		System.out.println("the"+i+"value is Decimal");
		
	}
	else if(ColumnType == Types.DATE)
	{
		DTdataValidation =dataValidationHelper.createValidation(DTConstraint, addressList1);
		DTdataValidation.setSuppressDropDownArrow(false);
		sheet.addValidationData(DTdataValidation);
		System.out.println("the"+i+"value is Date");
	}
     
  }//end of for loop
  
  //small code for auto filter
  sheet.setAutoFilter(new CellRangeAddress(0,1000,0,colInfo.getColumnCount()- 1));

	//setting columns hidden
	for(int i=colInfo.getColumnCount();i<256;i++)
	{
		sheet.setColumnHidden(i,true);
	}
	
	//adding table data to excel sheet
	for(int i=1;i<=colInfo.getColumnCount();i++)
	{
	
		colNames.add(colInfo.getColumnName(i));
		rowhead.createCell((short)(i-1)).setCellValue(
				new HSSFRichTextString(colInfo.getColumnName(i)));
		rowhead.getCell(i-1).setCellStyle(headerRowStyle);
		    		
	}
	
	while(rs.next())
	{
		HSSFRow dataRow=sheet.createRow(rowIndex++);
		short colIndex=0;
		for(String colName:colNames){
			dataRow.createCell(colIndex++).setCellValue(
					new HSSFRichTextString(rs.getString(colName)));
		}
	}
	//this testing for email validation
	
		//sheet.getRow(2).getCell(2).setCellFormula("AND(NOT(ISERROR(FIND(\"@\",$G$15))),NOT(ISERROR(FIND(\".\",$G$15))),ISERROR(FIND(\" \",$G$15)))");
	

	 // write it as an excel attachment
	ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
	wb.write(outByteStream);
	byte [] outArray = outByteStream.toByteArray();
	response.setContentType("application/ms-excel");
	response.setContentLength(outArray.length);
	response.setHeader("Expires:", "0"); // eliminates browser caching
	//response.setHeader("Content-Disposition", "attachment; filename="+TempTableName+".xls"); 
	response.setHeader("Content-Disposition", "attachment; filename="+udfile.getTableName()+".xls");	
	OutputStream outStream = response.getOutputStream();
	outStream.write(outArray);
	outStream.flush();  
    outStream.close();
	%>

successfully created

</body>
</html>