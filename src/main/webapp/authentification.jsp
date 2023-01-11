<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*" %>

    
   <% String user = request.getParameter("user");
   	String password = request.getParameter("password");
   %>
  
<%! Connection connection;
	Statement statement;
	ResultSet resultSet;
	ResultSet resultSet1;
	String query1;
	String query2;
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

	<%
	try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/wejm4?user=root&password=root");
	statement = connection.createStatement();
	
	query1 = "select * from login";
	
	resultSet = statement.executeQuery(query1);
	
	while (resultSet.next()) {
		String dbuser = resultSet.getString(1);
		String dbpass = resultSet.getString(2);
		if(user.equals(dbuser)){
			if(password.equals(dbpass) ){
				query2 = "select * from student";
				
				resultSet1 = statement.executeQuery(query2);
				out.println("<table>");
				while (resultSet1.next()) {
					out.println("<tr><td>" + resultSet1.getString(1) +"</td>" +
							"<td>"+ resultSet1.getString(2) +"</td>" +
							"<td>"+ resultSet1.getString(3) +"</td>" +
							"<td>"+ resultSet1.getString(4) +"</td></tr>");
					}
				out.println("</table>");
				}
			else{
				out.println("<h1> Wrong password please check</h1>");
				out.println("<center><a href='login.jsp'>Login</a></center>");
			}
			}
		else{
			out.println("<h1> Wrong username please check</h1>");
			out.println("<center><a href='login.jsp'>Login</a></center>");
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