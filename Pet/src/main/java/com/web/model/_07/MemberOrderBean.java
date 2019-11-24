package com.web.model._07;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "member_order")
public class MemberOrderBean implements Serializable {



	@Override
	public String toString() {
		return "MemberOrderBean [order_id=" + order_id + ", member_id=" + member_id + ", total=" + total + ", address="
				+ address + ", recipient=" + recipient + ", phone=" + phone + ", order_date=" + order_date
				+ ", ship_date=" + ship_date + ", company_id=" + company_id + ", status=" + status + "]";
	}

	private static final long serialVersionUID = 1L;
	private Long order_id;
	private String member_id;
	private Integer total;
	private String address;
	private String recipient;
	private String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date order_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date ship_date;
	private String company_id;
	private int status;
	
	
//	private List<MemberOrderDetailBean> orderDetailBean;

	
	
	public MemberOrderBean() {
		super();
	}

	public MemberOrderBean(Long order_id, String member_id, Integer total, String address, String recipient,
			String phone, Date order_date, Date ship_date, String company_id, int status) {
		super();
		this.order_id = order_id;
		this.member_id = member_id;
		this.total = total;
		this.address = address;
		this.recipient = recipient;
		this.phone = phone;
		this.order_date = order_date;
		this.ship_date = ship_date;
		this.company_id = company_id;
		this.status = status;
		
	}

	@Id
	@Column(name="ORDER_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}
	@Column(name="MEMBER_ID")
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Column(name="TOTAL")
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name="RECIPIENT")
	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	@Column(name="PHONE")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Column(name="ORDER_DATE")
	
	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	@Column(name="SHIP_DATE")
	public Date getShip_date() {
		return ship_date;
	}

	public void setShip_date(Date ship_date) {
		this.ship_date = ship_date;
	}
	@Column(name="COMPANY_ID")
	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	@Column(name="STATUS")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
//	@OneToMany()
//	@JoinColumn(name="order_id")
//	public List<MemberOrderDetailBean> getOrderDetailBean() {
//		return orderDetailBean;
//	}
//
//	public void setOrderDetailBean(List<MemberOrderDetailBean> orderDetailBean) {
//		this.orderDetailBean = orderDetailBean;
//	}


}
