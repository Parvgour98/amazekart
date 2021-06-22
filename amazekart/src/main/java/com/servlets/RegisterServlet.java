package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;


public class RegisterServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public RegisterServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			String userName = request.getParameter("name");
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");
			String userPhone = request.getParameter("phone");
			String userAddress = request.getParameter("address");
			
			// Server side validations
			
			HttpSession session = request.getSession();
			
			if(userName.length()==0 || userEmail.length()==0 || userPassword.length()==0 || userPhone.length()==0 || userAddress.length()==0)
			{
				session.setAttribute("message","None of the field can be left empty...");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(userDao.isUserExist(userEmail))
			{
				session.setAttribute("message","Account already exist, Please Login");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(userDao.isPhoneNumberExist(userPhone))
			{
				session.setAttribute("message","Phone number already exist");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(userEmail.length()>100)
			{
				session.setAttribute("message","Email too long...");
				response.sendRedirect("register.jsp");
			}
			else if(userName.length()>50)
			{
				session.setAttribute("message","User Name too long!");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(!UserDao.validateEmail(userEmail))
			{
				session.setAttribute("message","Invalid Email Id, Please enter correct email Id");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(userPassword.length()<8)
			{
				session.setAttribute("message","Password length should be minimum 8 characters");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(!(userPhone.length()==10))
			{
				session.setAttribute("message","Invalid Phone number, phone number length should be 10");
				response.sendRedirect("register.jsp");
				return;
			}
			else if(userAddress.length()>200)
			{
				session.setAttribute("message","Address too long!");
				response.sendRedirect("register.jsp");
				return;
			}
			else{
				
				
				User user = new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");
				
				Session hibernateSession = FactoryProvider.getFactory().openSession();
				Transaction tx = hibernateSession.beginTransaction();
				hibernateSession.save(user);
				tx.commit();
				hibernateSession.close();
							
				session.setAttribute("message","Hurray! Registered Successfully");
				response.sendRedirect("login.jsp");
				return;
			}
					
		} 
		catch (Exception e) {
			HttpSession session = request.getSession();			
			session.setAttribute("message","Some error occured, Please try again...");
			response.sendRedirect("register.jsp");
			return;
		}
	}

}
