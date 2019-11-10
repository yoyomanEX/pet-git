package com.web.model._07;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class CompanyProductBean {
	private Integer product_id;
	private String product_name;
	private Integer price;
	private Integer cost_price;
	private Integer amount;
	private Blob images;
	private String fileName;
	private String company_id;
	private String describe;
	private Integer status;
	private Integer category;

	public CompanyProductBean(Integer product_id, String product_name, Integer price, Integer cost_price, Integer amount,
			Blob images, String fileName, String company_id, String describe, Integer status, Integer category) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.cost_price = cost_price;
		this.amount = amount;
		this.images = images;
		this.fileName = fileName;
		this.company_id = company_id;
		this.describe = describe;
		this.status = status;
		this.category = category;
	}

	public CompanyProductBean() {
		super();
	}

	@Id
	@Column(name = "PRODUCT_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	@Column(name = "PRODUCT_NAME")
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	@Column(name = "PRICE")
	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	@Column(name = "COST_PRICE")
	public Integer getCost_price() {
		return cost_price;
	}

	public void setCost_price(Integer cost_price) {
		this.cost_price = cost_price;
	}

	@Column(name = "AMOUNT")
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	@Column(name = "IMAGES")
	public Blob getImages() {
		return images;
	}

	public void setImages(Blob images) {
		this.images = images;
	}

	@Column(name = "DESCRIBE")
	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Column(name = "FILENAME")
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Column(name = "COMPANY_ID")
	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	@Column(name = "STATUS")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "CATEGORY")
	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

}
