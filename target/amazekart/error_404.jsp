<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>404 || Page not found!</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="container p-4 text-center">
		<img src="img/error_404.png" class="img-fluid" style="width:600px;"/>
		<h2 class="py-2 display-6">uhhh ohhh... Page not found!</h2>
		<a class="btn btn-warning my-4" href="index.jsp">Continue Shopping</a>
	</div>
		
<%@include file="components/common_modals.jsp"%>	
<%@include file="footer.jsp"%>
</body>
</html>