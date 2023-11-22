package com.Megathlon.Controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Megathlon.Beans.Product;
// import com.Megathlon.Model.ProductDB;
import com.Megathlon.Beans.Stock;
import com.Megathlon.Model.myDatabase;

/**
 * Servlet implementation class Register
 */
public class stockDB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public stockDB() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//method doGet guna untuk Dropdown List Product
		// Step 1: Outline HTML
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			ArrayList<Stock> stocklist = null;
			ArrayList<Product> productlist = null;

			try {
				// Step 2: Connect Database
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Megathlon", "root",
						"Penangfreeschool1!");

				// Step 3: Call or define variables
				stocklist = new ArrayList<Stock>();
				productlist = new ArrayList<Product>();

				/* QUERY 1: SELECT STOCK */

				// Step 4: Execute query
				String query = "SELECT * FROM stock";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				ResultSet resultSet = preparedStatement.executeQuery();

				// Step 5: Populate data
				while (resultSet.next()) {

					int stockID = resultSet.getInt("stockID");
					int quantity = resultSet.getInt("quantity");
					int quantityChange = resultSet.getInt("quantityChange");
					double price = resultSet.getDouble("price");
					String stockStatus = resultSet.getString("stockStatus");
					String product = resultSet.getString("product");
					String supplier = resultSet.getString("supplier");
					String date = resultSet.getString("stockDate");

					Stock stock = new Stock(stockID, quantity, quantityChange, price, stockStatus, product, supplier, date);
					stocklist.add(stock);

				}

				/* QUERY 2: SELECT PRODUCT */

				String query2 = "SELECT * FROM product";
				PreparedStatement preparedStatement2 = con.prepareStatement(query2);
				ResultSet resultSet2 = preparedStatement2.executeQuery();

				// retrieve data
				while (resultSet2.next()) {

					int productID = resultSet2.getInt("productID");
					String productName = resultSet2.getString("productName");
					String description = resultSet2.getString("description");
					double price = resultSet2.getDouble("price");
					int quantity = resultSet2.getInt("quantity");
					String brand = resultSet2.getString("brand");
					String supplier = resultSet2.getString("supplier");
					String productImage = resultSet2.getString("productImage");

					
					Product product = new Product (productID, productName, description, price, quantity, brand, supplier, productImage);
					productlist.add(product);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

			// Step 6: Set all used attributes
			request.setAttribute("stocklist", stocklist);
			request.setAttribute("productlist", productlist);

			// Step 7: Forward all attributes to the next page
			RequestDispatcher rd = request.getRequestDispatcher("jsp/test-sales.jsp");
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
		
		//doPost untuk keyin Stock
		//step1 template outline HTML
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet StudentServlet</title>");
			out.println("</head>");
			out.println("<body>");

			//create ArrayList based on object nak pakai
			ArrayList<Stock> stock = new ArrayList<>();
			
			// set variables from form
			String date = request.getParameter("date");
			String stockStatus = request.getParameter("stockStatus");
			String product = request.getParameter("product");
			String supplier = request.getParameter("supplier");
			double price = Double.parseDouble(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			int quantityChange = Integer.parseInt(request.getParameter("quantityChange"));
			
			int newQuantity = 0;
			// Calculate the new quantity by adding quantityChange
			if (Integer.parseInt(stockStatus) == 1) 
				newQuantity = quantity + quantityChange;
			// Calculate the new quantity by subtracting quantityChange
			else if (Integer.parseInt(stockStatus) == 2) 
			    newQuantity = quantity - quantityChange;
			//no change
			else 
				newQuantity = quantity - 0;

			try {

				// Connect DB
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/Megathlon?allowPublicKeyRetrieval=true&useSSL=false", "root",
						"Penangfreeschool1!");

				// SQL query to retrieve stock data from
				String query = "INSERT INTO stock (stockDate, stockStatus, product, supplier, price, quantity, quantityChange)"
						+ " VALUES (?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				
				preparedStatement.setString(1, date);
				preparedStatement.setString(2, stockStatus);
				preparedStatement.setString(3, product);
				preparedStatement.setString(4, supplier);
				preparedStatement.setDouble(5, price);
				preparedStatement.setInt(6, newQuantity);
				preparedStatement.setInt(7, quantityChange);
				
				preparedStatement.executeUpdate();

								
	
			    // Update the database with the new quantity
			    String updateQuery = "UPDATE product SET quantity = ? WHERE productName = ?";
			    PreparedStatement updateStatement = con.prepareStatement(updateQuery);

			    updateStatement.setInt(1, newQuantity);
			    updateStatement.setString(2, product);
			    
			    updateStatement.executeUpdate();

		
				// Close resources
				con.close();
				preparedStatement.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			response.sendRedirect("/Megathlon/stockDB");
			out.println("</body>");
			out.println("</html>");
		}
	}

}
