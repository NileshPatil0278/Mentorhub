 package sm.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database_connection.DBConnection;
//import isp.servlet.GetSet;

/**
 * Servlet implementation class stud_Login_ser
 */
public class stud_Login_ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public stud_Login_ser() {
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
		
		String email=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println("username "+email+" passwoord "+password);
		
		Connection con=DBConnection.connect();
		try {
			PreparedStatement pst;
			pst = con.prepareStatement("SELECT* FROM student WHERE email=?");
		
			pst.setString(1,email);
		
		ResultSet rs=pst.executeQuery();
		int i=0;
	//	int Serviceid=0;
		while(rs.next())
		{
			i=1;
			int id=rs.getInt(1);
			GetSettter.setId(id);
			System.out.println("Valid user");
			// Serviceid=rs.getInt(1);
			// GetterSetterValues.setServiceId(Serviceid);
		}
		if(i>0)
		{
			response.sendRedirect("stud_3_dashboard.html");
		}
		else
		{
			response.sendRedirect("stud_1_Login.html");
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
