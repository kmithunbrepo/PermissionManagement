<%@page import="java.util.ArrayList"%>
<%@page import="in.ac.nitc.permission.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Approved List</title>
<style>

table{
	border: 10px solid;
}
th,td{
	padding: 5px;
	text-align:center;
}
</style>
</head>
<body style="background-color:powderblue;">

<h1 style="text-align:center;"> View of Approved Permission</h1>
 <table cellspacing="20">
 <tr style="margin: 5px">
    <th>Event Id</th>
    <th>Start Date time</th>
    <th>End Date Time</th>
    <th>Purpose</th>
    <th>Student RollNo</th>
    <th>Student Name</th>
    <th>Raised Date Time</th>
    <th>Last Responsed Date Time</th>
    <th>Permission Status</th>
    <th>Lab Id</th>
    <th>No of Audience</th>
  </tr>
  
<%
	ArrayList<PermissionR> list=(ArrayList<PermissionR>)request.getAttribute("permission_list");

	for(PermissionR obj : list)
	{
		//out.println(obj);
		%>
		
  <tr style="margin: 5px">
    <td><%= obj.getEvent_id() %></td>
    <td><%= obj.getStart_datetime() %></td>
    <td><%=obj.getEnd_datetime() %></td>
    <td><%=obj.getPurpose() %></td>
    <td><%=obj.getStudent_rollno() %></td>
    <td><%=obj.getStudent_name()  %></td>
    <td><%=obj.getRaised_datetime()  %></td>
    <td><%=obj.getResponse_datetime()  %></td>
    <td><%=obj.getStatus()  %></td>
    <td><%=obj.getLab_id()  %></td>
    <td><%=obj.getMax_audiance()  %></td>
  </tr>
<% 
		out.println("\n");
	}

%>
</table>

<!-- 
<%
	//ArrayList<Permission> list=(ArrayList<Permission>)request.getAttribute("permission_list");

	//for(Permission obj : list)
	{
	//	out.println(obj);
		%>
		<h1><%
		//out.println(obj.getEvent_id());
	
		//out.print(	obj.getStudent_name());
		%></h1>
		<br><br>
<% 
		//out.println("\n");
	}

%>
 -->
</body>
</html>