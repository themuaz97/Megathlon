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

import com.Megathlon.Model.SupplierDB;
import com.Megathlon.Beans.Suppliers;
import com.Megathlon.Model.myDatabase;

/**
 * Servlet implementation class Register
 */
public class Supplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Supplier() {
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
		String query = "select * from supplier";
		ArrayList<Suppliers> suppliers = new ArrayList<Suppliers>();
		
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
					Suppliers supplier = new Suppliers();
					supplier.setSupplierName(rs.getString("supplierName"));
					supplier.setSupplierEmail(rs.getString("supplierEmail"));
					supplier.setSupplierContact(rs.getString("supplierContact"));
					supplier.setSupplierLocation(rs.getString("supplierLocation"));
					suppliers.add(supplier);
				}
				request.setAttribute("suppliers", suppliers);
				//request.getRequestDispatcher("jsp/homepage.jsp").forward(request, response);
				response.sendRedirect("jsp/homepage.jsp");
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
		String name = request.getParameter("supplierName");
		String email = request.getParameter("supplierEmail");
		String contact = request.getParameter("supplierContact");
		String location = request.getParameter("supplierLocation");
		
		Suppliers rb = new Suppliers();
		
		rb.setSupplierName(name);
		rb.setSupplierEmail(email);
		rb.setSupplierContact(contact);
		rb.setSupplierLocation(location);
		
		SupplierDB ud = new SupplierDB();
		String s1 = ud.insertSupplier(rb);
		
		System.out.println(s1);
		// out.println(name);
		// out.println(email);
		// out.println(password);
		request.setAttribute("name", name);
		//request.getRequestDispatcher("jsp/homepage.jsp").forward(request, response);;
		response.sendRedirect("/Megathlon/SupplierList");
	}

}
