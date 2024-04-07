<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="sm.servlet.GetSettter" %>
    
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Assign Mentors</title>
<style>
        table{
            background-color: lightblue;
            margin-top: 100px;
            margin-right:20px;
            margin-left:auto;
        }
        th{
            background-color: rgb(62, 169, 204);
        }
        
    </style>
</head>
<body>


<% Connection con=DBConnection.connect(); 
int id=GetSettter.getId();


try{
	

   PreparedStatement pst=con.prepareStatement("select* from student WHERE id=? and Status=?");
   pst.setInt(1,id);
   pst.setString(2,"Assigned");
	ResultSet rs=pst.executeQuery();


%>
<table border="2">
<tr>
	
	
	<th>ID</th>
	<th>mentor_ID</th>
	<th>name</th>
	
	<th>education</th>
	<th>interest</th>
	<th>Email</th>
	
	<th>Status</th>
	

	
</tr>
<% while(rs.next()){ %>
<tr>

	<td><%= rs.getInt(1) %></td>
	<td><%= rs.getInt(2) %></td>
	
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5) %></td>
	<td><%= rs.getString(6) %></td>
	<td><%= rs.getString(7) %></td>
	


	
	
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