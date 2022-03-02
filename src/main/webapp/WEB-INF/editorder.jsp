<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!-- Formatting (dates) --> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  

<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- FOR Bootstrap CSS -->
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" >
	<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/stylekaris.css">
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/stylemulti.css">
	<link rel="stylesheet" href="/css/jquery.multiselect.css">
	
	<link href=”https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css” rel=”stylesheet”>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>



	<title>Order Pizza</title>
</head>

<body>
<div class="background">
<nav class="bg-dark p-2">
	<div class="row d-flex align-items-center justify-content-between p-3">
		<div class = "col-md-4">
			<a class="navbar-brand link" href="/home"> Tony's Pizza</a>
		</div>
		<div class = "col-md-5">
				<a class="link" href="/home">Home</a>
				<a class="link" href="/edit/user">Edit Profile</a>
				<a class="link" href="/order/history">Order History</a>
				<a class="link" href="/logout">Logout - (${user.firstName} ${user.lastName})</a>
		</div>
	
	</div>
</nav>
<div class="container">

	<h1 class="title_grad txt_grad title_bar">Edit Order</h1>
	<div class="d-flex justify-content-center mt-4">
		<div class = "row border border-secondary p-4 rounded marg-bottom-10 card-background">
			<div class="col">
				<h2 class="text-center" > ~ <span class="text-center bold">Personalize Your Pizza</span> ~ </h2>



			
			<form:form action="/editing/order/${order.id}" method="POST" modelAttribute="order">
				<div class="form-group col-md-12 mt-4">
					<form:errors class="text-danger" path="method"/>
					<div class = "row align-items-center">
						<div class = "col-md-3">
							<form:label class="" path="method">Method: </form:label>
						</div>
						<div class = "col-md-6">
							<form:select class="form-control" type="text" path="method" placeholder="Takeout, delivery, dine-in">
								<c:choose>
									<c:when test="${order.method == 'Takeout'}">
										<option value="${order.method}">Takeout</option>
	        							<option value="Delivery">Delivery</option>
	        							<option value="Dine-in">Dine-in</option>
									</c:when>
									<c:when test="${order.method == 'Delivery'}">
	        							<option value="${order.method}">Delivery</option>
										<option value="Takeout">Takeout</option>
			        					<option value="Dine-in">Dine-in</option>
									</c:when>
									<c:when test="${order.method == 'Dine_In'}">
			        					<option value="${order.method}">Dine_In</option>
										<option value="Takeout">Takeout</option>
			        					<option value="Delivery">Delivery</option>									
									</c:when>
								</c:choose>
