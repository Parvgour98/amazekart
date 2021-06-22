package com.dao;

import org.hibernate.query.Query;

import java.util.List;

import javax.faces.component.html.HtmlInputHidden;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public static boolean validateEmail(String email)
	{
		String regex = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$";
	    boolean result = email.matches(regex);
	    if(result)	return true;
	    return false;
	}
	
	public boolean isUserExist(String email)
	{
		String userQuery = "from User where userEmail =:e";
		Session s  = this.factory.openSession();
		Query query = s.createQuery(userQuery);
		query.setParameter("e",email);
		User u = (User)query.uniqueResult();
		s.close();
		if(u == null)
		{
			return false;
		}
		return true;
	}
	
	public boolean isPhoneNumberExist(String phoneNumber)
	{
		String phoneQuery = "from User where user_phone =:phone";
		Session s1  = this.factory.openSession();
		Query query1 = s1.createQuery(phoneQuery);
		query1.setParameter("phone",phoneNumber);
		User u1 = (User)query1.uniqueResult();
		s1.close();
		if(u1 == null)
		{
			return false;
		}
		return true;
	}
	
	// get user by email and password
	
	public User getUserByEmailAndPassword(String email, String password) throws Exception
	{
		User user = null;
		
		try {
			// HQL Query
			String query = "from User where userEmail =: e and userPassword =: p";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p",password);
			user = (User)q.uniqueResult();
			
			session.close();
			
		} catch (Exception e) {
			throw new Exception();
		}
		
		return user;
	}
	
	public List<User> getAllUsers()
	{
		Session session = this.factory.openSession();
		String query = "from User";
		Query  createQuery =  session.createQuery(query);
		List<User> users = createQuery.list();
		return users;
	}
	
}
