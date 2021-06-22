<%@page import="com.entities.User"%>
<%
	User user1 = (User)session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-bg">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">Amazekart</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp">Home</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle nav-link active" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">Must Buy</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="index.jsp?category=2">Smart Phones</a></li>
						<li><a class="dropdown-item" href="index.jsp?category=4">Laptops</a></li>
						<li><a class="dropdown-item" href="index.jsp?category=6">Face Mask</a></li>
						<li><a class="dropdown-item" href="index.jsp?category=7">Sanitizers</a></li>
						<li><a class="dropdown-item" href="index.jsp?category=8">Grocery Items</a></li>
						
					</ul>
				</li>
			</ul>
					
			<ul class="navbar-nav ml-auto">
				
				<li class="nav-item active">
					<a class="nav-link" data-bs-toggle="modal" data-bs-target="#cart" href="components/common_modals.jsp"><i style="font-size:32px; color:white;" class="fa fa-cart-plus"></i><span class="cart-items" style="font-size:20px; color:white;"> (0)</span></a>
				</li>
						
			<%
				if(user1 == null)
				{
			%>	
				<li class="nav-item active">
					<a style="color:white" class="nav-link" href="login.jsp">Login</a>
				</li>
				
				<li class="nav-item active">
					<a style="color:white" class="nav-link" href="register.jsp">Register</a>
				</li>
			
			<%
				}
				
				else{
					String userType = user1.getUserType();
					if(userType.equals("admin"))
					{
			%>		
				
					<li class="nav-item active">
					<a style="color:white" class="nav-link" href="admin.jsp"><%="Welcome, "+user1.getUserName()%></a>
					</li>
				
					<li class="nav-item active">
						<a style="color:white" class="nav-link" href="LogoutServlet">Logout</a>
					</li>
					
			<%	
					}
					else
					{
			%>
			
					<li class="nav-item active">
						<a style="color:white" class="nav-link" href=""><%="Welcome, "+user1.getUserName()%></a>
					</li>
				
					<li class="nav-item active">
						<a style="color:white" class="nav-link" href="LogoutServlet">Logout</a>
					</li>
					
			<%
					}
				}
			%>					
			
			</ul>
		</div>
	</div>
</nav>