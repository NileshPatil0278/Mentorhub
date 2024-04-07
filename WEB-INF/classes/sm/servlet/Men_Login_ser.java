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

/**
 * Servlet implementation class Men_Login_ser
 */
public class Men_Login_ser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Men_Login_ser() {
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
			pst = con.prepareStatement("SELECT* FROM mentors WHERE men_email=?");
		
			pst.setString(1,email);
		
		ResultSet rs=pst.executeQuery();
		int i=0;
	//	int Serviceid=0;
		while(rs.next())
		{
			i=1;
			int men_id=rs.getInt(1);
	    	GetSettter.setMen_id(men_id);
			System.out.println("Valid user");
			// Serviceid=rs.getInt(1);
			// GetterSetterValues.setServiceId(Serviceid);
		}
		if(i>0)
		{
			response.sendRedirect("men_3_dashboard.html");
		}
		else
		{
			response.sendRedirect("men_1_login.html");
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
