<%@page import="java.util.ArrayList"%>

<%@page import="com.Megathlon.Beans.Product"%>
<%@page import="com.Megathlon.Beans.Brand"%>
<%@page import="com.Megathlon.Beans.Suppliers"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini layout-fixed">
		
						
	<div class="wrapper">

		<%@include file="../inc/NavBar.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Products</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/Megathlon/Homepage">Home</a></li>
								<li class="breadcrumb-item active">Products</li>
							</ol>
						</div>
					</div>
					<div class="row mb-2 justify-content-end">
						<div class="col-sm-6 m">
							<a href="/Megathlon/CreateProduct"
								class="btn btn-primary float-right">Add Product</a>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->


			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->
							<div class="card card-primary">
							
								<div class="card-header">
									<div class="d-flex justify-content-between">
										<h3 class="card-title my-auto">Products</h3>
										<div class="row d-flex justify-content-end">
											<div class="input-group input-group-sm col-12" >
						                     	<input type="text" id="searchInput" placeholder="Search..."class="form-control float-right" onchange="searchTable()">	 
						                        <div class="input-group-append">
						                          <button onclick="searchTable()" class="btn btn-default">
						                            <i class="fas fa-search"></i>
						                          </button>
						                        </div>
						                     </div>
										</div>
									</div>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<div>
									<table class="table" id="dataTable">
										<thead class="thead-light">
											<tr>
												<th scope="col" style="width: fit-content">No</th>
												<th scope="col">Product Name</th>
												<th scope="col">Description</th>
												<th scope="col">Price</th>
												<th scope="col">Quantity</th>
												<th scope="col">Brand</th>
												<th scope="col">Supplier</th>
												<th scope="col" style="width: fit-content">Action</th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<Product> ProductList = (ArrayList<Product>) request.getAttribute("ProductList");

											for (int i = 0; i < ProductList.size(); ++i) {
											%>

											<tr>
												<th scope="row"><%=i + 1%>.</th>
												<td><%=ProductList.get(i).getProductName()%></td>
												<td><%=ProductList.get(i).getDescription()%></td>
												<td><%=ProductList.get(i).getPrice()%></td>
												<td><%=ProductList.get(i).getQuantity()%></td>
												<td><%=ProductList.get(i).getBrand()%></td>
												<td><%=ProductList.get(i).getSupplier()%></td>
												<td><a

													href="/Megathlon/ProductEdit?productID=<%=ProductList.get(i).getProductID()%>&brandName=<%=ProductList.get(i).getBrand()%>&supplierName=<%=ProductList.get(i).getSupplier()%>"

													href="/Megathlon/ProductEdit?productID=<%=ProductList.get(i).getProductID()%>"

													class="btn btn-primary btn-lg btn-block btn-sm m-1">Edit</a>
													<form method="POST" action="/Megathlon/ProductList">
														<input type="hidden" name="productID"
															value="<%=ProductList.get(i).getProductID()%>">
														<button type="submit"
															class="btn btn-danger btn-lg btn-block btn-sm m-1">Delete</button>
													</form></td>
											</tr>

											<%
											}
											%>
										</tbody>
									</table>
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
			 <div class="card-footer">
   <button onClick="tableToExcel()" class="btn btn-secondary mx-3">Print as Excel</button> 
    </div>
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

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<!-- <script src="js/bs-custom-file-input.min.js"></script> -->
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	<!-- Print table as excel js  -->
	<script src="js/table2excel.js"></script>
	<!-- Page specific script -->
	<script>
	function searchTable() {
		  var input, filter, table, tr, td, i, j, txtValue;
		  input = document.getElementById('searchInput');
		  filter = input.value.toLowerCase();
		  table = document.getElementById('dataTable');
		  tr = table.getElementsByTagName('tr');

		  for (i = 1; i < tr.length; i++) { // Start from 1 to skip the header row
		    td = tr[i].getElementsByTagName('td');
		    let found = false;
		    for (j = 0; j < td.length; j++) {
		      if (td[j]) {
		        txtValue = td[j].textContent || td[j].innerText;
		        if (txtValue.toLowerCase().indexOf(filter) > -1) {
		          found = true;
		          break;
		        }
		      }
		    }
		    tr[i].style.display = found ? '' : 'none';
		  }
		}

	</script>
<script>
	function tableToExcel(){
		var table2excel = new Table2Excel();
		table2excel.export(document.querySelectorAll("table.table"));
	}
</script>
	
	
</body>

</html>