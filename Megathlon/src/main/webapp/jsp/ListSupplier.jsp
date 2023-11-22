<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.Megathlon.Beans.Suppliers"%>
<%@page import="com.Megathlon.Beans.Account"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Megahtlon IMS</title>
<link rel="icon" type="image/x-icon" href="img/me fav.png">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="css/all.min.css"> -->
<!-- overlayScrollbars -->
<link rel="stylesheet" href="css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Site wrapper -->
	<div class="wrapper">
		<%@include file="../inc/NavBar.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Supplier</h1>
						</div>
					</div>
					<div class="row mb-2 justify-content-end">
						<div class="col-sm-6 m">
							<button type="button" class="btn btn-primary mt-3 float-right"
								data-toggle="modal" data-target="#addsupplier">Add
								Supplier</button>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<!-- left column -->
						<div class="col-md-12">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header ">
									<div class="d-flex justify-content-between">
										<h3 class="card-title my-auto">Supplier</h3>
										<div class="row d-flex justify-content-end">
											<div class="input-group input-group-sm col-12">
												<input type="text" id="searchInput" placeholder="Search..."
													class="form-control float-right" onchange="searchTable()">
												<div class="input-group-append">
													<button onclick="searchTable()" class="btn btn-default">
														<i class="fas fa-search"></i>
													</button>
													
												</div>
											</div>
										</div>
									</div>


								</div>

								<div>
									<table class="table" id="dataTable">
										<thead class="thead-light">
											<tr>
												<th scope="col" style="width: fit-content">No</th>
												<th scope="col">Name</th>
												<th scope="col">Email</th>
												<th scope="col">Contact</th>
												<th scope="col">Location</th>
												<th scope="col" style="width: fit-content">Action</th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<Suppliers> supplierlist = (ArrayList<Suppliers>) request.getAttribute("supplierlist");

											for (int i = 0; i < supplierlist.size(); ++i) {
											%>

											<tr>
												<th scope="row"><%=i + 1%>.</th>
												<td><%=supplierlist.get(i).getSupplierName()%></td>
												<td><%=supplierlist.get(i).getSupplierEmail()%></td>
												<td><%=supplierlist.get(i).getSupplierContact()%></td>
												<td><%=supplierlist.get(i).getSupplierLocation()%></td>
												<td>
													<!-- Edit Button -->
													<button type="button"
														class="btn btn-primary btn-lg btn-block btn-sm"
														data-toggle="modal" data-target="#editsupplier<%=i%>">Edit</button>
													<a
													href="/Megathlon/ManageSupplierList?supplierID=<%=supplierlist.get(i).getSupplierID()%>"
													class="btn btn-danger btn-lg btn-block btn-sm">Delete</a> <!-- Edit Modal -->
													<div class="modal fade" id="editsupplier<%=i%>"
														tabindex="-1" aria-labelledby="exampleModalLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header bg-primary">
																	<h5 class="modal-title" id="exampleModalLabel">Supplier
																		Form</h5>
																</div>
																<div class="modal-body">
																	<form action="/Megathlon/ManageSupplierList"
																		method="post" class="mx-5 text-dark">
																		<div class="card-body pb-0">
																			<input type="hidden" name="supplierID"
																				value="<%=supplierlist.get(i).getSupplierID()%>">
																			<div class="form-group">
																				<label for="exampleSupplierFirstName">Supplier
																					Name</label> <input type="text" class="form-control"
																					name="supplierName"
																					value="<%=supplierlist.get(i).getSupplierName()%>"
																					id="exampleInputFirstName" placeholder="First Name">
																			</div>
																			<div class="form-group">
																				<label for="exampleSupplierFirstName">Supplier
																					Email</label> <input type="text" class="form-control"
																					name="supplierEmail"
																					value="<%=supplierlist.get(i).getSupplierEmail()%>"
																					id="exampleInputEmail" placeholder="Email">
																			</div>
																			<div class="form-group">
																				<label for="exampleInputSupplier">Contact
																					Number</label> <input type="text" class="form-control"
																					name="supplierContact"
																					value="<%=supplierlist.get(i).getSupplierContact()%>"
																					id="exampleInputEmail1"
																					placeholder="Contact Number 5-10 numbers">
																			</div>
																			<div class="form-group">
																				<label for="exampleTextLocation">Location</label> <input
																					type="text" class="form-control"
																					name="supplierLocation"
																					value="<%=supplierlist.get(i).getSupplierLocation()%>"
																					id="exampleInputAddress1" placeholder="Location">
																			</div>
																		</div>
																		<!-- /.card-body -->
																		<div class="card-footer bg-white  ">
																			<div class="d-flex justify-content-between">
																				<div>
																					<button type="button" class="btn btn-danger"
																						data-dismiss="modal">Close</button>
																				</div>
																				<div>
																					<button type="submit" class="btn btn-primary">Edit</button>
																				</div>
																			</div>
																		</div>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</td>
											</tr>

											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			    <div class="card-footer">
   <button onClick="tableToExcel()" class="btn btn-secondary mx-3">Print as Excel</button> 
    </div>
		</div>
		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>

		<div class="modal fade" id="addsupplier" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header bg-primary">
						<h5 class="modal-title" id="exampleModalLabel">Supplier Form</h5>
					</div>
					<div class="modal-body">
						<form action="/Megathlon/Supplier" method="post"
							class="mx-5 text-dark">
							<div class="card-body pb-0">
								<div class="form-group">
									<label for="exampleSupplierFirstName">Supplier Name</label> <input
										type="text" class="form-control" name="supplierName"
										id="exampleInputFirstName" placeholder="First Name">
								</div>
								<div class="form-group">
									<label for="exampleSupplierEmail">Supplier Email</label> <input
										type="text" class="form-control" name="supplierEmail"
										id="exampleInputEmail" placeholder="Email">
								</div>
								<div class="form-group">
									<label for="exampleInputSupplier">Contact Number</label> <input
										type="text" class="form-control" name="supplierContact"
										id="exampleInputContact"
										placeholder="Contact Number 5-10 numbers" pattern="[0-9]{10}">
								</div>
								<div class="form-group">
									<label for="exampleTextLocation">Location</label> <input
										type="text" class="form-control" name="supplierLocation"
										id="exampleInputAddress1" placeholder="Location">
								</div>
							</div>
							<!-- /.card-body -->
							<div class="card-footer bg-white  ">
								<div class="d-flex justify-content-between">
									<div>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
									<div>
										<button type="reset" class="btn btn-secondary">Reset</button>
										<button type="submit" class="btn btn-primary">Submit</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
	
	<!-- Function for searching through the table  -->
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
	<!-- Table to Excel -->
	<script src="js/table2excel.js"></script>
	<script>
	function tableToExcel(){
		var table2excel = new Table2Excel();
		table2excel.export(document.querySelectorAll("table.table"));
	}
</script>

</body>

</html>