package com.dao;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;
import com.entities.VerifyOTP;
import com.sun.mail.iap.Response;

public class OTPDao {
	private SessionFactory factory;
	
	public OTPDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public VerifyOTP verifyOtp(String otp) throws Exception
	{
		VerifyOTP verifyOTP  = null;
		try {
			// HQL Query
			String query = "from VerifyOTP where otp =: o";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("o",otp);
			verifyOTP = (VerifyOTP)q.uniqueResult();
			session.close();
			
		} 
		catch (Exception e) {
			throw new Exception();
		}
		
		return verifyOTP;
	
		
	}
}