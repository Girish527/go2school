<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/jquery.facebox.css" type="text/css" media="screen" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="JavaScript/jquery.facebox.js"></script>
<script type="text/javascript" src="JavaScript/popUp.js"></script>
        <form method="post" action="login.jsp">
            <center>
            <table>                
                    <tr>
                        <th>Login Here</th>
                    </tr>                
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="0">Yet Not Registered!! </td>
                        <td><a href="ParentsRegister.htm" rel="facebox">Register Here</a></td>
                    </tr>
            </table>
            </center>
        </form>
    </body>
</html>