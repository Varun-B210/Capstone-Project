<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.servlet.http.Cookie" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-3" align="center">
<% 
			String bh= request.getParameter("biriyanihouse");
			if (Objects.nonNull(bh)) {
						%>
		<h3 align="center">BIRIYANI HOUSE</h3>				
		<table class="table table-striped">
					<thead>
						<tr>
							<th>Sl No</th>
							<th>Menu</th>
							<th>Price(Rs)</th>
						</tr>
					</thead>
					<tbody>
						<%
						@SuppressWarnings("unchecked")
						List<HashMap<Object, Object>> bhmenu = new ObjectMapper().readValue(bh, List.class);
								
												for (HashMap<Object, Object> eachMap : bhmenu) {
													int id = (Integer) eachMap.get("productid");
													String description = (String) eachMap.get("description");
													int price=(Integer) eachMap.get("price");
													
						%>
									<tr>
										<td><%=id%></td>
										<td><%=description%></td>
										<td><%=price %></td>
										
										<td><button type="submit" class="btn btn-success">Add to Cart
										</button></td>
									</tr>
							
							<%	}%>
							<%	}%>
					
					</tbody>
				</table>
		
</div>

</body>
</html>