<%-- 								<option value="">${order.method}</option> --%>
<!-- 								<option value="Takeout">Takeout</option> -->
<!-- 	        					<option value="Delivery">Delivery</option> -->
<!-- 	        					<option value="Dine-in">Dine-in</option> -->
							</form:select>
						</div>
					</div>
				</div>
			
			
				<div class="form-group col-md-12 mt-3">
					<form:errors class="text-danger" path="size"/>
					<div class = "row align-items-center">
						<div class = "col-md-3">
							<form:label  path="size">Size: </form:label>
						</div>
						<div class = "col-md-6">
							<form:select class="form-control" type="text" path="size" placeholder="Small, Medium, Large, X-Large">
									<c:if test="${order.size == 'Small'}">
										<option value="${order.size}">Small</option>
			        					<option value="Medium">Medium</option>
			        					<option value="Large">Large</option>
			        					<option value="X-large">X-Large</option>									
									</c:if>
									<c:if test="${order.size == 'Medium'}">
										<option value="${order.size}">Medium</option>
										<option value="Small">Small</option>
			        					<option value="Large">Large</option>
			        					<option value="X-large">X-Large</option>									
									</c:if>
									<c:if test="${order.size == 'Large'}">
										<option value="${order.size}">Large</option>
										<option value="Small">Small</option>
			        					<option value="Medium">Medium</option>
			        					<option value="X-large">X-Large</option>									
									</c:if>
									<c:if test="${order.size == 'XLarge'}">
										<option value="${order.size}">X-Large</option>
										<option value="Small">Small</option>
			        					<option value="Medium">Medium</option>
			        					<option value="Large">Large</option>
									</c:if>									
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${order.size == 'Small'}"> --%>
<%-- 										<option value="${order.size}">Small</option> --%>
<!-- 			        					<option value="Medium">Medium</option> -->
<!-- 			        					<option value="Large">Large</option> -->
<!-- 			        					<option value="X-large">X-Large</option>									 -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${order.size == 'Medium'}"> --%>
<%-- 										<option value="${order.size}">Medium</option> --%>
<!-- 										<option value="Small">Small</option> -->
<!-- 			        					<option value="Large">Large</option> -->
<!-- 			        					<option value="X-large">X-Large</option>									 -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${order.size == 'Large'}"> --%>
<%-- 										<option value="${order.size}">Large</option> --%>
<!-- 										<option value="Small">Small</option> -->
<!-- 			        					<option value="Medium">Medium</option> -->
<!-- 			        					<option value="X-large">X-Large</option>									 -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${order.size == 'X-Large'}"> --%>
<%-- 										<option value="${order.size}">X-Large</option> --%>
<!-- 										<option value="Small">Small</option> -->
<!-- 			        					<option value="Medium">Medium</option> -->
<!-- 			        					<option value="Large">Large</option> -->
<%-- 									</c:when>									 --%>
<%-- 								</c:choose>									 --%>
<!-- 								<option value="" disabled selected>--Select Size--</option> -->
<!-- 								<option value="Small">Small</option> -->
<!-- 	        					<option value="Medium">Medium</option> -->
<!-- 	        					<option value="Large">Large</option> -->
<!-- 	        					<option value="X-large">X-Large</option> -->

							</form:select>
						</div>
					</div>
				</div>
			
				
				<div class="form-group col-md-12 mt-3">
					<form:errors class="text-danger" path="crust"/>
					<div class = "row align-items-center">
						<div class = "col-md-3">
							<form:label path="crust">Crust: </form:label>
						</div>
						<div class = "col-md-6">
							<form:select class="form-control mbd-select md-form" type="text" path="crust">
								<c:choose>
									<c:when test="${order.crust == 'Deep Dish'}">
								<option value="${order.crust}">Deep Dish</option>
	        					<option value="Thin">Thin</option>
	        					<option value="Thick">Thick</option>
	        					<option value="Stuffed">Stuffed</option>
	        					<option value="Gluten Free">Gluten-Free</option>
									</c:when>
									<c:when test="${order.crust == 'Thin'}">
								<option value="${order.crust}">Thin</option>
								<option value="Deep Dish">Deep Dish</option>
	        					<option value="Thick">Thick</option>
	        					<option value="Stuffed">Stuffed</option>
	        					<option value="Gluten Free">Gluten-Free</option>
									</c:when>
									<c:when test="${order.crust == 'Thick'}">
								<option value="${order.crust}">Thick</option>
								<option value="Deep Dish">Deep Dish</option>
	        					<option value="Thin">Thin</option>
	        					<option value="Stuffed">Stuffed</option>
	        					<option value="Gluten Free">Gluten-Free</option>								
									</c:when>
									<c:when test="${order.crust == 'Gluten Free'}">
								<option value="${order.crust}">Gluten-Free</option>
								<option value="Deep Dish">Deep Dish</option>
	        					<option value="Thin">Thin</option>
	        					<option value="Thick">Thick</option>
	        					<option value="Stuffed">Stuffed</option>
									</c:when>
									<c:when test="${order.crust == 'Stuffed'}">
								<option value="${order.crust}">Stuffed</option>
								<option value="Deep Dish">Deep Dish</option>
	        					<option value="Thin">Thin</option>
	        					<option value="Thick">Thick</option>
	        					<option value="Gluten Free">Gluten-Free</option>
									</c:when>																		
								</c:choose>
