<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  

<div style="padding: 5px;float:center">
		<ul class="nav">
	 		<li><a href="${pageContext.request.contextPath}/">Home</a></li>
   			<li><a href="${pageContext.request.contextPath}/events.jsp">Events Planned</a></li>
   			<%
			if(session.getAttribute("email")==null){
			%>
   			<li><a href="${pageContext.request.contextPath}/loginView.jsp">Login</a></li>
   			<%
			}
			else
			{
			%>
			<li>Welcome <%=session.getAttribute("name") %></li>
			<li><a href="${pageContext.request.contextPath}/Logout">Logout</a></li>
			<%
			}
			%>
   			<li><a href="${pageContext.request.contextPath}/venueDetailsView.jsp">Venue Details</a></li>
		</ul>
	</div>  