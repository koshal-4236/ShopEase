package com.shop.dao;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.model.Admin;
import com.shop.util.HibernateUtil;

public class AdminDAO {

	public Admin loginAdmin(String email, String password)
	{
		Transaction tx=null;
		Admin admin=null;
		
		try(Session session=HibernateUtil.getSessionFactory().openSession())
		{
			tx=session.beginTransaction();
			
			Query<Admin> query=session.createQuery("From Admin where mail=:email and password=:password",Admin.class);
			query.setParameter("email", email);
			query.setParameter("password", password);
			
			admin=query.uniqueResult();
			
			tx.commit();
		}
		catch(Exception e) {
			if(tx!=null) tx.rollback();
			
			e.printStackTrace();
		}
		
		return admin;
	}
}
