package com.Megathlon.Beans;

public class Stock {

	private int stockID, quantity, quantityChange;
	private double price;
	private String stockStatus, product, supplier, date;
	
	public Stock() {
	}
	
	public Stock(int stockID, int quantity, int quantityChange, double price, String stockStatus, String product,
			String supplier, String date) {
		this.stockID = stockID;
		this.quantity = quantity;
		this.quantityChange = quantityChange;
		this.price = price;
		this.stockStatus = stockStatus;
		this.product = product;
		this.supplier = supplier;
		this.date = date;
	}

	public int getStockID() {
		return stockID;
	}

	public void setStockID(int stockID) {
		this.stockID = stockID;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getquantityChange() {
		return quantityChange;
	}

	public void setquantityChange(int quantityChange) {
		this.quantityChange = quantityChange;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getStockStatus() {
		return stockStatus;
	}

	public void setStockStatus(String stockStatus) {
		this.stockStatus = stockStatus;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
}
