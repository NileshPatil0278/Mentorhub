<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Mentor</title>
</head>
<body>

<% Connection con=DBConnection.connect(); 

try{
	

   PreparedStatement pst=con.prepareStatement("select* from mentors");

	ResultSet rs=pst.executeQuery();


%>
<table border="2">
<tr>
	<th>ID</th>
	<th>Name</th>
	<th>AreaOfExpert</th>
	<th>YearsOfExp</th>
	
	
	<th>Email</th>
	<th>Password</th>
	
	
	
</tr>

<% 
int rowCount = 0;
while(rs.next()){ 
rowCount++;%>
<tr>

	<td><%= rs.getInt(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5) %></td>
	<td><%= rs.getString(6) %></td>
	
	
	
	
</tr>
<%}
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</table>
<form action="men_2_register.html">
<button >Add Mentor</button>
</form>
</body>
</html>