package com.Megathlon.Model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Megathlon.Beans.Account;
public class AccountDB {
	String s1 = null;

	public String insertUser(Account rb) {
		myDatabase db = new myDatabase();
		Connection con = db.getCon();
		try {
			Statement stat = con.createStatement();
			
			stat.executeUpdate("insert into account(acctName,acctEmail,acctPass,acctRole) values('" + rb.getName() + "','" + rb.getEmail()
					+ "','" + rb.getPassword()+ "','" + rb.getRole() + "')");
			s1 = "Data Insert Successfully";
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return s1;
	}
	
	public String readData(Account user) {
		myDatabase db = new myDatabase();
		Connection con = db.getCon();
		ResultSet rs = null;
		try {
			Statement stat = con.createStatement();
			rs = stat.executeQuery("select acctEmail,acctPass from account where acctEmail='" + user.getEmail()
					+ "' and acctPassw='" + user.getPassword() + "'");
			rs.next();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return "Success";
	}

	public static Account userLogin(String email, String password) {
		myDatabase db = new myDatabase();
		Connection con = db.getCon();
		Account user = null;
		try {
			PreparedStatement stmt = (PreparedStatement) con.prepareStatement(
					"Select * from account where acctEmail='" + email + "' and acctPass = '" + password + "'");
//	      stmt.setString(1,login);
//	      stmt.setString(2,password);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				user = new Account();
				// System.out.println(user);
				user.setEmail(rs.getString("acctEmail"));
				user.setPassword(rs.getString("acctPass"));
				user.setName(rs.getString("acctName"));
				user.setRole(rs.getString("acctRole"));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}
}
