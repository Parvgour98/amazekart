<%
	HttpSession s = request.getSession();
	String msg = (String)s.getAttribute("message");
	if(msg==null)
	{
		session.setAttribute("message","First verify your email");
		response.sendRedirect("verify_email.jsp");
		return;
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Account</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<%@include file = "components/message.jsp"%>
						
						<h2 class="text-center my-3">Verify your OTP</h2>

						<form action="VerifyOTPServlet" method="post">

							<div class="mb-3">
								<label for="otp" class="form-label">Enter OTP</label> <input
									name="otp" type="text" class="form-control" id="otp"
									placeholder="Enter your OTP">
							</div>
							
							<div class="mb-3 text-center">
								<button class="btn btn-outline-success">Verify</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="components/common_modals.jsp"%>
<%@include file="footer.jsp"%>
</body>
</html>