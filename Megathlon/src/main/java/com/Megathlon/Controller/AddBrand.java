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
import javax.servlet.http.HttpSession;

import com.Megathlon.Beans.Brand;
import com.Megathlon.Beans.Product;

/**
 * Servlet implementation class AddBrand
 */
public class AddBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBrand() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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

			ArrayList<Brand> BrandList = new ArrayList<>();
			String productName = request.getParameter("productName");
			String description = request.getParameter("description");
			double price = Double.parseDouble(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			System.out.println ("Data: " + productName + description + price + quantity);
			
			
			try {
				
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megathlon?useSSL=false",
						"root", "Penangfreeschool1!");
				
				Statement stat = con.createStatement();
				
				String BrandNew = request.getParameter("BrandNew").trim();
				
				stat.executeUpdate("INSERT INTO brand(brandName) values('" + BrandNew + "' )");
				System.out.println("hi");
				
				String query = "SELECT * FROM brand";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					Brand brand = new Brand();
					brand.setBrandId(rs.getInt("brandId"));
					brand.setBrandName(rs.getString("brandName"));
					BrandList.add(brand);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
			
			request.setAttribute("BrandList", BrandList);
			String redirectURL = "/Megathlon/CreateProduct?pass=1&pn=" + productName + "&pr=" + price + "&desc=" + description + "&qty=" + quantity;
			
			response.sendRedirect(redirectURL);
			out.println("</body>");
			out.println("</html>");

		}
	}

}
