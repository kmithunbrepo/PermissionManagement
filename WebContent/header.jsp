<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  
 <html>

<head>
  <title>Header</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>

    <div id = "header">

      <div id="logo">
      <img src = "img/nitclogo.png" alt = "image not avilable" style = "width:4%;height :5%">
          <h1><a href="index.jsp" id="logo_text1">NITC<span id="logo_text2"> Permission Flow Management System</span></a></h1>
          &nbsp;&nbsp;
        </div>
    

      <div id="nav">
        <ul id="menu">
          <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/events.jsp">Events Requested</a></li>
          <%
			if(session.getAttribute("email")==null){
			%>
   			<li><a href="${pageContext.request.contextPath}/loginView.jsp">Login</a></li>
   			<%
			}
			else
			{
			%>
			<li style="color:cyan;">Welcome <%=session.getAttribute("name") %></li>
			<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
			<%
			}
			%>
   			<li><a href="${pageContext.request.contextPath}/venueDetailsView.jsp">Venue Details</a></li>
          <li><a href="contact.jsp">Contact Us</a></li>

        </ul>

  </div>

  </div> 
  
</body>
</html>

</body>