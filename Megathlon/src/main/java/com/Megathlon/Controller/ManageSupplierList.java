package com.Megathlon.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Megathlon.Beans.Suppliers;

/**
 * Servlet implementation class ManageSupplierList
 */
public class ManageSupplierList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageSupplierList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Delete xoxo");
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			int supplierID = Integer.parseInt(request.getParameter("supplierID"));

			try {

				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");

				// Run query
				String query = "UPDATE " 
							+ "supplier " 
							+ "SET status = ? " 
							+ "WHERE supplierID = ?";

				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setInt(1, 1);
				preparedStatement.setInt(2, supplierID);

				preparedStatement.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}

			RequestDispatcher rd = request.getRequestDispatcher("/SupplierList");
			rd.forward(request, response);

			out.println("</body>");
			out.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			int supplierID = Integer.parseInt(request.getParameter("supplierID"));
			String name = request.getParameter("supplierName");
			String email = request.getParameter("supplierEmail");
			String contact = request.getParameter("supplierContact");
			String location = request.getParameter("supplierLocation");

			try {

				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");
	

				// Run query
				String query = "UPDATE " 
								+ "supplier " 
								+ "SET supplierName = ?, supplierEmail = ?, supplierContact = ?, supplierLocation = ? "
								+ "WHERE supplierID = ?";

				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, contact);
				preparedStatement.setString(4, location);
				preparedStatement.setInt(5, supplierID);

				preparedStatement.executeUpdate();

				} catch (Exception e) {
				e.printStackTrace();
			}

			RequestDispatcher rd = request.getRequestDispatcher("/SupplierList");
			rd.forward(request, response);

			out.println("</body>");
			out.println("</html>");
		}
	}
}
