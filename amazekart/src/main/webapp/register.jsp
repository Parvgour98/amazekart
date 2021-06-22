<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
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
						<div class="container text-center">
								<img class="img-fluid mx-auto" width="130px"
								alt="Sorry, unable to fetch Image..." src="img/boy.png">
						</div>
						
						<h2 class="text-center my-3">Sign up here</h2>

						<form action="RegisterServlet" method="post">

							<div class="mb-3">
								<label for="name" class="form-label">Name</label> 
								<input
									name="name" type="text" class="form-control" id="name"
									placeholder="Enter your name" required>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									name="email" type="email" class="form-control" id="email"
									placeholder="Enter your email" required>
							</div>

							<div class="mb-3">
								<label for="password" class="form-label">Password</label> 
								<input
									name="password" type="password" class="form-control" id="password"
									placeholder="Enter your password" minlength="8" required>
							</div>

							<div class="mb-3">
								<label for="phone" class="form-label">Phone number (do
									not put 0 or country code)</label> <input class="form-control"
									name="phone" type="text" pattern="[789][0-9]{9}"
									placeholder="Enter your phone number" required>
							</div>

							<div class="mb-3">
								<label for="address" class="form-label">Address</label>
								<textarea style="height: 100px;"  id="address"
									name="address" class="form-control" placeholder="Enter your address" required></textarea>
							</div>

							<div class="mb-3 text-center">
								<button class="btn btn-outline-success">Register</button>
							</div>

							<div class="mb-3 text-center">
								<button class="btn btn-outline-warning">Reset</button>
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