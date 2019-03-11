<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Lab Admin Home</title>
<link rel="stylesheet" href="/PermissionManagement/WebContent/css/studHomeStyle.css">
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
<div style="padding: 5px;float:center">
		<ul class="nav">
   			<li><a href="${pageContext.request.contextPath}/raisePermissionView.jsp">Raise Permission</a></li>
   			<li><a href="${pageContext.request.contextPath}/studentRequestsView.jsp">View Raised Permissions</a></li>
   			
		</ul>
	</div>
	
	<div style="padding: 5px;float:center">
		<p><b>Admin Responsibilities</b></p>
		<ul  class="nav">
			<li><a href="getAdmin?choice=lab_admin">Show raised Permission Requests</a></li>
			<li><a href="getAdmin?choice=approved">Show Approved Permission</a>
		</ul>
		
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>