<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Go2YourSchool</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Chivo:400,900" rel="stylesheet" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/adminspecificpage.css" rel="stylesheet" type="text/css" media="all" />

 <script type="text/javascript">

var index=1;
function getData()
{
//alert("before");
var tableName=document.getElementById("name").value;
//alert(tableName);
var fee="create table "+document.getElementById("name").value+" (";

for(i=1;i<=index;i++)
	{
		alert("abcd");
		fee=fee+" "+document.getElementById('amount'+i).value+" "+document.getElementById('type'+i).value+" ";
		if(i!=index) fee+=" , ";
	}
	fee=fee+")";
	document.getElementById('fee').setAttribute("value", fee);
	alert("table name"+tableName+", and the query is"+fee);
	//document.getElementById("form").submit();
	window.location = 'AdminTableSaveinDB.htm?tableName='+tableName+'&query='+fee;
	
}



function addOption(){	
	index++;
	var breakTag=document.createElement("BR");
	var forms=document.getElementById('form container');
	forms.appendChild(breakTag);
	forms.removeChild(document.getElementById('button1'));
	//forms.removeChild(document.getElementById('submit_button'));
	forms.appendChild(breakTag);
	
	var inputElement=document.createElement("INPUT");
	inputElement.setAttribute("type", "text");
	inputElement.setAttribute("id","amount"+index);
	forms.appendChild(inputElement);
	forms.appendChild(breakTag);

	var selectElement=document.createElement("SELECT")
	selectElement.setAttribute("id", "type"+index);
	//selectElement.innerHTML="<option value='AC Room monthly'>AC Room monthly</option> <option value='non AC Room monthly'>non AC Room monthly</option> <option value='AC Room daily'>AC Room daily</option><option value='non AC Room monthly'>non AC Room monthly</option>";
	selectElement.innerHTML="<option value='int'>number</option><option value='String'>string</option><option value='date'>date</option>";
	forms.appendChild(selectElement);
	forms.appendChild(breakTag);	

	var addButton=document.createElement("INPUT");
	addButton.setAttribute("type", "button");
	addButton.setAttribute("id","button1");
	addButton.setAttribute("value","add more");
	addButton.setAttribute("onClick","addOption()");
	forms.appendChild(addButton);
	forms.appendChild(breakTag);
	
	/* var submitButton=document.createElement("INPUT");
	submitButton.setAttribute("type", "submit");
	submitButton.setAttribute("id","submit_button");
	forms.appendChild(submitButton);	
	forms.appendChild(breakTag); */
}

</script>
 
 
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

       <form:form action="AdminTableSaveinDB.htm" method="get" commandName="pg" modelAttribute="pg" id="form">
	
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><h2>Enter your search criteria</h2></td>
                </tr>

            <tr>
                    <td colspan="2" align="center">Table Name:<input type=text id="name"/>&nbsp;&nbsp;&nbsp;</td>
                </tr>
              
			<tr>
				<td>
					table columns:
				</td>
				<td>
					<div id="form container">
						
						<span id="customHolder"></span>
						<input type=text id="amount1"/>&nbsp;&nbsp;&nbsp;
						<select id="type1">
							<option value="int">number</option>
							<option value="String">string</option>
							<option value="date">date</option>
						</select><br/>
						<input type="button" onClick="addOption()" id="button1" value="add more"/>
				</div>	
				</td>
             </tr>    
             <tr>
                 <td colspan="2" align="center"><input type="button" value="Create Table" onClick="getData()"/></td>
             </tr>
                       
            </table>
            <input type="hidden" id="fee"/>
            
           <!-- </form>-->
        </form:form>    
        
    </div> <!--content-->
	</div>  <!-- page-->
</div> <!-- wrapper -->
<%@include file="AdminPageFooter.jsp" %>
</body>
</html>