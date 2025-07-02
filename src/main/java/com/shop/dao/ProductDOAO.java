package com.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.shop.model.Product;
import com.shop.util.HibernateUtil;

public class ProductDOAO {

	 public boolean Addproduct(Product product) {
	        Transaction tx = null;
	        Session session = null;

	        try {
	            session = HibernateUtil.getSessionFactory().openSession();
	            tx = session.beginTransaction();

	            System.out.println("Saving product: " + product);
	            session.save(product);

	            tx.commit();
	            return true;
	        } catch (Exception e) {
	            if (tx != null && tx.getStatus().canRollback()) {
	                try {
	                    tx.rollback();
	                } catch (Exception ex) {
	                    System.out.println("Rollback failed: " + ex.getMessage());
	                }
	            }
	            e.printStackTrace();
	            return false;
	        } finally {
	            if (session != null) {
	                session.close(); // safely closes session
	            }
	        }
	    }

	
	public List<Product> getAllProducts(){
		try(Session session=HibernateUtil.getSessionFactory().openSession())
		{
			return session.createQuery("from Product",Product.class).list();
		}
	}
	
	public long getTotalProductCount() {
		try(Session session=HibernateUtil.getSessionFactory().openSession())
		{
			return (Long) session.createQuery("select count(p.id) from Product p").uniqueResult();
		}
	}
	
	public List<Product> getPaginatedProducts(int offset,int pageSize)
	{
		try(Session session=HibernateUtil.getSessionFactory().openSession())
		{
			return session.createQuery("from Product",Product.class)
					.setFirstResult(offset)
					.setMaxResults(pageSize)
					.list();
		}
	}
	
	public void updateProduct(Product product)
	{
		 Transaction tx = null;
		    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
		        tx = session.beginTransaction();

		        session.update(product); // ✅ Make sure this is the actual Product object

		        tx.commit();
		    } catch (Exception e) {
		        if (tx != null) {
		            tx.rollback();
		        }
		        e.printStackTrace();
		    }
	}
	
	public Product getProductBYId(int id)
	{
		try(Session session=HibernateUtil.getSessionFactory().openSession())
		{
			return session.get(Product.class, id);
		}
	}
	
	public void deleteProduct(int id) {
	    Transaction tx = null;
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        tx = session.beginTransaction();
	        Product product = session.get(Product.class, id);
	        if (product != null) {
	            session.delete(product);
	        }
	        tx.commit();
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        e.printStackTrace();
	    }
	}

}
