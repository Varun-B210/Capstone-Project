<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h4 align="left">Add New Food Items</h4>
<div class="container p-3 my-3 border" id="reg">

<form action="adminAdd.jsp">
  <div class="form-group">
    <input type="text" class="form-control" id="item" placeholder="Enter Item" name="item">
  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="price" placeholder="Enter Item Price" name="price">

  </div>
  <div class="form-group">
    <input type="text" class="form-control" id="price" placeholder="Enter Restaurant Name" name="rname">
  </div>
  <button type="submit" class="btn btn-primary">Add</button>
  </form>
  </div>
<div align="left">
<a href="login.jsp"><button type="submit" class="btn btn-primary">LogOut</button></a>
</div>
</body>
</html>