<!-- 								<option value="" disabled selected>--Select Crust--</option> -->
<!-- 								<option value="Deep Dish">Deep Dish</option> -->
<!-- 	        					<option value="Thin">Thin</option> -->
<!-- 	        					<option value="Thick">Thick</option> -->
<!-- 	        					<option value="Stuffed">Stuffed</option> -->
<!-- 	        					<option value="Gluten-Free">Gluten Free</option> -->
							</form:select>
						</div>
					</div>
				</div>
				
				<div class="form-group col-md-12 mt-3">
					<form:errors class="text-danger" path="quantity"/>
					<div class = "row align-items-center">
						<div class = "col-md-3">
							<form:label class="color-bl label txt-underline" path="quantity">Quantity: </form:label>
						</div>
						<div class = "col-md-4">
							<form:input class="form-control" type="number" min="1" path="quantity" placeholder="QTY"/>
						</div>
					</div>
				</div>
				
			
				<div class="form-group col-md-12 mt-3">
			
					<div class="container text-left">
					<div class = "row justify-content-center">
						<div class = "col-md-10">
							<form:errors class="text-danger" path="toppings"/>
							<form:select path="toppings" name="basic[]" multiple="multiple" class="3col active form-control" value="${order.toppings}">
								<option value=" Tomato Sauce">Tomato Sauce</option>
								<option value=" Pesto">Pesto Sauce</option>
								<option value=" Mozzarella">Mozzarella Cheese</option>
	        					<option value=" Cheddar Cheese">Cheddar Cheese</option>
								<option value=" Feta Cheese">Feta Cheese</option>
								<option value=" Parmesan">Parmesan Cheese</option>
								<option value=" Tomates">Tomates</option>
	        					<option value=" Onions">Onions</option>
	        					<option value=" Peppers">Peppers</option>
	        					<option value=" Pineapple">Pineapple</option>
	        					<option value=" Spinach">Spinach</option>
	        					<option value=" Garlic">Garlic</option>
	        					<option value=" Mushrooms">Mushrooms</option>
	        					<option value=" Sausage">Sausage</option>
	        					<option value=" Pepperoni">Pepperoni</option>
	        					<option value=" Ham">Ham</option>	
	        					<option value=" Bacon">Bacon</option>
	        					<option value=" Chicken">Chicken</option>
	        				
							</form:select>
						</div>
						
					</div>
					</div>
				</div>
			
<!-- 				<p class="d-flex flex-column"> -->
<%-- 					<form:label class="color-bl label txt-underline" path="price">Price: </form:label> --%>
<%-- 					<form:errors class="text-danger" path="price"/> --%>
<%-- 					<form:input class="ms-3 bg-dark color-gr border border-light" type="text" path="price" placeholder="Price"/> --%>
<!-- 				</p> -->
			
				<div class="d-flex flex-row justify-content-around mt-4">
					<form:hidden path="price" value="0"/>
					<form:hidden path="user" value="${user.id}"/>
					<input class="btn btn-primary" type="submit" value="Submit Order"/>
					<a class="btn btn-danger"  href="/home">Cancel</a>
				</div>
				 
			</form:form>















			
<%-- 			<form:form action="/editing/order/${order.id}" method="POST" modelAttribute="order"> --%>
<!-- 				 Hidden Input for orderId -->
			
<!-- 				<div class="form-group col-md-12 mt-4"> -->
<%-- 					<form:errors class="text-danger" path="method"/> --%>
<!-- 					<div class = "row align-items-center"> -->
<!-- 						<div class = "col-md-3"> -->
<%-- 							<form:label class="" path="method">Method: </form:label> --%>
<!-- 						</div> -->
<!-- 						<div class = "col-md-6"> -->
<%-- 							<form:select class="form-control" type="text" path="method" placeholder="Takeout, delivery, dine-in"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${oldorder.method == 'Takeout'}"> --%>
<!-- 										<option selected value="Takeout">Takeout</option> -->
<!-- 	        							<option value="Delivery">Delivery</option> -->
<!-- 	        							<option value="Dine-in">Dine-in</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test = "${oldorder.method == 'Delivery'}"> --%>
<!-- 	        							<option value="Takeout">Takeout</option> -->
<!-- 	        							<option selected value="Delivery">Delivery</option> -->
<!-- 	        							<option value="Dine-in">Dine-in</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.method == 'Dine-in'}"> --%>
<!-- 	        							<option value="Takeout">Takeout</option> -->
<!-- 	        							<option value="Delivery">Delivery</option> -->
<!-- 	        							<option selected value="Dine-in">Dine-in</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        					</c:choose> --%>
<%-- 							</form:select> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
			
