<%@page import="com.Megathlon.Beans.Account"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Megathlon IMS</title>
<link rel="icon" type="image/x-icon" href="img/me fav.png">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="css/all.min.css"> -->
<!-- overlayScrollbars -->
<link rel="stylesheet" href="../css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Site wrapper -->
	<div class="wrapper">

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<p class="brand-text font-weight-light"></p>
			<!-- Left navbar links -->
			<!-- <ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="jsp/homepage.jsp" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>
 -->
			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				



				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					 href="/Megathlon/Logout" role="button"> <i class="fa-solid fa-right-from-bracket"></i>
				</a></li>

			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="#" class="brand-link"> <img src="img/Megathlon logo.png"
				alt="Megathlon Logo" class="brand-image image-rectangle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">IMS</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="img/user.jpg" class="img-circle elevation-2"
							alt="User Image">
					</div>
					<div class="info">
						<a href="jsp/UserProfile.jsp" class="d-block">User</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="/Megathlon/Homepage"
							class="nav-link"> <i class="fa-solid fa-house"></i>
								<p>Home</p>
						</a></li>
						<li class="nav-item"><a href="/Megathlon/SupplierList"
							class="nav-link"> <i class="fa-solid fa-truck"></i>
								<p>Supplier</p>
						</a></li>
						<li class="nav-item"><a href="/Megathlon/ProductList"
							class="nav-link"> <i
								class="fa-solid fa-table-tennis-paddle-ball"></i>
								<p>Product</p>
						</a></li>
						<li class="nav-item"><a href="/Megathlon/stockDB"
							class="nav-link"><i class="fa-solid fa-warehouse"></i>
								<p>Stocks</p> </a></li>

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="../js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../js/demo.js"></script>
</body>
</html>
