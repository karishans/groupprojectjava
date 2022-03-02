<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- FOR Bootstrap CSS (SIMPLE) -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<!-- BOOTSTRAP CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

	<!-- MY OWN CSS -->
	<link rel="stylesheet" href="/css/scottsStyle.css"/>

	<!-- FOR ANY BOOTSTRAP THAT USES JS OR jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/javascript/javascript.js" defer></script>
	<title>Order Details</title>
</head>
<body>
<div id="page">
	<div id="headerWrapper">
			<div id="logoWrapper">
				<h2>Tony's Pizza</h2>
			</div>
				<a class="links" href="/home">Home</a>
				<a class="links" href="/edit/user">Edit Profile</a>
				<a class="links" href="/make/order">Order</a>
				<a class="links" href="/order/history">Order History</a>
				<a class="links" href="/logout">Logout <span>- (${user.firstName} ${user.lastName}) </span></a>
	</div><br>	
		<h1 class="title_grad txt_grad title_bar" >Order Confirmed</h1>
		<hr>
		<div class="d-flex flex-row justify-content-around">

				<div id="showOrderWrapper">
					<h2 class="text-center" > ~ <span>Order Details</span> ~ </h2>
					<hr>
					<div>
						<h3>Name: ${order.user.firstName} ${order.user.lastName}</h3>
					</div>
					<div>
						<h3>Method: ${order.method}</h3>
					</div>

					<div>
						<h3>Crust: ${order.crust}</h3>
					</div>
					<div>
						<h3>Size: ${order.size}</h3>
					</div>
					<div>
						<h3>Toppings: ${order.toppings}</h3>
					</div>
<!-- 					added Quantity Div -->
					<div>
						<h3>Quantity: ${order.quantity}</h3>
					</div>
					<div>
<!-- 					added price $ -->
						<h3>Price: $${order.price}</h3>
					</div>

					<c:if test="${user.id == order.user.id}">
						<div class="mt-4">
							<a class="btns" href="/edit/order/${order.id}">Edit</a>
							<a class="btns text-danger" href="/delete/order/${order.id}">Delete</a>
						</div>
					</c:if>
					<br>
				    <div class="d-flex flex-row justify-content-around m-3">
			        	<a class="button" href="/home">Home</a>
			    	</div>
				</div>
				
				<c:if test="${isTakingOut}">
					<div id="showDeliveryDetails">
						<h2 class="text-center" >~Your Delivery Info ~</h2>
						<hr>
						<div>
							<h3>Name: ${order.user.firstName} ${order.user.lastName}</h3>
						</div>
						<div>
							<h3>Address: ${order.user.address}</h3>
						</div>
	
						<div>
							<h3>City: ${order.user.city}</h3>
						</div>
						<div>
							<h3>State: ${order.user.state}</h3>
						</div>
					</div>
				</c:if>
				
			</div>
			
		
</body>
</html>