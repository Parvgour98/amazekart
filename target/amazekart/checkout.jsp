<% // script tag
	User user = (User)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in! Please, log in first to continue...");
		response.sendRedirect("login.jsp");
		return; // important statement
	}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>

</head>
<body>
	<div class="container-fluid my-5">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- Displaying the Card -->
				<div class="card">
					<h2 class="text-center my-4">Items in your cart</h2>
					<div class="card-body">
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			
			<div class="col-md-6">
			 	<!-- Displaying form details -->
				<div class="card">
					<h2 class="text-center my-4">Enter your details for order</h2>
					<form class="mb-5" action="#" method="post">
						<div class="form-group">
							<div class="mb-2 mx-4">
	    						<label for="email" class="form-label"> Email Address</label>
	    						<input value="<%=user.getUserEmail()%>" type="email" class="form-control" id="email" aria-describedby="email" required placeholder="Enter email address">
	  						</div>
  						</div>
  						<div class="form-group">
							<div class="mb-2 mx-4">
	    						<label for="name" class="form-label"> Enter Name</label>
	    						<input value="<%=user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="name" required placeholder="Enter your name">
	  						</div>
  						</div>
  						
  						<div class="form-group">
  							<div class="mb-2 mx-4">
								<label for="phone" class="form-label">Phone number (do not put 0 or country code)</label> 
								<input value="<%=user.getUserPhone()%>" class="form-control"
									name="phone" type="text" pattern="[789][0-9]{9}"
									placeholder="Enter your phone number" required>
							</div>
						</div>
  						
  						<div class="form-group mx-4">
  							<label class="mb-2" for="address">Your Shipping address</label>
  							<input type="text" value="<%=user.getUserAddress()%>" class="form-control" id="address" required placeholder="Enter your shipping address"> 						
  						</div>
  						
  						<div class="container text-center my-4">
  							<button class="btn btn-outline-success">Order Now</button>
  						</div>
					</form>
					
					 <button onclick="continueShopping()" class="btn btn-warning">Continue Shopping</button>
				</div>
			</div>
			
		</div>
	</div>
<%@include file="components/common_modals.jsp"%>
<%@include file="footer.jsp"%>
</body>	
</html>