<!-- 				<div class="form-group col-md-12 mt-3"> -->
<%-- 					<form:errors class="text-danger" path="size"/> --%>
<!-- 					<div class = "row align-items-center"> -->
<!-- 						<div class = "col-md-3"> -->
<%-- 							<form:label  path="size">Size: </form:label> --%>
<!-- 						</div> -->
<!-- 						<div class = "col-md-6"> -->
<%-- 							<form:select class="form-control" type="text" path="size" placeholder="Small, Medium, Large, X-Large"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test ="${oldorder.size == 'Small'}"> --%>
<!-- 										<option selected value="Small">Small</option> -->
<!-- 	        							<option value="Medium">Medium</option> -->
<!-- 	        							<option value="Large">Large</option> -->
<!-- 	        							<option value="X-large">X-Large</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.size == 'Medium'}"> --%>
<!-- 										<option value="Small">Small</option> -->
<!-- 	        							<option selected value="Medium">Medium</option> -->
<!-- 	        							<option value="Large">Large</option> -->
<!-- 	        							<option value="X-large">X-Large</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.size == 'Large'}"> --%>
<!-- 										<option value="Small">Small</option> -->
<!-- 	        							<option value="Medium">Medium</option> -->
<!-- 	        							<option selected value="Large">Large</option> -->
<!-- 	        							<option value="X-large">X-Large</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.size == 'X-large'}"> --%>
<!-- 										<option value="Small">Small</option> -->
<!-- 	        							<option value="Medium">Medium</option> -->
<!-- 	        							<option value="Large">Large</option> -->
<!-- 	        							<option selected value="X-large">X-Large</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        					</c:choose> --%>
<%-- 							</form:select> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			
				
<!-- 				<div class="form-group col-md-12 mt-3"> -->
<%-- 					<form:errors class="text-danger" path="crust"/> --%>
<!-- 					<div class = "row align-items-center"> -->
<!-- 						<div class = "col-md-3"> -->
<%-- 							<form:label path="crust">Crust: </form:label> --%>
<!-- 						</div> -->
<!-- 						<div class = "col-md-6"> -->
<%-- 							<form:select class="form-control mbd-select md-form" type="text" path="crust"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test ="${oldorder.crust == 'Deep Dish'}"> --%>
<!-- 										<option selected value="Deep Dish">Deep Dish</option> -->
<!-- 	        							<option value="Thin">Thin</option> -->
<!-- 	        							<option value="Thick">Thick</option> -->
<!-- 	        							<option value="Stuffed">Stuffed</option> -->
<!-- 	        							<option value="Gluten-Free">Gluten Free</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.crust == 'Thin'}"> --%>
<!-- 										<option value="Deep Dish">Deep Dish</option> -->
<!-- 	        							<option selected value="Thin">Thin</option> -->
<!-- 	        							<option value="Thick">Thick</option> -->
<!-- 	        							<option value="Stuffed">Stuffed</option> -->
<!-- 	        							<option value="Gluten-Free">Gluten Free</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.crust == 'Thick'}"> --%>
<!-- 										<option value="Deep Dish">Deep Dish</option> -->
<!-- 	        							<option value="Thin">Thin</option> -->
<!-- 	        							<option selected value="Thick">Thick</option> -->
<!-- 	        							<option value="Stuffed">Stuffed</option> -->
<!-- 	        							<option value="Gluten-Free">Gluten Free</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.crust == 'Stuffed'}"> --%>
<!-- 										<option value="Deep Dish">Deep Dish</option> -->
<!-- 	        							<option value="Thin">Thin</option> -->
<!-- 	        							<option value="Thick">Thick</option> -->
<!-- 	        							<option selected value="Stuffed">Stuffed</option> -->
<!-- 	        							<option value="Gluten-Free">Gluten Free</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        						<c:when test ="${oldorder.crust == 'Gluten-Free'}"> --%>
<!-- 										<option value="Deep Dish">Deep Dish</option> -->
<!-- 	        							<option value="Thin">Thin</option> -->
<!-- 	        							<option value="Thick">Thick</option> -->
<!-- 	        							<option value="Stuffed">Stuffed</option> -->
<!-- 	        							<option selected value="Gluten-Free">Gluten Free</option> -->
<%-- 	        						</c:when> --%>
<%-- 	        					</c:choose> --%>
<%-- 							</form:select> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="form-group col-md-12 mt-3"> -->
<%-- 					<form:errors class="text-danger" path="quantity"/> --%>
<!-- 					<div class = "row align-items-center"> -->
<!-- 						<div class = "col-md-3"> -->
<%-- 							<form:label class="color-bl label txt-underline" path="quantity">Quantity: </form:label> --%>
<!-- 						</div> -->
<!-- 						<div class = "col-md-4"> -->
<%-- 							<form:input class="form-control" type="number" min="1" path="quantity" value="${oldorder.quantity}"/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
			
