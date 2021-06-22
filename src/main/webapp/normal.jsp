<%@page import="com.entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");
	if(user==null) // user is not Admin and as well as registered user
	{
		session.setAttribute("message","You are not logged in! Please login first...");
		response.sendRedirect("login.jsp");
		return;
	}
	else
	{
		if(user.getUserType().equals("admin"))
		{
			session.setAttribute("message","Access Denied");
			response.sendRedirect("login.jsp");
			return;
		}
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
<% 
	response.sendRedirect("index.jsp");
%>

<%@include file="components/common_modals.jsp"%>
<%@include file="footer.jsp"%>
</body>
</html>