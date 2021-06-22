<%@page import="com.helper.Helper"%>
<%@page import="com.entities.Category"%>
<%@page import="com.dao.CategoryDao"%>
<%@page import="com.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="server_error.jsp"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Amazekart</title>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp"%>
</head>
<body>
	
	<div class="container-fluid" id="productStyle">
	
		<div class="row mt-4">
		
			<%
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());	
				List<Category> cList = categoryDao.getCategories();
				List<Product> products = null;
				try{
					String cat = request.getParameter("category");
					
					if(cat==null)
					{
						products = productDao.getAllProducts();
					}
					else if(cat.trim().equals("all"))
					{
						products = productDao.getAllProducts();
					}
					else
					{
						int cId = Integer.parseInt(cat.trim());
						products = productDao.getAllProductsById(cId);
					}
				}
				catch(Exception e){
			%>
				<h2 class="text-center">Sorry! No products found at this time</h2>
			<%
				response.sendRedirect("index.jsp");
				return;
				}
			%>
			<!-- Show Categories -->
			<div class="col-md-2 mx-4 my-5">
			
				<div class="list-group mt-2">
					  <h5>Sort By:-</h5>
					  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
	    			  All Products</a>
	 				
					<%
						for(Category c: cList)
						{
					%>
						<a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<% 
						}
					%>
					
				
				</div>
				
			</div>
			
			<!-- Show Products -->
			<div class="col-md-8 mx-5 my-3">
					
				<div class="row mt-4">
					
					<div class="col-md-12">
						
						<div class="card-columns">
							
							<%
								if(products.size()==0)
								{
							%>	
								
								<h2 class="text-center">Sorry! No products found at this time</h2>
							
							<%
								}else
								{
							%>
							
							<% 
							  // Traversing the products
							
									for(Product p:products)
									{
							%>
								
								<div class="card py-2 my-5 card-hover">
								
									<div class="container text-center">
									 	<img style="width:170px;" src="img/products/<%=p.getpPhoto()%>" class="card-img-top m-2" alt="Couldn't load Image">
									</div>
									
									<div class="card-columns">
										<div class="card-body">
											
											<h5 class="card-title text-center"><%=p.getpName()%></h5> 
											<p class="card-text text-center">
											<%=Helper.getTenWords(p.getpDesc())%>
									
										</div>
											
										<div class="card-footer text-center">
											
											<button class="btn custom-bg text-white" onclick="addToCart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.calculatePriceAfterDiscount()%>,<%=p.getpQuantity()%>)">Add to cart</button>
											
											<button class="mx-3 btn btn-outline-primary">&#8377; <%=p.calculatePriceAfterDiscount()%>/-<span class="text-secondary discount-label">&#8377;<del><%=p.getpPrice() %></del> <%=p.getpDiscount()%>% off</span></button>
											
											<button class="btn btn-warning"><a href="description.jsp?product=<%=p.getpId()%>">See More</a></button>
											
										</div>
									</div>
									 
								</div>
							
							<% 
									}
								}
							
							%>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
<%@include file="components/common_modals.jsp"%>	
<%@include file="footer.jsp"%>
</body>
</html>