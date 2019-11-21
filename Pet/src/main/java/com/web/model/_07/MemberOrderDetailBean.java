package com.web.model._07;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "member_order_detail")
public class MemberOrderDetailBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private Long order_id;
	private Integer product_id;
	private String product_name;
	private Integer amount;
	private Integer total;
	private String company_id;
//	private MemberOrderBean orderBean;
	
	

	@Override
	public String toString() {
		return "MemberOrderDetailBean [order_id=" + order_id + ", product_id=" + product_id + ", product_name="
				+ product_name + ", amount=" + amount + ", total=" + total + ", company_id=" + company_id + "]";
	}
	public MemberOrderDetailBean() {
		super();
	}
	public MemberOrderDetailBean(Long order_id, Integer product_id, String product_name, Integer amount, Integer total,
			String company_id) {
		super();
		this.order_id = order_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.amount = amount;
		this.total = total;
		this.company_id = company_id;
	
	}
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "ORDER_ID")
	public Long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}
	@Column(name = "PRODUCT_ID")
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
	@Column(name = "AMOUNT")
	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	@Column(name = "TOTAL")
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	@Id
	@Column(name = "COMPANY_ID")
	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
//	@ManyToOne
//	@JoinColumn(name="order_id",nullable = false)
//	@Cascade(CascadeType.ALL)
//	public MemberOrderBean getOrderBean() {
//		return orderBean;
//	}
//	public void setOrderBean(MemberOrderBean orderBean) {
//		this.orderBean = orderBean;
//	}
//	

	
	
	
	
	
}
