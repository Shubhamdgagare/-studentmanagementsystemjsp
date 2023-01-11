<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>

    
   <% String option = request.getParameter("option");
   String value = request.getParameter("value");
   %>
  
<%! Connection connection;
	Statement statement;
	ResultSet resultSet;
	%>

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
    table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 10px;
        }
</style>
</head>
<body>
<jsp:include page="navbar.jsp" />  

<center>
<h1>Home</h1>
</center>
<center>
<div>
    <table>
	<%
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/wejm4?user=root&password=root");
	statement = connection.createStatement();
	resultSet = statement.executeQuery("SELECT * FROM student WHERE " + option +" = '" + value + "'");
	
	while (resultSet.next()) {
		out.println("<tr><td>" + resultSet.getString(1) +"</td>" +
				"<td>"+ resultSet.getString(2) +"</td>" +
				"<td>"+ resultSet.getString(3) +"</td>" +
				"<td>"+ resultSet.getString(4) +"</td></tr>");
	}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	%>

    </table>
</div>
</center>
</body>
</html>