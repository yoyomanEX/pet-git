package com.web.dao.impl._07;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._07.CompanyProductBean;

@Repository(value = "CompanyProductDaoImpl")
public class CompanyProductDaoImpl implements CompanyProductDao {
	// 建立連線
	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public CompanyProductDaoImpl() {

	}

	@Override
	public void addProduct(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		session.save(p1);

	}

	@Override
	public void updateProduct(CompanyProductBean p1, Integer s1) {
		Session session = factory.getCurrentSession();
		CompanyProductBean result = session.get(CompanyProductBean.class, s1);
		if (result != null) {
			result.setCompany_id(p1.getCompany_id());
			result.setProduct_id(p1.getProduct_id());
			result.setProduct_name(p1.getProduct_name());
			result.setPrice(p1.getPrice());
			result.setCategory(p1.getCategory());
			result.setAmount(p1.getAmount());
			result.setDescribe(p1.getDescribe());
		}
	}

	@Override
	public void deleteProduct(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		session.delete(p1);
	}

	@Override
	public void querybyProductId(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session
				.createQuery("from CompanyProductBean where product_id=" + p1.getProduct_id()+"and company_id="+p1.getCompany_id());
		ArrayList<CompanyProductBean> list = (ArrayList<CompanyProductBean>) query.list();
		for (CompanyProductBean b1 : list) {
			p1.setCompany_id(b1.getCompany_id());
			p1.setProduct_id(b1.getProduct_id());
			p1.setProduct_name(b1.getProduct_name());
			p1.setPrice(b1.getPrice());
			p1.setAmount(b1.getAmount());
			p1.setDescribe(b1.getDescribe());
			p1.setCategory(b1.getCategory());
		}
	}

	@Override
	public ArrayList<CompanyProductBean> fuzzyQueryByProductId(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery
		("from CompanyProductBean where product_id like '%" + p1.getProduct_id() + "%' order by product_id ASC");
		return (ArrayList<CompanyProductBean>) query.list();
	}

	@Override
	public ArrayList<CompanyProductBean> fuzzyQueryByProductName(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery
		("from CompanyProductBean where product_name like '%" + p1.getProduct_name() + "%' order by product_id ASC");
		return (ArrayList<CompanyProductBean>) query.list();
	}
	

	@Override
	public ArrayList<CompanyProductBean> queryAllProduct(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from CompanyProductBean where status=1 and company_id="+p1.getCompany_id()+"order by product_id ASC");
		return (ArrayList<CompanyProductBean>) query.list();
	}
	//下架商品列表
	@Override
	public ArrayList<CompanyProductBean> nonSaleProduct(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		Query query = session.createQuery("from CompanyProductBean where status=2 and company_id="+p1.getCompany_id()+" order by product_id ASC");
		return (ArrayList<CompanyProductBean>) query.list();
		
	}
	//更改商品狀態→上架
	@Override
	public void onSaleByProductId(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		String hql = "update CompanyProductBean p set p.status=1 WHERE p.product_id ="+p1.getProduct_id()+"and p.company_id="+p1.getCompany_id();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		
	}
	//更改商品狀態→下架
	@Override
	public void nonSaleByProductId(CompanyProductBean p1) {
		Session session = factory.getCurrentSession();
		String hql = "update CompanyProductBean p set p.status=2 WHERE p.product_id ="+p1.getProduct_id()+"and p.company_id="+p1.getCompany_id();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		
	}

}
