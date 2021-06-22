<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Server Error!</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	<div class="container p-4 text-center">
		<img src="img/server-error.png" class="img-fluid" style="width:450px;"/>
		<h2 class="py-2 display-6">Sorry! Something went wrong...</h2>
		<a class="btn btn-warning my-2" href="index.jsp">Continue Shopping</a>
	</div>
		
<%@include file="components/common_modals.jsp"%>	
<%@include file="footer.jsp"%>
</body>
</html>