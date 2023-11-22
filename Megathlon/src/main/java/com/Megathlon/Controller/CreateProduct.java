package com.Megathlon.Controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Megathlon.Beans.Brand;
import com.Megathlon.Beans.Suppliers;
// import com.Megathlon.Model.ProductDB;
import com.Megathlon.Beans.Product;
// import com.Megathlon.Model.MyDatabase;

/**
 * Servlet implementation class Register
 */
public class CreateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// display add product form in CreateProduct.jsp
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
			
			// Declare new arraylist from com.Megathlon.Bean
			ArrayList<Product> ProductList = new ArrayList<>();
			ArrayList<Brand> BrandList = new ArrayList<>();
			ArrayList<Suppliers> supplierList = new ArrayList<>();
			try {

				// Connect to database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");

				// Run query from product table at MySQL
				String query = "SELECT * FROM product";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
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
				
				// Run query from brand table at MySQL
				query = "SELECT * FROM brand";
				preparedStatement = con.prepareStatement(query);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					Brand brand = new Brand();
					brand.setBrandId(rs.getInt("brandId"));
					brand.setBrandName(rs.getString("brandName"));
					BrandList.add(brand);
				}
				
				// Run query from supplier table where status column equal to 0
				query = "SELECT * FROM supplier WHERE status = '0'";
				preparedStatement = con.prepareStatement(query);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					 Suppliers supplier = new Suppliers();
					 supplier.setSupplierName(rs.getString("supplierName"));
					supplierList.add(supplier);
				}
				
				// Close connection
				con.close();
				preparedStatement.close();
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			
			
			String _productname = null;
			String _description = null;
			double _price = 0;
			int _quantity = 0;
			
			if (request.getParameter("pass") != null && request.getParameter("pass").equals("1")) {
				_productname = request.getParameter("pn");
				_price = Double.parseDouble(request.getParameter("pr"));
				_description =  request.getParameter("desc");
				_quantity = Integer.parseInt(request.getParameter("qty"));
			}
			request.setAttribute("productName", _productname);
			request.setAttribute("price", _price);
			request.setAttribute("description", _description);
			request.setAttribute("quantity", _quantity);
			
			request.setAttribute("ProductList", ProductList);
			request.setAttribute("BrandList", BrandList);
			request.setAttribute("SupplierList", supplierList);
			RequestDispatcher rd = request.getRequestDispatcher("jsp/CreateProduct.jsp");
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
		
		// doPost function untuk pergi bawak data ke ProductList selepas tekan button Add
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");
			//Assigning parameters from form into temporary variable
			String productName = request.getParameter("productName");
			String desc = request.getParameter("description");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			String brand = request.getParameter("brand");
			String supplier = request.getParameter("supplier");
			String productImage = request.getParameter("productImage");

			Product product = new Product();
			ArrayList<Product> ProductList = new ArrayList<>();
			//Assign the values of the object entity (Beans) extracted from the temporary variable
			product.setProductName(productName);
			product.setDescription(desc);
			product.setPrice(Double.parseDouble(price));
			product.setQuantity(Integer.parseInt(quantity));
			product.setBrand(brand);
			product.setSupplier(supplier);
			product.setProductImage(productImage);

			// MyDatabase db = new MyDatabase(); <- contoh kalau panggil database dari com.Megathlon.Model
			// Connection con = db.getCon();

			try {

				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");
				Statement stat = con.createStatement();
				
				stat.executeUpdate(
						"INSERT INTO product(productId, productName, description, price, quantity, brand, supplier, productImage) values('"
								+ product.getProductID() + "','" + product.getProductName() + "','" + product.getDescription() + "','"
								+ product.getPrice() + "','" + product.getQuantity() + "','" + product.getBrand() + "','"
								+ product.getSupplier() + "','" + product.getProductImage() + "' )");

				String query = "SELECT * FROM product";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					Product products = new Product();
					products.setProductID(rs.getInt("productId"));
					products.setProductName(rs.getString("productName"));
					products.setDescription(rs.getString("description"));
					products.setPrice(rs.getDouble("price"));
					products.setQuantity(rs.getInt("quantity"));
					products.setBrand(rs.getString("brand"));
					products.setSupplier(rs.getString("supplier"));
					products.setProductImage(rs.getString("productImage"));
					ProductList.add(products);
				}


			} catch (Exception ex) {
				ex.printStackTrace();
			}

			// RequestDispatcher rd = request.getRequestDispatcher("ProductsList.jsp");

			// The request will be forwarded to the resource
			// specified, here the resource is a JSP named,
			// "stdlist.jsp"
			// rd.forward(request, response);
			String _productname = null;
			String _description = null;
			double _price = 0;
			int _quantity = 0;
			
			request.setAttribute("productName", _productname);
			request.setAttribute("price", _price);
			request.setAttribute("description", _description);
			request.setAttribute("quantity", _quantity);
			
			request.setAttribute("ProductList", ProductList);
			response.sendRedirect("/Megathlon/ProductList");

			out.println("</body>");
			out.println("</html>");

		}

	}

}
