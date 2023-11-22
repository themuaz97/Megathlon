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
 * Servlet implementation class ProductEdit
 */
public class ProductEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductEdit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO doGet untuk selected edit product
		response.setContentType("text/html;charset=UTF-8");
		
		
		
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			ArrayList<Brand> brandList = new ArrayList<>();
			ArrayList<Suppliers> supplierList = new ArrayList<>();
			String _brand = request.getParameter("brandName");
			String _supplier = request.getParameter("supplierName");
			Product product = new Product();

			try {
				int productID = Integer.parseInt(request.getParameter("productID"));
				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");

				
				// RETRIEVE PRODUCTLIST
				String query = "SELECT * FROM product WHERE status = 0 AND productID = " + productID;
				PreparedStatement preparedStatement = con.prepareStatement(query);
				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					
					int id = rs.getInt("productId");
					String productName = rs.getString("productName");
					String description = rs.getString("description");
					Double price = rs.getDouble("price");
					int quantity = rs.getInt("quantity");
					String brand = rs.getString("brand");
					String supplier = rs.getString("supplier");
					String productImage = rs.getString("productImage");
					
					product = new Product (id, productName, description, price, quantity, brand,
							supplier, productImage);
					
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
				query = "SELECT * FROM supplier WHERE status = 0";
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

			request.setAttribute("brand", _brand);
			request.setAttribute("supplier", _supplier);
			request.setAttribute("product", product);
			request.setAttribute("SupplierList", supplierList);
			request.setAttribute("BrandList", brandList);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/ProductEdit.jsp");
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
		// doPost untuk Update Product
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			ArrayList<Product> ProductList = new ArrayList<>();
			

			int productID = Integer.parseInt(request.getParameter("productID"));
			
			String productName = request.getParameter("productName").trim();
			String desc = request.getParameter("description").trim();
			double price = Double.parseDouble(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String brand = request.getParameter("brand").trim();
			String supplier = request.getParameter("supplier").trim();
			String productImage = request.getParameter("productImage");



			try {

				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");

				// Run query
				String query = "UPDATE " + "product "
						+ "SET productName = ?, description = ?, price = ?, quantity = ?, brand = ?, supplier = ? "
						+ "WHERE productID = ?";
				
				
				
				

				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setString(1, productName);
				preparedStatement.setString(2, desc);
				preparedStatement.setDouble(3, price);
				preparedStatement.setInt(4, quantity);
				preparedStatement.setString(5, brand);
				preparedStatement.setString(6, supplier);
				preparedStatement.setInt(7, productID);
				preparedStatement.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("ProductList", ProductList);
			response.sendRedirect("/Megathlon/ProductList");

			out.println("</body>");
			out.println("</html>");
		}
	}

}
