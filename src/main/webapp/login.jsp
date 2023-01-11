<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<center>
<h1>Login</h1>
	<form action="authentification.jsp" method="post">
	<table>
	<tr>
	<td>Username : </td>
	<td> <input type="text" name="user"> </td>
	</tr>
	<tr>
	<td>Password : </td>
	<td> <input type="text" name="password"> </td>
	</tr>
	<tr><td><input type="submit" value="singIn"></td></tr>
	</table>
	</form>
</center>
</body>
</html>