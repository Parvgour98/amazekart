<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>

</head>
<body>
		<div class="container-fluid">
			<%
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				List<Product> products = null;	
				Product prod1 = null;
				try{
					String prod = request.getParameter("product");
					if(prod==null)
					{
						response.sendRedirect("index.jsp");
						return;
					}
					else if(prod.equals("all"))
					{
						response.sendRedirect("index.jsp");
						return;
					}
					else{
						int pId = Integer.parseInt(prod);
						List<Product> product = productDao.getProductById(pId);
						prod1 = product.get(0);
					}
				}
				catch(Exception e)
				{
			%>
				<h2 class="text-center">Sorry! No products found at this time</h2>
				
			<%
				response.sendRedirect("index.jsp");
				return;
				} 
			%>
				
			<div class="card my-5">
				
				<div class="container text-center">
					<img style="width:170px;" src="img/products/<%=prod1.getpPhoto()%>" class="card-img-top m-2" alt="Couldn't load Image">
				</div>
									
				<div class="card-title text-center">
					<h3><%=prod1.getpName()%></h3>
				</div>
				
				<h3 class="text-center">Product Description:-</h3>
				
				<div class="card-body text-center">
					<p><b><%=prod1.getpDesc()%></b></p>
				</div>
				
				<h4 style="color:green;" class="text-center">Only <%=prod1.getpQuantity()%> left in stock.</h4>
				
				<div class="card-footer text-center py-2">
														
					<button class="btn custom-bg text-white" onclick="addToCart(<%=prod1.getpId()%>,'<%=prod1.getpName()%>',<%=prod1.calculatePriceAfterDiscount()%>,<%=prod1.getpQuantity()%>)">Add to cart</button>
				
					<button class="mx-3 btn btn-outline-primary">&#8377; <%=prod1.calculatePriceAfterDiscount()%>/-<span class="text-secondary discount-label">&#8377;<del><%=prod1.getpPrice() %></del> <%=prod1.getpDiscount()%>% off</span></button>
					
					<button class="btn btn-warning" onclick="addToCart(<%=prod1.getpId()%>,'<%=prod1.getpName()%>',<%=prod1.calculatePriceAfterDiscount()%>,<%=prod1.getpQuantity()%>)"><a href="checkout.jsp">Buy Now</a></button>
								
				</div>
			</div>
		</div>
	<%@include file="components/common_modals.jsp"%>
	<%@include file="footer.jsp"%>
</body>
</html>