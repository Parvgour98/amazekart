package com.dao;

import java.util.List;

import javax.faces.flow.ReturnNode;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Category category) throws Exception
	{
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			int catId = (int) session.save(category);
			tx.commit();
			session.close();
			return catId;
		}
		catch(Exception e)
		{
			throw new Exception();
		}

	}
	
	public List<Category> getCategories()
	{
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Category"); // Here Category is a class name
		List<Category> list = query.list();
		return list;
		 
	}
	
	public Category getCategoryById(int cId) throws Exception
	{
		Category category = null;

		try {
			Session session = this.factory.openSession();
			category = session.get(Category.class,cId);
			session.close();
		}
		catch(Exception e) {
			throw new Exception();
		}
		return category;
	}
	
	
}
