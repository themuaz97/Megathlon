<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>
<meta charset="UTF-8">
<title>User Profile | Megathlon</title>
</head>
<body class="hold-transition sidebar-mini layout-fixed">




	<!-- Wrapper for page  -->
	<div class="wrapper">
	
		
		<%@include file="../inc/NavBar.jsp"%>

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Profile</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/Megathlon/Homepage">Home</a></li>
								<li class="breadcrumb-item active">User Profile</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<section class="content">
				<div class="container-fluid">
					<!-- <div class="card">
						<div class="card-header">
							<h3 class="card-title">Default Card Example</h3>
							<div class="card-tools">
								Buttons, labels, and many other things can be placed here!
								Here is a label for example
								<span class="fa-solid  fa-user"></span>
							</div>
							/.card-tools
						</div>
						/.card-header
						<div class="card-body">The body of the card</div>
						/.card-body
						<div class="card-footer">The footer of the card</div>
						/.card-footer
					</div>
					/.card -->
					<!-- Profile Image -->
					<form action="/Megathlon/UserProfile" method="get">

						<%
						String name = (String) session.getAttribute("name");
						
						String email = (String) session.getAttribute("email");
						
						String admin = (String) session.getAttribute("role");
						
						String StaffID = "M";
						
						String role = "staff";
						
						if (admin.equals("1150"))
							role = "Admin";
						else
							role = "Staff";
						%>
						<div class="card card-primary card-outline">
							<div class="container-fluid">
								<div class="row">
									<div class="card-body box-profile col-md-2">
										<div class="text-center">
											<i class="fa-solid fa-user fa-5x"></i>
										</div>

										<h3 class="profile-username text-center">
											<%
											out.println(name);
											%>
										</h3>

										<p class="text-muted text-center">
											<%
											out.println(role);
											%>
										</p>
									</div>

									<!-- /.card-body -->
									<div class="card-body box-profile col-md-9">
										<div class="col-sm-6">
											<div class="form-group">
												<label>Name</label> <input type="text" class="form-control"
													placeholder=<%out.println(name);%> disabled>
											</div>
											<div class="form-group">
												<label for="exampleInputEmail1">Email address</label> <input
													type="email" class="form-control" id="exampleInputEmail1"
													placeholder=<%out.println(email);%> disabled>
											</div>
										</div>
										<!-- <ul class="list-group list-group-unbordered mb-3">
									<li class="list-group-item"><b>Followers</b> <a
										class="float-right">1,322</a></li>
									<li class="list-group-item"><b>Following</b> <a
										class="float-right">543</a></li>
									<li class="list-group-item"><b>Friends</b> <a
										class="float-right">13,287</a></li>
								</ul> -->

										<!-- <a href="#" class="btn btn-primary "><b>Edit</b></a> -->
										<<!-- a href="#" class="btn btn-primary float-right "><b>Update</b></a> -->

									</div>
								</div>
							</div>
							<!-- /.card -->
						</div>
					</form>
				</div>
			</section>
		</div>


	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="js/adminlte.min.js"></script>
</body>
</html>

