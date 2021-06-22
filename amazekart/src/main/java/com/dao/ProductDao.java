package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Product;

public class ProductDao {
	
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) throws Exception
	{
		boolean flag = false;
		try {
			 // Saving the product to the database...
			
			 Session session = this.factory.openSession();
			 Transaction tx = session.beginTransaction();
			 session.save(product);
			 tx.commit();
			 session.close();
			 flag = true;
		}
		catch(Exception e)
		{
			throw new Exception();
		}
		return flag;
	}
	
	// Get all Products

	public List<Product> getAllProducts()
	{
		 Session openSession = this.factory.openSession();
		 Query createQuery = openSession.createQuery("from Product");
		 List<Product> products = createQuery.list();
		 return products;
		 
	}
	
	// Get all Products by Category Id
	
	public List<Product> getAllProductsById(int cId)
	{
		 Session openSession = this.factory.openSession();
		 Query createQuery = openSession.createQuery("from Product as p where p.category.categoryId =: id");
		 createQuery.setParameter("id",cId);
		 List<Product> products = createQuery.list();
		 return products;
		 
	}
	
	// Get a particular product by product Id:
	
	public List<Product> getProductById(int pId)
	{
		Session openSession = this.factory.openSession();
		Query createQuery = openSession.createQuery("from Product as p where p.pId=:id");
		createQuery.setParameter("id",pId);
		List<Product> product = createQuery.list();
		return product;
	}

}
