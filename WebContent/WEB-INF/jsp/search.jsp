<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
.toggler { width: 500px; height: 200px; position: relative; }
#button { padding: .5em 1em; text-decoration: none; }
#effect { width: 240px; height: 135px; padding: 0.4em; position: relative; }
#effect h3 { margin: 0; padding: 0.4em; text-align: center; }
.ui-effects-transfer { border: 2px dotted gray; }
</style>

<style >

#header{
  position: absolute;
  height: 75px;
  font-family: Arial,Helvetica,sans-serif;
  z-index: 200;
}


#sample {
    //border: 1px solid black;
    height: 15px;
    padding: 12px;
    width:25%;
     position: absolute;
    overflow: hidden;    
    background: #fafafa;
-webkit-box-shadow: 0 4px 8px -4px #999;
  -moz-box-shadow: 0 4px 8px -4px #999;
  box-shadow: 0 4px 8px -4px #999;
  top: 47%;
	left: 47%;
}

#login {
    //border: 1px solid black;
    position: absolute;
	height: auto;
    padding: 12px;
    width:25%;
    //overflow: auto;    
    background: #fafafa;
-webkit-box-shadow: 0 4px 8px -4px #999;
  -moz-box-shadow: 0 4px 8px -4px #999;
  box-shadow: 0 4px 8px -4px #999;
    top: 23%;
	left: 15%;
	
}


#search{
top:20%;
right:40%;
left:40%;
position:absolute;
}

#link{
text-decoration: none;
clolr:#4D148C ;
}
#id
{
    /*float: left;*/
  width: 144px;
  height: 12px;
  padding: 3px 2px;
  border: 1px solid #CCC;
  margin-bottom: 10px;
  font-size: .917em;
  color: #666;
}
#pwd
{
  /* float: left;*/
  width: 144px;
  height: 12px;
  padding: 3px 2px;
  border: 1px solid #CCC;
  margin-bottom: 10px;
  font-size: .917em;
  color: #666;
}

#banner{
width: 90%;/*ADJUST THE WIDTH OF BANNER*/
margin: 0px auto;
max-width: 80em;
display: block;
position : absolute;
padding: 0.7em 40px 0.7em 0.625em;
background: none repeat scroll 0% 0% #4D148C; /*CHANGE #038D98 TO CHANGE THE BACKGROUND COLOR IN THE BANNER */
color:#fff;  /* cHANGE THIS TO CHANGE THE COLOR OF THE FONT "wELCOME INTERNS" IN THE HEADING */
}

#newsmodule{

//border: 1px solid black;
    position: absolute;
	height: auto;
    padding: 12px;
    width:25%;
    //overflow: auto;    
    background: #fafafa;
-webkit-box-shadow: 0 4px 8px -4px #999;
  -moz-box-shadow: 0 4px 8px -4px #999;
  box-shadow: 0 4px 8px -4px #999;
    top: 23%;
	left: 47%;
	

}


</style>
</head>
<body bgcolor="#E5E5E5">

<script>
function loadXMLDoc()
{
	//alert('asd');
var xmlhttp;
var message=document.getElementById("message");

if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
  
xmlhttp.onreadystatechange=function(){
	//alert(xmlhttp.status);
	//alert(xmlhttp.valueOf().toString());
 			 if (xmlhttp.readyState==4 && xmlhttp.status==200)
   				 {
	  						alert(xmlhttp.responseText);
	  						message.innerHtml=xmlhttp.response;
    			  }
  }
xmlhttp.open("GET","schoolSearch.htm?"+"key="+document.getElementById('id').value,true);
alert("schoolSearch?"+"id="+document.getElementById('id').value);
//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send();//"id="+document.getElementById('id').value+"&pwd="+document.getElementById('pwd').value);
}
</script>




<div id="banner">
<CENTER><h1>Go2YourSchool</h1></CENTER>
</div>

<br><br><br><br>

<div id="search">
<span id="Search_Form"><center>
<h3><font color=#4D148C >Search</font></h3>
School Name:<input type="text" name="id"  onkeypress="loadXMLDoc()" id="id"><input type="submit" name="button" value="search" ></center>
</span>

<span id="message">

<ul>Praneeth</ul>
</span>
</div>




</body>
</html>