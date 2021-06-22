package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Fetching data from UI...
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		// Validations goes here...
		
		if(email.length()==0 || password.length()==0)
		{
			session.setAttribute("message","None of the field can be left empty...");
			response.sendRedirect("login.jsp");
			return;
		}
		else if(email.length()>150)
		{
			session.setAttribute("message","Email is too long");
			response.sendRedirect("login.jsp");
			return;
		}
		else if(password.length()>200)
		{
			session.setAttribute("message","Password is too long");
			response.sendRedirect("login.jsp");
			return;
		}
		else
		{
			
			try
			{
				// Authenticating user...
			
				UserDao userDao = new UserDao(FactoryProvider.getFactory());
				
				User user = userDao.getUserByEmailAndPassword(email, password);
				
				if(user==null)
				{
					session.setAttribute("message", "Invalid Credentials! Please try again...");
					response.sendRedirect("login.jsp");
					return; 
				}
				else {
					session.setAttribute("current-user", user);
					if(user.getUserType().equals("admin"))
					{
						response.sendRedirect("admin.jsp");
					}
					else if(user.getUserType().equals("normal"))
					{
						response.sendRedirect("normal.jsp");
					}
					else {
						session.setAttribute("message","Sorry, unable to recognize you");
					}
				}
			}
			catch(Exception e)
			{
				session.setAttribute("message","Some error occured, Please try again...");
				response.sendRedirect("login.jsp");
				return;
			}
		}
		
	}
}
