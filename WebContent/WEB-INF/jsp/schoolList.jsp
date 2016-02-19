<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> -->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/schoollist.css" />

<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>SchoolList</title>
</head>
<body>



            <header id="header">
			<div class="col-md-2 logo">
				<img src="images/schoollogo.jpg"/>
			</div>
			<ul class="nav  nav-justified">
				<li class="active"><a href="#">Find a school</a></li>
				<li><a href="#">Review a school</a></li>
				<li><a href="#">GreatKids</a></li>
				<li><a href="#">Gallery</a></li>
				<li><a href="#">sign in</a></li>
			</ul>
			<div class="clear"></div>
		</header> <hr>
		
		 
		<div class="middle">
			<div class="col-md-3 dropdown">
				<select style="width:50%;" class="form-control">
					<option value="">select</option>
					<option value="1">india</option>
					<option value="2">india</option>
					<option value="3">india</option>
					<option value="4">india</option>
				</select>
			</div>
			<div class="col-md9 searchbox">
				<form>
					<input class="search" type="text" placeholder="Search here"/>
					<button class="btn btn-info btn-md"  type="submit" value="Search">Search</button>
				</form>
			</div>
		</div>	
		<br/>
		<div class="col-md-10 sub-menu" style="margin:0 0 5px 50px;">
			<p class="text-muted">Nearby Cities :&nbsp;&nbsp;&nbsp; <i><a href="#">India</a>&nbsp;&nbsp; <a href="#">Delhi</a>&nbsp;&nbsp; <a href="#">Mumbai</a>&nbsp;&nbsp; <a href="#">Pune</a>&nbsp;&nbsp; <a href="#">Hyderabad</a>&nbsp;&nbsp; <a href="#">Bangalore</a>&nbsp;&nbsp; <a href="#">Kolkatta</a>&nbsp;&nbsp; <a href="#">Gujarat</a></i> </p>
		</div> <hr>
        
        
        <c:forEach items="${schoolList}" var="school" varStatus="status">
		<div class="col-md-10 description">
			<div class="col-md-2">
				<img src="images/schooldefaultimage.png">
			</div>
			<div class="col-md-8 sub-desc">
				<h5 style="color:#34aadc;"><b><a href="display.htm?id=${school.id}">${school.schoolName}</a> </b></h5>
				<p>${addressList[status.index].phone},${addressList[status.index].doorNo},${addressList[status.index].address1},${addressList[status.index].address2}, ${addressList[status.index].city}</p>
			</div>
			<div class="col-md-2 btn-grp">
				<button class="btn btn-success btn-md"  type="button" value="Search"><span class="glyphicon glyphicon-ok"></span> <i>Compare</i></button><br><br/><br/>
				<button class="btn btn-success btn-md"  type="button" value="Search"><span class="glyphicon glyphicon-home"></span> <i>Home for sale</i></button>
			</div>
		</div>
	</c:forEach>	
	
		<div class="col-md-12">
		<br/>
		<h5 style="text-align:right;margin-right:120px;">Schools 1 to 10 of 10</h5>
		</div>
		<hr style="color:red;">
		<div class="footer-top">
     <div class="content">
        <div class="col-md-3">
            <h4>About School</h4>
             <p>Our mission is to help millions of parents get a great education for their kids. GreatSchools.org is an independent nonprofit and the leading national source of school information for families.</p>
         
			
        </div>
        <div class="col-md-3">
            <h4>company</h4>
            <p>our mission<br>our people<br>jobs<br>contactus</p>
        </div>
        <div class="col-md-3">
            <h4>Media</h4>
           <p>Advertise with us<br>Licensing<br>Partners<br>Media room</p>
           
        </div>
        <div class="col-md-3">
            <h4>Policies</h4>
           
            <p>How we rate schools<br>School review guidelines<br>Terms of use<br>Privacy policy</p>
            
        </div>
    </div>
    <div class="clearfix"></div>
</div>
	<div class="clearfix"></div>
	<hr/>
	<div class="footer" style="text-align:center;">
 All rights reserved
	</div>
		
</body>			
</html>	










<%-- 
<div id="head">
<div id="head-in">
<div id="logo">
<h1>GO2YOURSCHOOL</h1>
</div>
<div id="nav">
<div id="nav-in">

			<ul>
				<li class="current"><a href="#">Homepage</a></li>
				<li><a href="Admin.html" >Admin</a></li>
				<li><a href="AboutUs.html" >About Us</a></li>
				<li><a href="Parents.html">Parents</a></li>
				<li><a href="ContactUs.html">Contact Us</a></li>
			</ul>
</div>
</div>

</div>
</div>


<div id="search">
<div id="search-in">

<form >
<div class="container">
				<fieldset class="clearfix">

					<input type="text" name="search" style="width:900px;height:40px;" align="middle" />
					<input type="button" value="Search" class="button" style="width:90px;height:40px;background: #1bba9a;"/>

				</fieldset>
           </div>
	</form>
			
</div>
</div>



<div id="content">
<div id="content-in">
we found following matching your request

<c:forEach items="${schoolList}" var="school" varStatus="status">
<div id="box" >
<table>
                <tr>
                   <td>
                    <table>
                        <tr>
						<td>
						
						<div class="image">
							<img src="images/school.png"/>
							</div>
							
						</td>
						</tr>
					</table>
				   </td>
				   
				   
					<td>
						<table>
							<tr>
							<td>
<div class="namebox">
<h1> <a href="display.htm?id=${school.id}">${school.schoolName}</a>
,${addressList[status.index].address1},${addressList[status.index].city}</h1><br/>near ${addressList[status.index].city}
<!---use <br> here-->
</div> <!--  end for NameBox tag -->

							</td>
							</tr>
						</table>
					</td>
					

					<td>
						<table>
							<tr>
							<td>
							
							<div class="addressbox">contact:${addressList[status.index].phone}
													h.no- ${addressList[status.index].doorNo},
													street:${addressList[status.index].address2},${addressList[status.index].city}
													<!---use <br> here--->
							</div>
							
							</td>
							</tr>
						</table>
						</td>
						
						
						<td>
						<table>
						<tr>
						<td>
						
						rating
						<div class="rating">
                        </div>
                        
						</td>
						</tr>
						</table>
					</td>
			</tr>
	</table>
	
	</div>
 </c:forEach>
</div>
</div>

</body>
</html> --%>