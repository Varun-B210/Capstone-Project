<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
#main{

width:60%;
margin:0 auto;
height:300px;

}
#login{
width:70%;
margin:0 auto;

}
body{
background-image: url(https://www.aafoodservice.com/wp-content/themes/custom-theme/img/slider-v1704.jpg);
background-size: cover;
background-attacchment:fixed;

}
</style>
<body >
<%
		if (request.getParameter("error") != null) {
			out.println("<br> Your session has expired or it is invalid!");
		}
	%>
<div id="body">
<div class="container p-3 my-3 bg-dark text-white" align="center"
><h1>FOODBOX</h1>
<h4>Please Sign In to proceed</h4>
<div align="right"><a href="register.html"><button type="submit" class="btn btn-primary">Register</button></a></div>

</div>
<div id="main">
<form class="form-horizontal" action="LoginServlet" method="post">

  <div class="form-group" align="center" id="login"><br><br>
    <label class="control-label col-sm-2" for="email"></label>
    <input type="email" class="form-control" placeholder="Enter email" id="email" name="email"><br>
  
    <label class="control-label col-sm-2" for="pswd"></label>
    <input type="password" class="form-control" placeholder="Enter password" id="pswd" name="pswd">
  <br>
  <div class="form-group form-check">
    <label class="form-check-label">
    <font  color="white" size="5">
      <input class="form-check-input" type="checkbox" > Remember me</font>
    </label>
  </div>
  <br>
  <div>
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
 </div>
</form>
 </div>
 </div>
</body>
</html>