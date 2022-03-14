<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%
  try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodbox","root","#0210mysql");
		Statement st=con.createStatement();
		
		String item=request.getParameter("item");
		String price=request.getParameter("price");
		String rname=request.getParameter("rname");
		
		
		String qry="insert into "+rname+" values(null,'"+item+"','"+price+"')";
		st.executeUpdate(qry);
		out.println("Data added successfully");
		%>
		<a href="admin.jsp">
		<button class="btn btn-success" type="submit">Add More</button></a>
   <%
		
	}catch(Exception e) {
		System.out.println("ERROR");
		e.printStackTrace();
	}
	
  
  %>
</body>
</html>