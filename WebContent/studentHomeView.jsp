<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
</head>
<body>
<%
	
	response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
	//response.setHeader("Pragma", "no-cache");
	//response.setHeader("Expires", "0");

	if(session.getAttribute("email")==null){
		response.sendRedirect("loginView.jsp");
	}
%>
Welcome <%=session.getAttribute("email") %> in the home page 
<br/>
Website is underdevelopment...

<form action="Logout">
	<input type="submit" value="Logout"/>
</form>
</body>
</html>