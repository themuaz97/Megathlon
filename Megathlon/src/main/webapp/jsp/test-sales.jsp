<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>

<%@page import="com.Megathlon.Beans.Product"%>
<%@page import="com.Megathlon.Beans.Stock"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Stocks</title>
<link rel="icon" type="image/x-icon" href="img/me fav.png">
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="css/adminlte.min.css">
<!-- daterange picker -->
<link rel="stylesheet" href="css/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <!-- Navbar -->
  <!-- /.navbar -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <%@include file="../inc/NavBar.jsp"%>	
    <!-- Content Header (Page header) -->
   <!--  <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6"></div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Blank Page</li>
            </ol>
          </div>
        </div>
      </div>
    </section> -->

    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      
      <div class="row">
        <div class="col-md-12">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Stock Transaction</h3>
            </div>
          </div>

          <form action="/Megathlon/stockDB" method="POST">
            <div class="p-3 mb-2 bg-white text-dark">
              <div class="card-body">
                <div class="form-group row">
                  <div class="col-6">
                    <label for="inputName">Date</label>
                    <input type="date" id="date" name="date" class="form-control">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-6">
                    <label>Status</label>
                    <select id="status" name="stockStatus" class="form-control custom-select">
                      <option value="0" selected disabled>Choose Status Type</option>
                      <option value="1">Stock Addition</option>
                      <option value="2">Stock Deduction</option>
                      <option value="3">Defect Item</option>
                    </select>
                  </div>
                  <div class="col-6">
                    <label>Product name</label>
                    <select id="productSelect" name="product" class="form-control custom-select">
                      <option value="1">Select Product Name</option>
                      <% ArrayList<Product> productlist = (ArrayList<Product>) request.getAttribute("productlist"); %>
                      <% for (Product p : productlist) { %>
                      <option value="<%=p.getProductName()%>" data-supplier="<%=p.getSupplier()%>" data-price="<%=p.getPrice()%>" data-quantity="<%=p.getQuantity()%>">
                        <%=p.getProductName()%>
                      </option>
                      <% } %>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label>Supplier</label>
                  <input type="text" id="supplier" name="supplier" class="form-control" value="" readonly>
                </div>
                <div class="form-group">
                  <label>Price</label>
                  <input type="text" id="price" name="price" class="form-control" value="" readonly>
                </div>
                <div class="form-group row">
                  <div class="col-6">
                    <label>Current Quantity</label>
                    <input type="number" id="quantity" name="quantity" value="" class="form-control" readonly>
                  </div>
                  <div class="col-6">
                    <label id="label-quantity">Quantity to Add(s):</label>
                    <input type="number" id="quantity_to_add" name="quantityChange" class="form-control" placeholder="Quantity to be add or deduct  e.g. 20">
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <div>
                      <input type="submit" id="submitbtn" value="Add New Transaction" class="btn btn-success float-right">
                      <script> 
            
            var stat = document.getElementById("status");
            var add = stat.options[stat.1].text;
            var qtydelta = document.getElementById("quantity_to_add");
            var qty = document.getElementById("quantity");
            var btn = document.getElementById("submitbtn");
            
            if(add == "Stock Addition"){
            	if(qtydelta < 0)
            		btn.disabled = true;
            	else
            		btn.disabled = false;
            }
            </script>
                    </div>
                    <div>
                      <input type="reset" value="Cancel" class="btn btn-primary float-left">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
          </form>

          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card card-primary">
                  <div class="card-header">
                    <h3 class="card-title">Stock Transaction List</h3>
                    <div class="card-tools">
                      <div class="input-group input-group-sm" style="width: 150px;">
                     	<input type="text" id="searchInput" placeholder="Search..."class="form-control float-right">	 
                        <div class="input-group-append">
                          <button type="submit" class="btn btn-default">
                            <i class="fas fa-search"></i>
                          </button>
                     
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0" style="height: 600px;">
                <div class="html_to_pdf">
                  <table id="dataTable" class="table table-hover table-head-fixed text-nowrap table-bordered">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Product Name</th>
                        <th>Supplier</th>
                        <th>Quantity Changed</th>
                        <th>Stock Quantity</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% ArrayList<Stock> stocklist = (ArrayList<Stock>) request.getAttribute("stocklist"); %>
                      <% for (int i = 0; i < stocklist.size(); i++) { %>
                        <% if (stocklist.get(i).getStockStatus().equals("1")) { %>
                          <tr class="table-success">
                            <td><%=stocklist.get(i).getStockID()%></td>
                            <td><%=stocklist.get(i).getDate()%></td>
                            <td>Stock Addition</td>
                            <td><%=stocklist.get(i).getProduct()%></td>
                            <td><%=stocklist.get(i).getSupplier()%></td>
                            <td><%=stocklist.get(i).getquantityChange()%></td>
                            <td><%=stocklist.get(i).getQuantity()%></td>
                          </tr>
                        <% } else if (stocklist.get(i).getStockStatus().equals("2")) { %>
                          <tr class="table-warning">
                            <td><%=stocklist.get(i).getStockID()%></td>
                            <td><%=stocklist.get(i).getDate()%></td>
                            <td>Stock Reduction</td>
                            <td><%=stocklist.get(i).getProduct()%></td>
                            <td><%=stocklist.get(i).getSupplier()%></td>
                            <td><%=stocklist.get(i).getquantityChange()%></td>
                            <td><%=stocklist.get(i).getQuantity()%></td>
                          </tr>
                        <% } else { %>
                          <tr class="table-danger">
                            <td><%=stocklist.get(i).getStockID()%></td>
                            <td><%=stocklist.get(i).getDate()%></td>
                            <td>Defect Product</td>
                            <td><%=stocklist.get(i).getProduct()%></td>
                            <td><%=stocklist.get(i).getSupplier()%></td>
                            <td><%=stocklist.get(i).getquantityChange()%></td>
                            <td><%=stocklist.get(i).getQuantity()%></td>
                          </tr>
                        <% } %>
                      <% } %>
                    </tbody>
                  </table>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.card-body -->
    <div class="card-footer">
   <button onClick="tableToExcel()" class="btn btn-secondary mx-3">Print as Excel</button> 
    </div>
    <!-- /.card-footer-->
  </div>
  <!-- /.card -->
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<footer class="main-footer">
  <div class="float-right d-none d-sm-block">
    <b>Version</b> 3.2.0
  </div>
  <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">Megathlon</a>.</strong> All rights reserved.
