<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
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
   			<li><a href="${pageContext.request.contextPath}/raisePermission.jsp">Faculty Incharge</a></li>
   			<li><a href="${pageContext.request.contextPath}/studentRequestsView.jsp">Faculty</a></li>
		</ul>
	</div> 
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>