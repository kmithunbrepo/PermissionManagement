<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Duty Page</title>
<style>
body {
  background-color: lightblue;
 text-align: center;
}
</style>
</head>
<body>
	<h1>Admin Duty</h1>
	<form action="getAdmin">
  		<input type="radio" name="choice" value="lab_admin"> View Raised Permissions <br> 
  		<!--It will goto servlet page "admin_view with data "lab_admin"   -->
  
  		<input type="radio"  name="choice" value="approved">Approved permissions<br>
    	<!--It will goto servlet page "admin_view with data "approved"   -->
  		<input type="submit">
	</form> 
</body>
</html>