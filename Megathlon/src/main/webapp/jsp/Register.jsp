<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register IMS</title>
<script src="https://kit.fontawesome.com/52adbacfd8.js"
	crossorigin="anonymous"></script>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="../jsp/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="../jsp/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../css/adminlte.min.css">
<!--JavaScript for custom fx for Accounts  -->
<script src="../js/accountsFx.js"></script>
<link
	href="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.31/dist/sweetalert2.min.css
"
	rel="stylesheet">
	
	<style>
body {
  background-image: url('../img/bg.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
}
</style>
</head>

<body class="hold-transition register-page">
	<!-- onload = "mustHaveInput()" -->

	<img src="../img/Megathlon logo.png" alt="megathlon logo"
		style="padding-bottom: 20px;">
	<div class="register-box">
		<div class="card card-outline card-primary">
			<div class="card-header text-center">
				<h1>
					<b>Megathlon</b>IMS
				</h1>
			</div>
			<div class="card-body">
				<p class="login-box-msg">Register a new membership</p>

				<form action="/Megathlon/Register" method="post">
					<!--Name field  -->
					<div class="input-group mb-3">
						<input type="text" id="name" name="name" class="form-control"
							placeholder="Full name" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<!--email field  -->
					<div class="input-group mb-3">
						<input type="email" id="email" name="email" class="form-control"
							placeholder="Email" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
							</div>
						</div>
					</div>
					<!--Password field  -->
					<div class="input-group mb-3">
						<input type="password" id="pass" name="password"
							class="form-control" placeholder="Password"
							onkeyup='matchPassword();' required />
						<div class="input-group-append">
							<span class=" input-group-text" onclick="password_show_hide();">
								<i class="fa-solid fa-eye" id="show_eye"></i> <i
								class="fa-solid fa-eye-slash d-none" id="hide_eye"></i>
							</span>
							<div class="input-group-addon"></div>
						</div>
					</div>
					<!--Retype password field  -->
					<div class="input-group mb-3">
						<input type="password" id="pass2" name="pass2"
							class="form-control" placeholder="Retype password"
							onkeyup='matchPassword();' required />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>

					</div>
					<div class="brand-text font-weight-light" id='message'
						style="padding-bottom: 5px"></div>
					<!--Admin password  -->
					<div class="input-group mb-3">
						<input type="text" id="adminpin" name="adminpin"
							class="form-control" placeholder="Admin Pin">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fa-solid fa-user-tie"></span>
							</div>
						</div>
					</div>

					<!-- <div class="form-group">
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" id="profilepix">
                        <label class="custom-file-label" for="profilepix">Choose file</label>
                      </div>
                      <div class="input-group-append">
                        <span class="input-group-text">Upload</span>
                      </div>
                    </div>
                  </div> -->

					<div class="row">
						<!-- <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
               I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div> -->
						<!-- /.col -->
						<div class="col-4">
						<!-- <p class = swalDefaultSuccess></p> -->
							<button type="submit" id="submitbtn" name="submitbtn"
								class="btn btn-primary btn-block">Register</button>
								
								
						</div>
						<!-- /.col -->
					</div>
				</form>

				<!-- <div class="social-auth-links text-center">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Sign up using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Sign up using Google+
        </a>
      </div> -->

				<a href="../jsp/Login.jsp" class="text-center">I already have a
					membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->

	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../js/adminlte.min.js"></script>
	<script
		src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.7.31/dist/sweetalert2.all.min.js
"></script>
	<script>
		/* let state = document.getElementById("submitbtn").className;
		if(state == "btn btn-primary btn-block swalDefaultSuccess")
			document.getElementById("submitbtn").className = "btn btn-primary btn-block swalDefaultError"); */
			
	 
		$(function() {
			var Toast = Swal.mixin({
				toast : true,
				position : 'top',
				showConfirmButton : false,
				timer : 2000
			});
			
			$('.swalDefaultSuccess').click(function() {
			      Toast.fire({
			        icon: 'success',
			        title: 'Account Registered.'
			      })
			    });
			
			$('.swalDefaultError').click(function() {
			      Toast.fire({
			        icon: 'error',
			        title: 'Account already registered'
			      })
			    });
		});
	</script>
</body>
</html>
