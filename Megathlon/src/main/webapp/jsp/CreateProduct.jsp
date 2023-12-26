<%@page import="java.util.ArrayList"%>

<%@page import="com.Megathlon.Beans.Brand"%>
<%@page import="com.Megathlon.Beans.Suppliers"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Products</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/OverlayScrollbars.min.css">
</head>

<body class="hold-transition sidebar-mini">
	

<body class="hold-transition sidebar-mini layout-fixed">

	<div class="wrapper">
		<%@include file="../inc/NavBar.jsp"%>
	

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Add Product</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/Megathlon/Homepage">Home</a></li>
								<li class="breadcrumb-item active">Add Product</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid ">
					<div class="row">
						<!-- left column -->
						<div class="col-md-8 offset-2">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Add a product</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form action="CreateProduct" method="POST" id="product">
									<div class="card-body">
									<!-- Product Name -->
										<div class="form-group">
											<label for="exampleInputName">Product Name*</label> 
											<input type="text" name="productName" class="form-control"
												id="productName_origin" placeholder="Enter Product Name"
												required value="<%= (request.getAttribute("productName") == null) ?  "" : (String) request.getAttribute("productName") %>">
										</div>

										<!-- description -->
										<div class="form-group"> 
											<label for="exampleInputDescription">Description</label> 
											<textarea name="description" class="form-control" id="description_origin"
												placeholder="Enter Product Description"><%= (request.getAttribute("description") == null) ? "" : (String) request.getAttribute("description") %></textarea>


										</div>
										<!-- price -->
										<div class="form-group">
											<label for="exampleInputPrice">Price*</label>
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">RM</span>
												</div>
												<input  value="<%= (double) request.getAttribute("price") %>" id="price_origin" type="number" name="price" class="form-control" step="0.01"
													placeholder="0.00" required />
											</div>
										</div>
										<!-- quantity -->
										<div class="form-group">
											<label for="exampleInputQuantity">Quantity</label> <input
												type="number" name="quantity" class="form-control"  value="<%= (int) request.getAttribute("quantity") %>"
												id="quantity_origin" placeholder="Enter Quantity" required>
										</div>
										<!-- brand -->
										<div class="form-group">
											<label>Brand*</label> <select class="form-control custom-select"
												name="brand" required>
												<option value="" disabled selected hidden>Select Brand</option>
												<%
												ArrayList<Brand> BrandList = (ArrayList<Brand>) request.getAttribute("BrandList");
												for (int i = 0; i < BrandList.size(); ++i) {
												%>
												<option><%=BrandList.get(i).getBrandName()%>
												</option>
												<%
												}
												%>
											</select>
											<!-- Button trigger modal -->
											<button type="button" class="btn btn-primary my-2"
												data-bs-toggle="modal" data-bs-target="#addBrand">Add
												new brand</button>
										</div>

										<!-- supplier list  -->
										<div class="form-group">
											<label>Supplier*</label> <select class="form-control custom-select"
												name="supplier" required>
												<option value="" disabled selected hidden>Select
													Supplier</option>
												<%
												ArrayList<Suppliers> SupplierList = (ArrayList<Suppliers>) request.getAttribute("SupplierList");
												for (int i = 0; i < SupplierList.size(); ++i) {
												%>
												<option><%=SupplierList.get(i).getSupplierName()%>
												</option>
												<%
												}
												%>

											</select>
										</div>
									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<a href="/Megathlon/ProductList" class="btn btn-danger">Cancel</a>
										<button type="reset" class="btn btn-secondary">Reset</button>
										<button type="submit" class="btn btn-primary float-right" >Add</button>
									</div>
								</form>
							</div>
							<!-- inside modal -->

										<div class="modal fade" id="addBrand" tabindex="-1"
											aria-labelledby="addBrand" aria-hidden="true">
											<div class="modal-dialog">
												<form action="AddBrand" method="POST" id="brand">
													<div class="modal-content">
														<!-- Modal Header -->
														<div class="modal-header">
															<h4 class="modal-title">Add new brand</h4>
															<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
														</div>
														<!-- Modal body -->
														<div class="modal-body">
															<input type="text" id="inputField" name="BrandNew"
																class="form-control" placeholder="Add Brand here..." required>
														</div>
														
														<input type="hidden" id="productName" name="productName">
														<input type="hidden" id="description" name="description">
														<input type="hidden" id="price" name="price">
														<input type="hidden" id="quantity" name="quantity">
 
														<!-- Modal footer -->
														<div class="modal-footer">
															<!-- <button type="button" class="btn btn-secondary"

							<div class="modal fade" id="addBrand" tabindex="-1"
								aria-labelledby="addBrand" aria-hidden="true">
								<div class="modal-dialog">
									<form action="AddBrand" method="POST">
										<div class="modal-content">
											<!-- Modal Header -->
											<!-- <div class="modal-header">
												<h4 class="modal-title">Add new brand</h4>
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											Modal body
											<div class="modal-body">
												<input type="text" id="inputField" name="BrandNew"
													class="form-control" placeholder="Add Brand here...">
											</div> -->

											<!-- Modal footer -->
											<div class="modal-footer">
												<!-- <button type="button" class="btn btn-secondary"

																data-dismiss="modal">Close</button> -->
												<button type="submit" class="btn btn-primary" id="submitBtn">Add</button>
											</div>
										</div>
									</form>
								</div>
							</div>

							<!-- /.card -->
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
				<!--/.col (right) -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.2.0
			</div>
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">Megathlon</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	
	<script>
	// Function to copy data from product form to brand form
	function copyDataToBrandForm() {
	  // Get data from the product form
	  var productName_origin = document.getElementById("productName_origin").value;
	  var description_origin = document.getElementById("description_origin").value;
	  var price_origin = document.getElementById("price_origin").value;
	  var quantity_origin = document.getElementById("quantity_origin").value;

	  // Set data in the brand form
	  document.getElementById("productName").value = productName_origin;
	  document.getElementById("description").value = description_origin;
	  document.getElementById("price").value = price_origin;
	  document.getElementById("quantity").value = quantity_origin;
	}

	// Add an event listener to the "Add new brand" button to copy data when clicked
	document.getElementById("addBrand").addEventListener("click", function () {
	  copyDataToBrandForm();
	});

		
	</script>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<!-- <script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
 -->
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="js/jquery.overlayScrollbars.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
	<!-- Page specific script -->
	<script>
		$(function() {
			bsCustomFileInput.init();
		});
	</script>
</body>
</html>
