package sm.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.DBConnection;

/**
 * Servlet implementation class stud_reg_ser
 */
public class stud_reg_ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stud_reg_ser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Hello Janavi");
	//		String s=request.getParameter("id");
		//	System.out.println("s="+s);
	//		int id=Integer.parseInt(s);
			
			String p=request.getParameter("age");
			System.out.println("p="+p);
			int age=Integer.parseInt(p);
			
		    String name = request.getParameter("name");
		   System.out.println("name"+name);
		    String education = request.getParameter("edu");
		    String interest = request.getParameter("interest");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
	
		    
		    Connection con=DBConnection.connect();
		    try {
		        PreparedStatement pt;
		        pt = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?)");
		        pt.setInt(1, 0);
		        pt.setInt(2, 0);
		        pt.setString(3, name);
		        pt.setInt(4, age);
		        pt.setString(5, education);
		        pt.setString(6, interest);
		        pt.setString(7, email);
		        pt.setString(8, password);
		        pt.setString(9, "Unassigned");
		      
		       
		       
		        int i = pt.executeUpdate();
		        System.out.println("rows are " + i);
		        if (i > 0) {
		            response.sendRedirect("stud_3_dashboard.html");
		        } else {
		            response.sendRedirect("stud_2_register.html");
		        }
		    } catch (SQLException e) {
		        // TODO Auto-generated catch block
		        e.printStackTrace();
		    }
		
		doGet(request, response);
	}

}
