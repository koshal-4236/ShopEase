package com.shop.dao;



import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.shop.model.User;
import com.shop.util.HibernateUtil;

public class UserDAO {
	public boolean registerUser(User user) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();
            session.save(user);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            return false;
        }
    }
	
	public User loginUser(String email,String password)
	{
		try(Session session=HibernateUtil.getSessionFactory().openSession()){
			Query<User> query=session.createQuery("from User where email=:email and password=:password",User.class);
			query.setParameter("email",email);
			query.setParameter("password", password);
			return query.uniqueResult();
		}
	}
	
	public boolean isEmailRegistered(String email) {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        Long count = (Long) session.createQuery("select count(*) from User u where u.email = :email")
	                .setParameter("email", email)
	                .uniqueResult();
	        return count != null && count > 0;
	    }
	}

}
