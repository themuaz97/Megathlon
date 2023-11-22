<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login IMS</title>

<script src="https://kit.fontawesome.com/52adbacfd8.js" crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">	 -->
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<!--  <link rel="stylesheet" href="../css/all.min.css"> -->
<!-- icheck bootstrap -->
<link rel="stylesheet" href="../css/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../css/adminlte.min.css">
<!-- custom js for hide password and password match  -->
<script src="../js/accountsFx.js"></script>
<style>
body {
  background-image: url('../img/bg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
</head>
<body class="hold-transition login-page">
<img src="../img/Megathlon logo.png" alt="megathlon logo"
		style="padding-bottom: 20px;">
	<div class="login-box">
		<!-- /.login-logo -->
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<a href="../../index2.html" class="h1"><b>Megathlon</b>IMS</a>
			</div>
			<div class="card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form action="/Megathlon/Login" method="post">
					<div class="input-group mb-3">
						<input type="text" name="email" class="form-control"
							placeholder="Email" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" id="pass" name="password" class="form-control"
							placeholder="Password" required>
						<div class="input-group-append">
							<span class=" input-group-text" onclick="password_show_hide_Login();">
									<i class="fa-solid fa-eye" id="show_eye"></i> <i
									class="fa-solid fa-eye-slash d-none" id="hide_eye"></i>
								</span>	
								<div class="input-group-addon">
							</div>			
						</div>
					</div>
					<div class="row">
						<!--  <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                Remember Me
              </label>
            </div>
          </div> -->
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Sign
								In</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

				<!--  <div class="social-auth-links text-center mt-2 mb-3">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div> -->
				<!-- /.social-auth-links -->

				
				<p class="mb-0">
					<a href="../jsp/Register.jsp" class="text-center">Register a new membership</a>
				</p>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.login-box -->

	<script
		src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>
	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../js/adminlte.min.js"></script>
</body>
</html>
