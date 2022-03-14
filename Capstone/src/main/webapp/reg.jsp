<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
</head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<body>

  <%
  try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodbox","root","#0210mysql");
		Statement st=con.createStatement();
		
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		
		
		String qry="insert into userdetails values('"+email+"','"+pwd+"')";
		st.executeUpdate(qry);
		out.println("Data added successfully");
		%>
		<a href="login.jsp">
		<button class="btn btn-success" type="submit">Login</button></a>
   <%
		
	}catch(Exception e) {
		System.out.println("ERROR");
		e.printStackTrace();
	}
	
  
  %>

</body>
</html>