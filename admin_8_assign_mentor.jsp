<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import="java.util.Random" %>
    
    
    
<%@ page import="java.sql.*" %>
<%@ page import="database_connection.DBConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Mentor</title>
</head>
<body>
<% int id=Integer.parseInt(request.getParameter("id"));
int men_id = Integer.parseInt(request.getParameter("men_id"));

Connection con=DBConnection.connect();
try{
	PreparedStatement pst=con.prepareStatement("select* from student where id=?");
	pst.setInt(1,id);
	ResultSet rs=pst.executeQuery();
	String ass="Assigned";
	int i=0;
	
	/*
	
//	Random random = new Random(); 
//	 int randomServiceCode = random.nextInt(255);

     // Insert the random service code into the database
     PreparedStatement pst2 = con.prepareStatement("UPDATE complaint SET Service_Code_Cust=? WHERE Comp_ID=?");
//     pst2.setInt(1, randomServiceCode);
 //    pst2.setInt(2, comp_ID);
     int b = pst2.executeUpdate();
     if (b > 0) {
         System.out.println("Service code updated successfully.");
     } else {
         System.out.println("Failed to update service code.");
     }
     
     
  */   
     
     
	while(rs.next())
	{
		PreparedStatement pst3=con.prepareStatement("UPDATE student SET men_id=?,Status=? where id=?");
		pst3.setInt(1,men_id);
		pst3.setString(2,ass);
		pst3.setInt(3,id);
		
		 
		
		
		i=pst3.executeUpdate();
	}
	
	if (i>0)
	{
		
		response.sendRedirect("admin_2_Dashboard.html");
	}
	else
	{
		System.out.println("Approved");
	}
}catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html> 