<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>permission</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	
	
	<%
	
	String name =request.getParameter("name");
	String rollNumber =request.getParameter("rollNumber");
	String department =request.getParameter("department");
	String lab =request.getParameter("lab");
	String maxAudience =request.getParameter("maxAudience");
	String eventStartDateTime =request.getParameter("eventStartDateTime");
	String eventEndDateTime=request.getParameter("eventEndDateTime");
	String eventPurpose =request.getParameter("eventPurpose");
	String undertaking =request.getParameter("undertaking");
	
		session.setAttribute("name", name);
		session.setAttribute("rollNumber", rollNumber);
		session.setAttribute("department", department);
		session.setAttribute("lab", lab);
		session.setAttribute("maxAudience", maxAudience);
		session.setAttribute("eventStartDateTime", eventStartDateTime);
		session.setAttribute("eventEndDateTime", eventEndDateTime);
		session.setAttribute("eventPurpose", eventPurpose);
		
	%>
	
		<div class="container">
			<div class="row">
				<label> Name: <%= name %></label>
			</div>
			
			<div class="row">
				<label>Roll Number: <%= rollNumber %></label>
			</div>
			
			<div class="row">
				<label>Department: <%= department %></label>
			</div>
			
			<div class="row">
				<label>Lab: <%= lab %></label>
			</div>
			
			<div class="row">
				<label>maximum Audience: <%= maxAudience %></label>
			</div>	
			
			<div class="row">
				<label>Event Start Date and Time: <%= eventStartDateTime %></label>
			</div>
			
			<div class="row">
				<label>Event End Date and Time: <%= eventEndDateTime %></label>
			</div>
			
			<div class="row">
				<label>Event Purpose: <%= eventPurpose %></label>
			</div>
			
			<div class="row">
				<label>Undertaking: <%= undertaking %></label>
			</div>
			
			
			<div class="row">
					<a  class="btn btn-outline-warning" href="SavePermission" role="button">Confirm</a>
					<a class="btn btn-outline-dark" href="raisePermissionApplication.jsp" role="button">Back</a>
			</div>
			
		</div>
</body>
</html>