</footer>
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
  <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/52adbacfd8.js" crossorigin="anonymous"></script>
<script src="js/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
<!-- overlayScrollbars -->
<script src="/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-2ImtlRlf2VVmiGZsjm9bEyhjGW4dU7B6TNwh/hx/iSByxNENtj3WVE6o/9Lj4TJeVXPi4bnOIMXFIJJAeufa0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  $(function() {
    // Date picker
    $('#date').datetimepicker({
      format: 'L'
    });
    $(document).ready(function() {
      $('.js-example-basic-single').select2();
    });
  });
</script>
<script>
  document.getElementById("productSelect").addEventListener("change", function() {
    var productId = this.value;

    // Use AJAX to fetch data from the server
    // Example using jQuery:
    $.ajax({
      url: "ajaxhandler.jsp", // Replace with the actual URL to fetch data // tukar jgn guna sale jsp
      method: "GET",
      data: {
        productId: productId
      },
      success: function(data) {
        // Parse the JSON data returned from the server
        var productData = JSON.parse(data);

        // Populate the other input fields
        document.getElementById("supplier").value = productData.supplier;
        document.getElementById("price").value = productData.price;
        document.getElementById("quantity").value = productData.quantity;
      },
      error: function(error) {
        console.error("Error fetching product data: " + error);
      }
    });
  });
</script>
<script>
  // Get references to the select element and the supplier input element
  var productSelect = document.getElementById("productSelect");
  var supplierInput = document.getElementById("supplier");
  var priceInput = document.getElementById("price");
  var quantityInput = document.getElementById("quantity");

  // Add a change event listener to the select element
  productSelect.addEventListener("change", function() {
    // Get the selected option
    var selectedOption = productSelect.options[productSelect.selectedIndex];

    // Get the data-supplier attribute value from the selected option
    var supplier = selectedOption.getAttribute("data-supplier");
    var price = selectedOption.getAttribute("data-price");
    var quantity = selectedOption.getAttribute("data-quantity");

    // Update the value of the supplier input
    supplierInput.value = supplier;
    priceInput.value = price;
    quantityInput.value = quantity;
  });
</script>
<script>
  // Get references to the select element and the label element
  var statusSelect = document.getElementById("status");
  var label = document.getElementById("label-quantity");

  // Add a change event listener to the select element
  statusSelect.addEventListener("change", function() {
    // Get the selected option value
    var selectedValue = statusSelect.value;

    // Update the label based on the selected option
    if (selectedValue === "3") {
      label.textContent = "Defected Item(s):";
    } else if (selectedValue === "2") {
      label.textContent = "Quantity to Reduce(s):";
    } else {
      label.textContent = "Quantity to Add(s):";
    }
  });
</script>
<!-- SEARCH FUNCTION -->
<script>
        // JavaScript function to perform the search
        function searchTable() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("dataTable");
            tr = table.getElementsByTagName("tr");

            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td");
                for (var j = 0; j < td.length; j++) {
                    txtValue = td[j].textContent || td[j].innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break; // Break if at least one column matches
                    } else {
                        tr[i].style.display = "none"; // Hide the row if no match
                    }
                }
            }
        }

        // Attach the search function to the input element
        document.getElementById("searchInput").addEventListener("input", searchTable);
</script>
<!-- Table data to excel -->
<script>
	function tableToExcel(){
		var table2excel = new Table2Excel();
		table2excel.export(document.querySelectorAll("table.table"));
	}
</script>
<!-- Table to Excel -->
<script src="js/table2excel.js"></script>
</body>
</html>
