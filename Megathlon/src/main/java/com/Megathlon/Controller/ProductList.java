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

import com.Megathlon.Beans.Brand;
import com.Megathlon.Beans.Product;
import com.Megathlon.Beans.Suppliers;

/**
 * Servlet implementation class SupplierList
 */
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductList() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet untuk product list
		
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			ArrayList<Product> ProductList = new ArrayList<>();
			ArrayList<Brand> brandList = new ArrayList<>();
			ArrayList<Suppliers> supplierList = new ArrayList<>();


			try {
				
				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false", "root", "Penangfreeschool1!");
				
				// Run query
				String query = "SELECT * FROM product WHERE status = 0";
				PreparedStatement preparedStatement =  con.prepareStatement(query);
				ResultSet rs = preparedStatement.executeQuery();
				
				while(rs.next())
				{
					Product product = new Product();
					product.setProductID(rs.getInt("productId"));
					product.setProductName(rs.getString("productName"));
					product.setDescription(rs.getString("description"));
					product.setPrice(rs.getDouble("price"));
					product.setQuantity(rs.getInt("quantity"));
					product.setBrand(rs.getString("brand"));
					product.setSupplier(rs.getString("supplier"));
					product.setProductImage(rs.getString("productImage"));
					ProductList.add(product);
				}
				
				// RETRIEVE BRANDLIST
				query = "SELECT * FROM brand";
				preparedStatement = con.prepareStatement(query);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					
					int brandID = rs.getInt("brandId");
					String brandName = rs.getString("brandName");
					
					Brand b = new Brand (brandID, brandName);
					brandList.add(b);
				}
				
				// RETRIEVE SUPPLIERLIST
				query = "SELECT * FROM supplier";
				preparedStatement = con.prepareStatement(query);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					//add brand to supplierlist
					int supplierID = rs.getInt("supplierId");
					String supplierName = rs.getString("supplierName");
					String supplierContact = rs.getString("supplierContact");
					String supplierLocation = rs.getString("supplierLocation");
					String supplierEmail = rs.getString("supplierEmail");
					
					Suppliers c = new Suppliers (supplierID, supplierName,supplierEmail,supplierContact, supplierLocation);
					supplierList.add(c);
				}
				
				// Close connection
				con.close();
				preparedStatement.close();
				rs.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.setAttribute("ProductList", ProductList);
			request.setAttribute("BrandList", brandList);
			request.setAttribute("supplierList", supplierList);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/ProductsList.jsp");
			rd.forward(request, response);
			
			
			
			out.println("</body>");
			out.println("</html>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO doPost untuk Delete function
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
		
		int productID = 0;
		if (request.getParameter("productID")!= null)
			productID = Integer.parseInt(request.getParameter("productID"));
		

		try {
			
			// Connect to database
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false", "root", "Penangfreeschool1!");
			
			// Run query
			String query = "UPDATE " 
					+ "product " 
					+ "SET status = ? " 
					+ "WHERE productID = ?";

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1,1);
			preparedStatement.setInt(2, productID);
			
			preparedStatement.executeUpdate();
			con.close();
			preparedStatement.close();

			} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("/Megathlon/ProductList");
		
		// RequestDispatcher rd = request.getRequestDispatcher("/ProductList");
		//  rd.forward(request, response);
		 
		
		out.println("</body>");
		out.println("</html>");
	}
	}
}