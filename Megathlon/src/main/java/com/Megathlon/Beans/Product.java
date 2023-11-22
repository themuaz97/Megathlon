package com.Megathlon.Beans;

public class Product {

	private int ProductID;
	private String ProductName;
	private String Description;
	private double Price;
	private int Quantity;
	private String Brand;
	private int BrandID;
	private String Supplier;
	private String ProductImage;
	
	
	public Product () {}
	
	public Product(int productID, String productName, String description, double price, int quantity, String brand,
			String supplier, String productImage) {
		super();
		this.ProductID = productID;
		this.ProductName = productName;
		this.Description = description;
		this.Price = price;
		this.Quantity = quantity;
		this.Brand = brand;
		this.Supplier = supplier;
		this.ProductImage = productImage;
	}


	public int getProductID() {
		return ProductID;
	}



	public void setProductID(int productID) {
		ProductID = productID;
	}



	public String getProductName() {
		return ProductName;
	}



	public void setProductName(String productName) {
		ProductName = productName;
	}



	public String getDescription() {
		return Description;
	}



	public void setDescription(String description) {
		Description = description;
	}



	public double getPrice() {
		return Price;
	}



	public void setPrice(double price) {
		Price = price;
	}



	public int getQuantity() {
		return Quantity;
	}



	public void setQuantity(int quantity) {
		Quantity = quantity;
	}



	public String getBrand() {
		return Brand;
	}



	public void setBrand(String brand) {
		Brand = brand;
	}



	public String getSupplier() {
		return Supplier;
	}



	public void setSupplier(String supplier) {
		Supplier = supplier;
	}


	public String getProductImage() {
		return ProductImage;
	}



	public void setProductImage(String productImage) {
		ProductImage = productImage;
	}



	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	public int getBrandID() {
		return BrandID;
	}

	public void setBrandID(int brandID) {
		BrandID = brandID;
	}

}
