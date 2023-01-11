<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>

    
   <% String name1 = request.getParameter("name");
   	String option = request.getParameter("option");
   	String update = request.getParameter("update");
   %>
  
<%! Connection connection;
	Statement statement;
	ResultSet resultSet;
	ResultSet resultSet1;
	String query1;
	String query2;
	PreparedStatement preparedStatement;
	int result;

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
<h1>Updated Data</h1>
</center>
<center>
<div>

	<%
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/wejm4?user=root&password=root");
	statement = connection.createStatement();
	
	query1 = "select * from student";
	
	resultSet = statement.executeQuery(query1);
	
	while (resultSet.next()) {
		String dbuser = resultSet.getString(1);
		if(name1.equals(dbuser)){
			statement = connection.createStatement();
			
			result = statement.executeUpdate("UPDATE Student SET " + option + " = '" + update + "' WHERE name = '" + name1 + "';");
			out.println( "<h3>" + name1 + " data updated on '" + option + "' parameter and '" + update + "' value </h3>");
			out.println( "<h1>" + result + " row(s) affected </h1>");
			
			query2 = "select * from student";
			
			resultSet = statement.executeQuery(query2);
			out.println("<table>");
			while (resultSet.next()) {
				out.println("<tr><td>" + resultSet.getString(1) +"</td>" +
						"<td>"+ resultSet.getString(2) +"</td>" +
						"<td>"+ resultSet.getString(3) +"</td>" +
						"<td>"+ resultSet.getString(4) +"</td></tr>");
				}
			out.println("</table>");
			}
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
</div>
</center>
</body>
</html>