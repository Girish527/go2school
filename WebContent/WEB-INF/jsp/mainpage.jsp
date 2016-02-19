<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<!-- <html> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
<link href="css/main1.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" href="css/jquery.facebox.css" type="text/css" media="screen" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script src="/../../JavaScript/main.js"></script>
<!--- code modified so need to notify starts here -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="JavaScript/jquery.facebox.js"></script>
<script type="text/javascript" src="JavaScript/popUp.js"></script>
<script language="JavaScript" type="text/javascript">
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
	  						//alert(xmlhttp.responseText);
	  						message.innerHTML=xmlhttp.response;
	  						//alert(message.innerHTML);
    			  }
  }
xmlhttp.open("GET","schoolSearch.htm?"+"key="+document.getElementById('id').value,true);
//alert("schoolSearch?"+"id="+document.getElementById('id').value);
//xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
xmlhttp.send();//"id="+document.getElementById('id').value+"&pwd="+document.getElementById('pwd').value);
}
</script>
<script language="JavaScript" type="text/javascript">

function submitForm()
{
	document.forms['searchBox'].reset();
	}

</script>


<!--- code modified so need to notify ends here -->

<div id="main">
<div id="header-wrapper" >
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">Go2YourSchool</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="#" accesskey="1" title="">HomePage</a></li>
				<li><a href="AdminForm.htm" accesskey="2" title="" target="_new">ADMIN</a></li>
				<li><a href="#" accesskey="3" title="">About Us</a></li>
				<li><a href="ParentsLogin.htm" accesskey="4" rel="facebox">Parents</a></li>   
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>

<div id="banner-wrapper">
	<div id="banner" class="container">
		<!--<div class="title">-->
        <div id="page">
            <form id="searchForm" method="get" action="schoolsList.htm" name="searchBox">
		    <fieldset>
		     <input id="id" type="text" name="id"  onkeypress="loadXMLDoc()"/>
		     <span id="message" style="text-align: center;">
		          <br/><br/><br/><br/><br/><br/><br/> 
      		 </span> 
		     <input type="submit" value="Submit" id="submitButton" onclick="submitForm()"/> <br/>
            </fieldset>
         <!--   <span id="message">
		      <br/><br/><br/><br/><br/><br/><br/> 
      		 </span>  -->
          </form>
          
      </div>       
	</div><!-- end for banner-->
</div> <!-- end for banner-wrapper-->
</div>  <!-- end for header-wrapper-->

<div id="wrapper">
	<div id="three-column" class="container">
    
		<div class="title">
			<h2>Introducing Emotional Smarts</h2>
			<span class="byline">The secret to raising confident, happy kids starts with emotional intelligence.</span>
		</div>
		<div class="boxA">
			<p>Research shows kids with emotional intelligence are happier, healthier, and more successful. Check out our new collection of articles, videos, and a feeling words game!</p> <br />
			<a href="#" class="button button-alt">For Fomailies</a>
		</div>
		<div class="boxB">
			<p>Rivalry between sisters and brothers can set the stage for learning and lifelong friendship &mdash; but it can also escalate into abuse.</p>
            <br/>
            <br/>
			<a href="#" class="button button-alt">For Schools</a>
		</div>
		<div class="boxC">
			<p> Try out some of our recommended interactive apps And websites that will not only help with learning but are fun too!</p> <br/><br/>
			<a href="#" class="button button-alt">Learning Zone</a>
		</div>
	</div>
</div>
<div id="welcome">
	<div class="container">
		<div class="title">
			<h2>Who we are</h2>
			<span class="byline"> <b>The Go2YourSchool website is a very quick and convenient snapshot to get into any school near by you</b></span>
		</div>
        <!--<img src="images/download.jpg" alt="" class="image image-full" />-->
      <p> <b>Go2YourSchool is a non-profit organization with profiles of more than 200,000 preK-12
         schools  public, public charter and private  and over one million reviews from
         parents, teachers and students sharing information about the schools they know best.
         We also have thousands of articles, worksheets, and videos to help parents encourage
         and support learning at home. Our new personalized education guide, GreatKids, helps
         parents see how their children are doing, support their learning, and find great
         education resources. </b></p>
		<ul class="actions">
			<li><a href="#" class="button">Learn More</a></li>
		</ul>
	</div>
</div>

<div id="footer1">

<%@ include file="footer.jsp" %>

</div> <!-- end of footer-->


</div><!-- main end-->
</body>
</html>
