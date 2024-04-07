<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Delete Customer</title>
</head>
<body>
<% int id=Integer.parseInt(request.getParameter("id"));

try{
	Connection con=DBConnection.connect();
	PreparedStatement pst=con.prepareStatement("delete from student where id=?");
	pst.setInt(1,id);
	int i=pst.executeUpdate();
	if (i>0)
	{
		System.out.println("deleted row count "+i);
		response.sendRedirect("admin_2_Dashboard.html");
	}
	else
	{
		System.out.println("deleted roow count "+i);
	}
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html> 