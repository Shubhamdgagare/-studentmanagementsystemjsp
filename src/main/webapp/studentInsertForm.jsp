<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>STUDENT FORM</title>
<style>
    form{
         border: thick double #32a1ce;
         width: 300px;
         margin-top: 20px;
         padding: 10px;
        }
    nav{
    	margin-top: 50px;
    	}
    h1{
        margin-top: 10px;
        padding: 10px;
       }
</style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<center>
<h1>Insert Form</h1>
</center>

<center>
	<form action="./studentDetails.jsp" method="post">
	<table>
	<tr>
	<td>Name : </td>
	<td> <input type="text" name="name"> </td>
	</tr>
	<tr>
	<td>Email : </td>
	<td> <input type="text" name="email"> </td>
	</tr>
	<tr>
	<td>Contact : </td>
	<td> <input type="text" name="contact"> </td>
	</tr>
	<tr>
	<td>City : </td>
	<td> <input type="text" name="city"> </td>
	</tr>
	<tr><td><input type="submit" value="Insert"></td></tr>
	</table>
	</form>   
</center>
</body>
</html>