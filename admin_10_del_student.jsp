<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin View Customer</title>
</head>
<body>

<% Connection con=DBConnection.connect(); 

try{
	

   PreparedStatement pst=con.prepareStatement("select* from student");

	ResultSet rs=pst.executeQuery();


%>
<table border="2">
<tr>
	<th>ID</th>
	<th>mentor_ID</th>
	<th>name</th>
	<th>age</th>
	<th>education</th>
	<th>interest</th>
	<th>Email</th>
	<th>Password</th>
	<th>Status</th>
	<th>Delete</th>
	
	
</tr>

<% 
int rowCount = 0;
while(rs.next()){ 
rowCount++;%>
<tr>

		<td><%= rs.getInt(1) %></td>
	<td><%= rs.getInt(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5) %></td>
	<td><%= rs.getString(6) %></td>
	<td><%= rs.getString(7) %></td>
	<td><%= rs.getString(8) %></td>
	<td><%= rs.getString(9) %></td>
	
	<td><a href="admin_11_del_stud.jsp?id=<%= rs.getInt(1) %>">Delete</a></td>
	
	
</tr>
<%}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>

</body>
</html>