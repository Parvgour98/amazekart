<%
	// For getting message from the session, which is created 
	// in RegisterServlet by passing key "message"
	String message = (String)session.getAttribute("message");
	if(message!=null)
	{
	 	// 	Printing the message here...
%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  		<strong><%=message%></strong>	
  		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
<%
		session.removeAttribute("message");
	}
%>