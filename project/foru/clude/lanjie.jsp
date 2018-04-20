<%
	String _uid=(String)session.getAttribute("uid");
	if(_uid==null){
		//not login，gun go login
		response.sendRedirect("../login.jsp");
	}
%>