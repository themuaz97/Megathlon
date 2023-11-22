package com.Megathlon.Beans;

public class Suppliers {
	private int supplierID;
	private int status;
	private String supplierName, supplierContact, supplierLocation, supplierEmail;
	
	
	public Suppliers() {}
	
	public Suppliers(int supplierID, String supplierName, String supplierEmail, String supplierContact, String supplierLocation) {
		this.supplierID = supplierID;
		this.supplierName = supplierName;
		this.supplierEmail = supplierEmail;
		this.supplierContact = supplierContact;
		this.supplierLocation = supplierLocation;
	}
	
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierContact() {
		return supplierContact;
	}
	public void setSupplierContact(String supplierContact) {
		this.supplierContact = supplierContact;
	}
	public String getSupplierLocation() {
		return supplierLocation;
	}
	public void setSupplierLocation(String supplierLocation) {
		this.supplierLocation = supplierLocation;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSupplierEmail() {
		return supplierEmail;
	}

	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
	}

}

