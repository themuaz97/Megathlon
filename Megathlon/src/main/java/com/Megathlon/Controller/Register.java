package com.Megathlon.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Megathlon.Model.AccountDB;
import com.Megathlon.Beans.Account;
import com.Megathlon.Model.myDatabase;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.println("Welcome to first servlet");
		Connection con;
		Statement stmt;
		ResultSet rs;
		String query = "select * from account";
		ArrayList<Account> userlist = new ArrayList<Account>();
		
		myDatabase db = new myDatabase();
		try {
			con = db.getCon();
			if(con==null) {
				out.println("Failed with connection"+con);
			}else {
				out.println("Successful with connection" +con);
				stmt =con.createStatement();
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					Account user = new Account();
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setPassword(rs.getString("password"));
					user.setRole(rs.getString("adminpin"));
					userlist.add(user);
				}
				
				 request.setAttribute("UserData", userlist);
				 request.getRequestDispatcher("jsp/UserList.jsp").forward(request, response);
				 
			}
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("adminpin");
		if (role.isEmpty())
			role="11";
		System.out.println(role +" at register");
		Account rb = new Account();
		
		rb.setName(name);
		rb.setEmail(email);
		rb.setPassword(password);
		rb.setRole(role);
		
		AccountDB ud = new AccountDB();
		String s1 = ud.insertUser(rb);
		
		System.out.println(s1);
		// out.println(name);
		// out.println(email);
		// out.println(password);
		//request.setAttribute("name", name);
		//request.getRequestDispatcher("jsp/UserProfile.jsp").forward(request, response);;
		response.sendRedirect("jsp/Login.jsp");
	}

}
