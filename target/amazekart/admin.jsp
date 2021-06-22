<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.Product"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.CategoryDao"%>
<%@page errorPage="server_error.jsp"%>
<%@page import="com.entities.User"%>
<%
	User user = (User)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in! Please, log in first.");
		response.sendRedirect("login.jsp");
		return; // important statement
	}
	else{
		if(user.getUserType().equals("normal"))
		{
			session.setAttribute("message","Access Denied");
			response.sendRedirect("login.jsp");
			return;
		}
	}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
	<%@include file="components/common_css_js.jsp"%>
	<%@include file="components/navbar.jsp"%>
	
</head>
<body> 
	<div class="container">
		<h2 class="text-center mt-4">Admin Panel</h2>
	</div>
	<div class="container" id="adminStyle">
		
		<div class="container-fluid mt-4">
			<%@include file="components/message.jsp"%>
		</div>
		<div class="row mt-5">
			<!-- First column -->
			<div class="col-md-4">
				
				<div class="card" data-bs-toggle="tooltip" data-bs-placement="top" title="Number of users are:-">
					
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width:80px" class="img-fluid" src="img/team.png" alt="users.png">
						</div>
						<% 
							UserDao userDao = new UserDao(FactoryProvider.getFactory());
							List<User> usersList = userDao.getAllUsers();
						%>
						<h4><%=usersList.size()%></h4>
						<h2 class="text-muted">Users</h2>
						
					</div>
					
				</div>
				
			</div>
			
			<!-- Second column -->
			<div class="col-md-4">
				
				<div class="card" data-bs-toggle="tooltip" data-bs-placement="top" title="Number of categories are:-">
					
					<div class="card-body text-center">
						
						<img style="max-width:80px" class="img-fluid" src="img/box.png" alt="box.png">
						
						<%
							CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
							List<Category> categoryList = categoryDao.getCategories();
						%>
						<h4><%=categoryList.size()%></h4>
						<h2 class="text-muted">Categories</h2>
						
					</div>
					
				</div>
			
			</div>
			
			<!-- Third column -->
			<div class="col-md-4">
				<div class="card" data-bs-toggle="tooltip" data-bs-placement="top" title="Number of products are:-">
					
					<div class="card-body text-center">
						
						<img style="max-width:80px" class="img-fluid" src="img/shopping-cart.png" alt="user.png">
						<%
							ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
							List<Product> productList = productDao.getAllProducts();
						%>
						<h4><%=productList.size()%></h4>
						<h2 class="text-muted">Products</h2>
						
					</div>
					
				</div>	
				
			</div>
			
		</div>
		
		<!-- Second Row -->
		
		<div class="row mt-5">
		
			<!-- Second row - First column -->
			<div class="col-md-6">
				
				<div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
					
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width:80px" class="img-fluid" src="img/delivery-box.png" alt="users.png">
						</div>
						
						<h2 class="text-muted">Add Category</h2>
						
					</div>
					
				</div>
				
			</div>
			
			<!-- Second row - Second column -->
			
			<div class="col-md-6">
				
				<div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
					
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width:80px" class="img-fluid" src="img/package.png" alt="users.png">
						</div>
						
						<h2 class="text-muted">Add Product</h2>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	
		<!-- Add Category Modal -->
		<!-- Button trigger modal -->
		
		<!-- Modal -->
		<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header custom-bg text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
		        	<!-- Creating Form -->
		        	<form action="ProductOperationServlet" method="post">
		        	
		        		<input type="hidden" name="operation" value="addCategory">
		        		
		        		<label for="catTitle">Enter title</label>
		        		<div class="form-group py-1">
		        			<input type="text" class="form-control" id="catTitle" name="catTitle" placeholder="Enter Category Title" required/>
		        		</div>
		        		
		        		<label for="catDesc">Enter Description</label>
		        		<div class="form-group py-1">
							<textarea style="height:150px;" class="form-control" placeholder="Enter Category Description" required id="catDesc" name="catDesc"></textarea>
		        		</div>
		        		
		        		<div class="container text-center py-3">
		        		<button class="btn btn-outline-success">Add Category</button>
		        		</div>
		        	</form>
		        
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Product Modal -->
				
		<!-- Modal -->
		<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
		        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
		        		
		        	<input type="hidden" value="addProduct" name="operation"/>
		        		
		        	<div class="form-group py-1">
		        		<label for="pName">Product Name</label>
		        		<input id="pName" type="text" class="form-control" placeholder="Enter Product Name" required name="pName"/>
		        	</div>
		        	
		        	<div class="form-group py-1">
		        		<label for="pDesc">Product Description</label>
		        		<textarea style="height:100px" class="form-control" id="pDesc" name="pDesc" placeholder="Enter Product Description" required></textarea>
		        	</div>
		        	
		        	<div class="form-group py-1">
		        		<label for="pPrice">Product Price</label>
		        		<input id="pPrice" type="number" class="form-control" placeholder="Enter Product Price" required name="pPrice"/>
		        	</div>
		        	
		        	<div class="form-group py-1">
		        		<label for="pDiscount">Product Discount</label>
		        		<input id="pDiscount" type="number" class="form-control" placeholder="Enter Product Discount" required name="pDiscount"/>
		        	</div>
		        	
		        	<div class="form-group py-1">
		        		<label for="pQuantity">Product Quantity</label>
		        		<input id="pQuantity" type="number" class="form-control" placeholder="Enter Product Quantity" required name="pQuantity"/>
		        	</div>
		        	
		        	<% 
		        		CategoryDao catDao = new CategoryDao(FactoryProvider.getFactory());
		        		List<Category> list = catDao.getCategories();
		        	%>
		        	
		        	<div class="form-group py-1">
		        		<label for="pCategory">Product Category</label>
		        		<select name="catId" id="pCategory" class="form-control" required>
							
							<% 
								for(Category category: list)
								{
							%>
								<option value="<%=category.getCategoryId()%>"><%=category.getCategoryTitle()%></option>	
								
							<% 
								}
							%>		
		        		</select>
		        	</div>
		        	
		        	<div class="form-group py-1">
		        		<label for="pPic">Choose Product Image</label>
		        		<input type="file" name="pPic" id="pPic" required/>
		        	</div>
		        	
		        	<div class="container text-center py-3">
		        		<button class="btn btn-outline-success">Add Product</button>
		      		</div>
		      
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
		      		</div>
		      
		        </form> 
		       
		      </div>
		     
		    </div>
		  </div> 
		</div>
<%@include file="components/common_modals.jsp"%>
<script>
	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
	var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
	  return new bootstrap.Tooltip(tooltipTriggerEl)
	})
</script>
<%@include file="footer.jsp"%>
</body>
</html>