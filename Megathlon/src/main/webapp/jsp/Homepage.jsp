<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Megathlon IMS</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="css/all.min.css">
  <link rel="stylesheet" href="css/fontawesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/adminlte.min.css">

  
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<%
	int productRow = (int)request.getAttribute("productRow");
	int brandRow = (int)request.getAttribute("brandRow");
	int supplierRow = (int)request.getAttribute("supplierRow");
	int highestProduct =(int)request.getAttribute("highestProduct");
	int defectProduct = (int)request.getAttribute("defectProduct");
	int lowProduct = (int)request.getAttribute("lowProduct");
	int stockIn = (int)request.getAttribute("stockIn");
	int stockOut = (int)request.getAttribute("stockOut");
	String highestProductName =(String)request.getAttribute("highestProductName");
%>
<!-- Site wrapper -->
<div class="wrapper">
<%@include file="../inc/NavBar.jsp"%>
  <!-- Navbar -->
  <!-- <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    Left navbar links
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>

    Right navbar links
    <ul class="navbar-nav ml-auto">
      Navbar Search
      <li class="nav-item">
      </li>

      Messages Dropdown Menu
      Notifications Dropdown Menu
      <li class="nav-item">
        </a>
      </li>
      <li class="nav-item">
      </li>
    </ul>
  </nav> -->
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Megathlon Inventory Management System</h1>
          </div>
          <!-- <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Homepage</li>
            </ol>
          </div> -->
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Homepage</h3>
          </div>
        <div class="card-body">
          <section class="content">
          <div class ="container-fluid">
          <!-- Small Box (Stat card) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-primary">
              <div class="inner">
                <h3 style="font-size: 50px"><%= productRow %><sup style="font-size: 20px"> </sup></h3>
                <p> Product Registered</p>
              </div>
              <div class="icon">
                <i class="fas fa-shopping-cart"></i>
              </div>
              <a href="/Megathlon/ProductList" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3 style="font-size: 50px"><%= highestProduct %><sup style="font-size: 20px"> <%= highestProductName %></sup></h3>
                <p> Highest stock</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="/Megathlon/stockDB"class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-danger ">
              <div class="inner">
                <h3 style="font-size: 50px"><%=lowProduct %></h3>
                <p>Product Low Stock</p>
              </div>
              <div class="icon">
             <i class="fa-solid fa-triangle-exclamation "></i>
              </div>
              <a href="/Megathlon/stockDB" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-secondary">
              <div class="inner">
                <h3 style="font-size: 50px"><%=defectProduct %><sup style="font-size: 20px"> </sup></h3>
                <p> Defected product</p>
              </div>
              <div class="icon">
                <i class="fa-solid fa-xmark"></i>
              </div>
              <a href="/Megathlon/stockDB"class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-12">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 style="font-size: 50px"><%=supplierRow %><sup style="font-size: 20px"></sup></h3>
                <p>Total Supplier</p>
              </div>
              <div class="icon">
                <i class="fa-solid fa-parachute-box"></i>
              </div>
              <a href="/Megathlon/SupplierList"class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 style="font-size: 50px"><%=brandRow %></h3>
                <p>Total Brand</p>
              </div>
              <div class="icon">
                <i class="fa-solid fa-box"></i>
              </div>
              <a href="/Megathlon/ProductList" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-12">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 style="font-size: 50px"><%=stockIn %><sup style="font-size: 20px"></sup></h3>
                <p>Stock In</p>
              </div>
              <div class="icon">
                <i class="fa-solid fa-arrow-up-wide-short"></i>
              </div>
              <a href="/Megathlon/stockDB" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-12">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 style="font-size: 50px"><%=stockOut %><sup style="font-size: 20px"></sup></h3>
                <p>Stock Out</p>
              </div>
              <div class="icon">
                <i class="fa-solid fa-arrow-down-wide-short"></i>
              </div>
              <a href="/Megathlon/stockDB" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          
        </div>
        <!-- /.row -->
          </div>
         </section>
        </div>
        
        <!-- /.card-body -->
        <div class="card-footer">
         
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->
	</div>
	
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    
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
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>

</body>
</html>
