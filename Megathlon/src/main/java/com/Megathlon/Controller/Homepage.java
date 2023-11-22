package com.Megathlon.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Homepage
 */
public class Homepage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homepage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Step 1: Outline HTML
				response.setContentType("text/html;charset=UTF-8");
				try (PrintWriter out = response.getWriter()) {
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>Servlet StudentServlet</title>");
					out.println("</head>");
					out.println("<body>");
					
					int productRow = 0;
					int brandRow = 0;
					int supplierRow = 0;
					int highestProduct =0;
					int defectProduct =0;
					int lowProduct =0;
					int stockIn =0;
					int stockOut =0;
					String highestProductName = null;
					
					
					
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Megathlon", "root",
								"Penangfreeschool1!");
						
						
						// RETRIEVING PRODUCT ROW
						String query = "SELECT * FROM product where status = 0";
						PreparedStatement ps= con.prepareStatement(query);
						ResultSet rs= ps.executeQuery();
						
						while(rs.next()) {
							productRow++;
						}
						
						
						//RETRIEVING BRAND ROW
						 query = "SELECT * FROM brand";
						 ps= con.prepareStatement(query);
						 rs= ps.executeQuery();
						
						while(rs.next()) {
							brandRow++;
						}
						
						
						//RETRIEVING SUPPLIER ROW
						query = "SELECT * FROM supplier where status = 0";
						ps= con.prepareStatement(query);
						rs= ps.executeQuery();
						
						while(rs.next()) {
							supplierRow++;
						}
						
						
						//RETRIEVING PRODUCT HIGHEST COUNT
						query = "SELECT * FROM product "
								+"WHERE status = 0 "
								+"ORDER BY quantity DESC "
								+ "LIMIT 1";
						
						ps= con.prepareStatement(query);
						rs= ps.executeQuery();
						
						while(rs.next()) {
							highestProduct = rs.getInt("quantity");
							highestProductName = rs.getString("productName");
						}
						
						
						//RETRIEVING DEFECT PRODUCT
						query = "SELECT SUM(quantityChange) AS defected_quantity "
								+ "FROM stock "
								+ "WHERE stockStatus = 3";
						ps= con.prepareStatement(query);
						rs= ps.executeQuery();
						
						while(rs.next()) {
							defectProduct = rs.getInt("defected_quantity");
						}
						
						
						//RETRIEVING LOW PRODUCT
						query = "SELECT * FROM product "
								+ "WHERE quantity < 10";
						ps= con.prepareStatement(query);
						rs= ps.executeQuery();
						
						while(rs.next()) {
							lowProduct++;
						}
						
						
						//RETRIEVING STOCK IN
						query = "SELECT * FROM stock "
								+ "WHERE stockStatus = 1";
						ps= con.prepareStatement(query);
						rs= ps.executeQuery();
						
						while(rs.next()) {
							stockIn++;
						}
						
						
						//RETRIEVING STOCK OUT
						query = "SELECT * FROM stock "
								+ "WHERE stockStatus = 2";
						ps= con.prepareStatement(query);
						rs= ps.executeQuery();
						
						while(rs.next()) {
							stockOut++;
						}
						
					}catch (Exception e) {
						e.printStackTrace();
					}
					
					// Step 6: Set all used attributes
					request.setAttribute("productRow", productRow);
					request.setAttribute("brandRow", brandRow);
					request.setAttribute("supplierRow", supplierRow);
					request.setAttribute("highestProduct", highestProduct);
					request.setAttribute("defectProduct", defectProduct);
					request.setAttribute("highestProductName", highestProductName);
					request.setAttribute("lowProduct", lowProduct);
					request.setAttribute("stockIn", stockIn);
					request.setAttribute("stockOut", stockOut);

					// Step 7: Forward all attributes to the next page
					RequestDispatcher rd = request.getRequestDispatcher("jsp/Homepage.jsp");
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
