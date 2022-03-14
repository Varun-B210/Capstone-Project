<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container mt-3">


<h1 align="center">Welcome to FOODBOX</h1>
<div align="right">

</div>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
  
  	 <form class="d-flex">
        <input class="form-control me-2" type="text" placeholder="Search">
        <button  class="btn btn-primary" type="button">Search</button>
        <span style="padding-left:700px; padding-right:10px;">
        <a href="cart.jsp"><button class="btn btn-primary" type="button">Cart</button></a></span>
        <a href="login.jsp"><button type="button" class="btn btn-danger">LogOut<%session.invalidate(); %></button></a>
        
        
        
      </form>
    </div>
    </nav>

<!-- Nav tabs -->
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#Nonveg">Veg and NonVeg</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="#Veg">Pure Veg</a>
  </li>
  
</ul>

<!-- Tab panes -->
<div class="tab-content">
 
  <div class="tab-pane container fade" id="Nonveg">
 <ul class="nav flex-column">
    <li class="nav-item">
    <a class="nav-link" href="biriyanihouse">Biriyani house</a>
      <a class="nav-link" href="dominos">Dominos</a>
       <a class="nav-link" href="kababcenter">Kabab Center</a>
        <a class="nav-link" href="foodlands">Foodlands</a>
    </li>
    </ul>
    
</div>
  <div class="tab-pane container fade" id="Veg">
  <ul class="nav flex-column">
    <li class="nav-item">
      <a class="nav-link" href="villagerest">The Village Restaurant</a>
        <a class="nav-link" href="hilltop">Hill Top Restaurant</a>
         <a class="nav-link" href="pabbas">Pabbas Ice Cream parlour</a>
          <a class="nav-link" href="coriander">Hotel Coriander</a> 
 </li>
    </ul>
     
</div>
	 <jsp:include page="biriyanihouse.jsp"></jsp:include>
     <jsp:include page="dominos.jsp"></jsp:include>
     <jsp:include page="kababcenter.jsp"></jsp:include>
     <jsp:include page="foodlands.jsp"></jsp:include>
  	 <jsp:include page="coriander.jsp"></jsp:include>
  	 <jsp:include page="hilltop.jsp"></jsp:include>
   	 <jsp:include page="pabbas.jsp"></jsp:include>
  	 <jsp:include page="villagerest.jsp"></jsp:include>
 	

</div>
</div> 

</body>
</html>