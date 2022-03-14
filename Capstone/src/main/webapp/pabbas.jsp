<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.List"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
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
			String pb= request.getParameter("pabbas");
			if (Objects.nonNull(pb)) {
						%>
		<h3 align="center">PABBAS ICE-CREAM PARLOUR</h3>				
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
						List<HashMap<Object, Object>> pbmenu = new ObjectMapper().readValue(pb, List.class);
								
												for (HashMap<Object, Object> eachMap : pbmenu) {
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