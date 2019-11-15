package com.web.dao.impl._08.index;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.model._08.index.MarkBean;
@Repository
public class MarkDAOImpl implements MarkDAO {
	
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public List<MarkBean> qryAllMark() {
		Session session = factory.getCurrentSession();
		String hql = "FROM mark";
		List<MarkBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public MarkBean qryMarkById(Integer markId) {
		Session session = factory.getCurrentSession();
		MarkBean mark = session.get(MarkBean.class, markId);
		return mark;
	}

	@Override
	public void insertMark(MarkBean markBean) {
		Session session = factory.getCurrentSession();
		session.save(markBean);

	}

	@Override
	public void updateMark(MarkBean markBean) {
		Session session = factory.getCurrentSession();
		session.update(markBean);

	}

	@Override
	public void deleteMark(Integer markId) {
		Session session = factory.getCurrentSession();
		MarkBean mark = new MarkBean();
		mark.setMark_id(markId);
		session.delete(mark);


	}

}