<!-- 				<div class="form-group col-md-12 mt-3"> -->
			
<!-- 					<div class="container text-left"> -->
<!-- 					<div class = "row justify-content-center"> -->
<!-- 						<div class = "col-md-10"> -->
<%-- 							<form:errors class="text-danger" path="toppings"/> --%>
<%-- 							<form:select path="toppings" name="basic[]" multiple="multiple" class="3col active form-control"> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Tomato Sauce')}"> --%>
<!-- 									<option selected value=" Tomato Sauce">Tomato Sauce</option> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Pesto')}"> --%>
<!-- 									<option selected value=" Pesto">Pesto Sauce</option> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Mozzarella')}"> --%>
<!-- 									<option selected value=" Mozzarella">Mozzarella Cheese</option> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Cheddar')}"> --%>
<!-- 	        						<option selected value=" Cheddar Cheese">Cheddar Cheese</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Feta')}"> --%>
<!-- 									<option selected value=" Feta Cheese">Feta Cheese</option> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Parmesan')}"> --%>
<!-- 									<option selected value=" Parmesan">Parmesan Cheese</option> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Tomates')}"> --%>
<!-- 									<option selected value=" Tomates">Tomates</option> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test ="${oldorder.toppings.contains('Onions')}"> --%>
<!-- 	        						<option selected value=" Onions">Onions</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Peppers')}"> --%>
<!-- 	        						<option selected value=" Peppers">Peppers</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Pineapple')}"> --%>
<!-- 	        						<option selected value=" Pineapple">Pineapple</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Spinach')}"> --%>
<!-- 	        						<option selected value=" Spinach">Spinach</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Garlic')}"> --%>
<!-- 	        						<option selected value=" Garlic">Garlic</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Mushrooms')}"> --%>
<!-- 	        						<option selected value=" Mushrooms">Mushrooms</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Sausage')}"> --%>
<!-- 	        						<option selected value=" Sausage">Sausage</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Pepperoni')}"> --%>
<!-- 	        						<option selected value=" Pepperoni">Pepperoni</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Ham')}"> --%>
<!-- 	        						<option selected value=" Ham">Ham</option>	 -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Bacon')}"> --%>
<!-- 	        						<option selected value=" Bacon">Bacon</option> -->
<%-- 	        					</c:if> --%>
<%-- 	        					<c:if test ="${oldorder.toppings.contains('Chicken')}"> --%>
<!-- 	        						<option selected value=" Chicken">Chicken</option> -->
<%-- 	        					</c:if> --%>
	        				
<%-- 							</form:select> --%>
<!-- 						</div> -->
						
<!-- 					</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			

			
<!-- 				<div class="d-flex flex-row justify-content-around mt-4"> -->
<%-- 					<form:hidden path="price" value="0.0"/> --%>
<%-- 					<form:hidden path="user" value="${user.id}"/> --%>
<!-- 					<input class="btn btn-primary" type="submit" value="Submit Order"/> -->
<!-- 					<a class="btn btn-danger"  href="/home">Cancel</a> -->
<!-- 				</div> -->
				 
<%-- 			</form:form> --%>
		</div>
	</div>
</div>
</div>
</div>
	
 <script src="javascript/jquery-3.3.1.min.js"></script>
 <script src="/javascript/popper.min.js"></script>
    <script src="/javascript/bootstrap.min.js"></script>
    <script src="/javascript/jquery.multiselect.js"></script>
    <script src="/javascript/main.js"></script>
</body>
</html>