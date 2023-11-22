package com.Megathlon.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Megathlon.Beans.Account;

/**
 * Servlet implementation class UserProfile
 */
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
				System.out.println("masuk doGet UserProfile");
				HttpSession session = request.getSession();
				Account user = new Account();
				String email = user.getEmail();
				String role = user.getRole();
				int staffId = user.getStaffId();
				System.out.println(role +" at user profile");
				
				//RequestDispatcher dispatcher = null;
				
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false", "root", "Penangfreeschool1!");
					PreparedStatement pst = con.prepareStatement("select * from account where acctEmail='" + email +"'");
					ResultSet rs = pst.executeQuery();
					if(rs.next()) {
						session.setAttribute("email", rs.getString("acctEmail"));
						session.setAttribute("name", rs.getString("acctName"));
						session.setAttribute("role", rs.getString("acctRole"));
						session.setAttribute("staffId", rs.getInt("acctID"));
						//System.out.println("Data inserted");
						RequestDispatcher rd = request.getRequestDispatcher("jsp/UserProfile.jsp");
						rd.forward(request, response);
						//response.sendRedirect("jsp/UserProfile.jsp");
					}else {
						session.setAttribute("status", "failed");
						
						
						response.sendRedirect("jsp/Login.jsp");
					}
					//dispatcher.forward(request, response);
				} catch(Exception ex){
					ex.printStackTrace();
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
