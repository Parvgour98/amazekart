package com.servlets;

import java.io.IOException;
import java.util.Random;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.VerifyOTP;
import com.helper.FactoryProvider;
import com.services.MailService;

public class VerifyEmailServlet extends HttpServlet {
	
	FactoryProvider factory;
	
	private static final long serialVersionUID = 1L;
	
	public VerifyEmailServlet(FactoryProvider factory)
	{
		this.factory = factory;
	}
       
    public VerifyEmailServlet() {
       
    }

    public String getRandomNumberString() {
        // It will generate 6 digit random Number.
        // from 0 to 999999
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        // this will convert any number sequence into 6 character.
        return String.format("%06d", number);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		if(email.length()==0)
		{
			session.setAttribute("message","Email is empty");
			response.sendRedirect("verify_email.jsp");
			return;
		}
		else if(email.length()>100)
		{
			session.setAttribute("message","Email is too long");
			response.sendRedirect("verify_email.jsp");
			return;
		}
		else{
			try{
				String otp = getRandomNumberString();
				MailService mailService = new MailService();
				mailService.sendMail(email,otp);
				VerifyOTP verifyOTP = new VerifyOTP(email,otp);				Session s = FactoryProvider.factory.openSession();
				Transaction tx = s.beginTransaction();
				s.save(verifyOTP);
				tx.commit();
				session.setAttribute("message","OTP sent successfully");
				response.sendRedirect("verify_otp.jsp");
				s.close();
				
			} catch (Exception e) {
				out.println(e);
				// e.printStackTrace();
				session.setAttribute("message","Sorry, some error occurred. Please try again...");
				response.sendRedirect("verify_email.jsp");
				return;
			}
		}
		
	}

}