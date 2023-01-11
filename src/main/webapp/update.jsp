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
<jsp:include page="navbar.jsp" /> 
<center>
<h1>update data</h1>
</center> 


<center>
	<form action="updateResult.jsp" method="post">
	<table>
	<tr>
	<td>enter a name you want to update : </td>
	<td> <input type="text" name="name"> </td>
	</tr>
	<tr>
	<td>
	<select name="option" >
        <option value="name">name</option>
        <option value="email">email</option>
        <option value="contact">contact</option>
        <option value="city">city</option>
    </select>
    </td>
    <td> <input type="text" name="update"> </td>
    </tr>
	<tr><td><input type="submit" value="send"></td></tr>
	</table>
	</form>
</center>
</body>
</html>