<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Mentor</title>
</head>
<body>


<% Connection con=DBConnection.connect(); 

try{
	

   PreparedStatement pst=con.prepareStatement("select* from student where Status=?");
   pst.setString(1,"Unassigned");
	ResultSet rs=pst.executeQuery();


%>
<table border="2">
<tr>
	<th>id</th>
	<th>men_id</th>
	<th>Name</th>
	<th>age</th>
	<th>education</th>
	<th>interest</th>
	<th>email</th>
	<th>Password</th>
	<th>Status</th>

	
</tr>
<% while(rs.next()){ %>
<tr>

	<td><%= rs.getInt(1) %></td>
	<td>
	 <form action="admin_8_assign_mentor.jsp" method="post">
                <select name="men_id">
                    <!-- Fixed options: 1, 2, 3 -->
                  
                    <option value="201">201</option>
                    <option value="202">202</option>
                </select>
                <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
                <input type="submit" value="Assign">
            </form>
	
	</td>
	<td>
	<%= rs.getString(3) %>
   
</td>
	<td><%= rs.getString(4) %></td>
	<td><%= rs.getString(5) %></td>
	<td><%= rs.getString(6) %></td>
	<td><%= rs.getString(7) %></td>
	<td><%= rs.getString(8) %></td>
	<td><%= rs.getString(9) %></td>

	


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