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
<br/>
<br/>
<jsp:include page="header.jsp"></jsp:include>
<br/>
<br/>

<h1>Welcome faculty index page</h1>
	<form action="getAdmin">
  <input type="radio" name="choice" value="faculty_incharge" checked><b>View Raised Permissions</b> <br> 
    <input type="radio" name="choice" value="pending"><b> View On-Hold Permissions</b> <br> 
    <input type="radio" name="choice" value="declined"> <b>View Rejected Permissions</b> <br> 
  <input type="radio"  name="choice" value="approved"><b>Approved permissions</b><br>
  <input type="submit">
  </form>
</body>
</html>