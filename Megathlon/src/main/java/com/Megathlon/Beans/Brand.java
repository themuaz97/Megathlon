package com.Megathlon.Beans;

public class Brand {
	private int BrandId;
	private String BrandName;
	public int getBrandId() {
		return BrandId;
	}
	public void setBrandId(int brandId) {
		BrandId = brandId;
	}
	public String getBrandName() {
		return BrandName;
	}
	public void setBrandName(String brandName) {
		BrandName = brandName;
	}
	public Brand() {
	} 
	public Brand(int brandId, String brandName) {
		super();
		this.BrandId = brandId;
		this.BrandName = brandName;
	} 
}
