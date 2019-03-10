<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FACULTY INDEX</title>
<style type="text/css">
body {
  background-color: lightblue;
 text-align: center;
}

</style>
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
<h1>Welcome faculty index page</h1>
<h4>
	<form action="getAdmin">
  <input type="radio" name="choice" value="faculty_incharge" checked> View Raised Permissions <br> 
    <input type="radio" name="choice" value="pending"> View On-Hold Permissions <br> 
    <input type="radio" name="choice" value="declined"> View Rejected Permissions <br> 
  <input type="radio"  name="choice" value="approved">Approved permissions<br>
  <input type="submit">
  </h4>
</body>
</html>