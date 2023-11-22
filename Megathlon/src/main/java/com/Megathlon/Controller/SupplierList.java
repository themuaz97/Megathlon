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
 * Servlet implementation class SupplierList
 */
public class SupplierList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupplierList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			ArrayList<Suppliers> supplierlist = new ArrayList<>();

			try {
				
				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false", "root", "Penangfreeschool1!");
				
				// Run query
				String query = "SELECT * FROM supplier WHERE status = '0'";
				PreparedStatement preparedStatement =  con.prepareStatement(query);
				ResultSet resultSet = preparedStatement.executeQuery();
				
				while (resultSet.next()) {
					
					int id = resultSet.getInt("supplierID");
					String name = resultSet.getString("supplierName");
					String email = resultSet.getString("supplierEmail");
					String contact = resultSet.getString("supplierContact");
					String location = resultSet.getString("supplierLocation");
					
					Suppliers supplier = new Suppliers (id, name, email, contact, location);
					
					supplierlist.add(supplier);
				}
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("supplierlist", supplierlist);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/ListSupplier.jsp");
			rd.forward(request, response);
			
			
			
			out.println("</body>");
			out.println("</html>");
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
