package com.servlets;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.OTPDao;
import com.entities.VerifyOTP;
import com.helper.FactoryProvider;

public class VerifyOTPServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public VerifyOTPServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String otp = request.getParameter("otp");
		HttpSession session = request.getSession();
		
		if(otp.length()==0)
		{
			session.setAttribute("message","OTP is empty");
			response.sendRedirect("verify_otp.jsp");
			return;
		}
		else if(otp.length()>6)
		{
			session.setAttribute("message","Please, enter correct OTP");
			response.sendRedirect("verify_otp.jsp");
			return;
		}
		else{ 
			try
			{
				OTPDao otpDao = new OTPDao(FactoryProvider.getFactory());
				VerifyOTP verifyOTP = otpDao.verifyOtp(otp);
				if(verifyOTP==null)
				{
					session.setAttribute("message","Please, enter correct OTP");
					response.sendRedirect("verify_otp.jsp");
					return;
				}
				else{
					session.setAttribute("message","Thanks, your email is verified! Sign up now");
					response.sendRedirect("register.jsp");
					return;
				}
				
			}
			catch(Exception e)
			{
				// e.printStackTrace();
				session.setAttribute("message","Some error occured, Please try again...");
				response.sendRedirect("verify_otp.jsp");
				return;
			}
		}
	}
}
