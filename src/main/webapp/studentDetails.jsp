<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*,java.util.*" %>

    
   <% String name = request.getParameter("name");
   String email = request.getParameter("email");
   String contact = request.getParameter("contact");
   String city = request.getParameter("city");
   %>
  
<%! Connection connection;
	PreparedStatement preparedStatement;
	int result;
	Statement statement;
	ResultSet resultSet;
	String query;
	%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
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
<h1>Inserted Data</h1>
	<%
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/wejm4?user=root&password=root");
	preparedStatement = connection.prepareStatement("insert into student values (?,?,?,?)");
	preparedStatement.setString(1, name);
	preparedStatement.setString(2, email);
	preparedStatement.setString(3, contact);
	preparedStatement.setString(4, city);
	result = preparedStatement.executeUpdate();
	out.println("<table><tr><td>" + name +"</td>" +
			"<td>"+ email +"</td>" +
			"<td>"+ contact +"</td>" +
			"<td>"+ city +"</td></tr></table>");
	out.println( "<h1>" + result + " row(s) affected </h1>");
	%>

	<div>
    <table>
	<%

	statement = connection.createStatement();
	
	query = "select * from student";
	
	resultSet = statement.executeQuery(query);
	
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