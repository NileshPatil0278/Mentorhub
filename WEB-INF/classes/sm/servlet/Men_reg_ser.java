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
 * Servlet implementation class Men_reg_ser
 */
public class Men_reg_ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Men_reg_ser() {
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
		//		String s=request.getParameter("men_id");
		//		System.out.println("s="+s);
		//		int men_id=Integer.parseInt(s);
				
				
				
			    String name = request.getParameter("name");
			   System.out.println("name"+name);
			    String AreaOfExpert = request.getParameter("AreaOfExpert");
			    String YearsOfExp = request.getParameter("YearsOfExp");
			    String email = request.getParameter("email");
			    String password = request.getParameter("password");
		
			    
			    Connection con=DBConnection.connect();
			    try {
			        PreparedStatement pt;
			        pt = con.prepareStatement("insert into mentors values(?,?,?,?,?,?)");
			        pt.setInt(1, 0);
			        pt.setString(2, name);
			        pt.setString(3, AreaOfExpert);
			        pt.setString(4, YearsOfExp);
			 
			        pt.setString(5, email);
			        pt.setString(6, password);
			      
			       
			       
			        int i = pt.executeUpdate();
			        System.out.println("rows are " + i);
			        if (i > 0) {
			            response.sendRedirect("men_3_dashboard.html");
			        } else {
			            response.sendRedirect("men_2_register.html");
			        }
			    } catch (SQLException e) {
			        // TODO Auto-generated catch block
			        e.printStackTrace();
			    }
		
		doGet(request, response);
	}

}
