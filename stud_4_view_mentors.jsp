<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="sm.servlet.GetSettter" %>
    
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Mentors</title>
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
	

	
</tr>
<% while(rs.next()){ %>
<tr>

	<td><%= rs.getInt(1) %></td>
	<td><%= rs.getString(2) %></td>
	
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5) %></td>
	


	
	
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