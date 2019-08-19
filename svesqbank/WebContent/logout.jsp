<%
	//session.setAttribute("uid", null);
	//session.invalidate();
	session.removeAttribute("uname");
	session.invalidate();
	response.sendRedirect("index.jsp");
%>