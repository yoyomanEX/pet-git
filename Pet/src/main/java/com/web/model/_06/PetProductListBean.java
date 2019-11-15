package com.web.model._06;

import java.io.Serializable;

public class PetProductListBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int product_id;
	private String product_name;
	private int price;
	private int cost_price;
	private int amount;
	private int images;
	private int filename;
	private int company_id;
	private String describe;
	private int status;
	private int category;
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCost_price() {
		return cost_price;
	}
	public void setCost_price(int cost_price) {
		this.cost_price = cost_price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getImages() {
		return images;
	}
	public void setImages(int images) {
		this.images = images;
	}
	public int getFilename() {
		return filename;
	}
	public void setFilename(int filename) {
		this.filename = filename;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "PetProductListBean [product_id=" + product_id + ", product_name=" + product_name + ", price=" + price + ", cost_price=" + cost_price + ", amount=" + amount + ", images=" + images
			+ ", filename=" + filename + ", company_id=" + company_id + ", describe=" + describe + ", status=" + status + ", category=" + category + "]";
	}

	
}
