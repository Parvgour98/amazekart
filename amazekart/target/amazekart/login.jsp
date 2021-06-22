<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-white">
						<h3>Login here</h3>
					</div>

					<div class="card-body">
						<%@include file="components/message.jsp"%>
						<form action="LoginServlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									name="email" id="exampleInputEmail1" required aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									name="password" id="exampleInputPassword1" required>
							</div>
							<a href="register.jsp" class="text-center d-block mb-3">If not registered click here</a>
							<div class="container text-center">
								<button type="submit" class="btn btn-outline-success">Submit</button>
								<button type="reset"  class= "btn btn-outline-warning">Reset</button>
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