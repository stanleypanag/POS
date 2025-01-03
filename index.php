<?php include('server/connection.php'); ?>
<?php include('login.php'); ?>
<!DOCTYPE html>
<html>

<head>
	<?php include('templates/head.php'); ?>
	<script src="bootstrap4/jquery/sweetalert.min.js"></script>
</head>

<body style="background-color: #8D0B41;">
	<div class="text-center border border-0">
		<div class="main">
			<img class="img-fluid" src="images/mainLogo.png" />
			<?php include('error.php'); ?>
		</div>

		<h8 style="font-style: italic; font-weight: 500; color: white;">Login as:</h8>

		<div class="mt-3">
			<div class="d-inline">
				<button type="button" id="admin" class="btn-lg btn-dark" data-toggle="modal" data-target=".bd-example-modal-sm"><i class="fas fa-user-tie"></i> Administrator</button>
			</div>
			<div class="d-inline">
				<button type="button" id="user" class="btn-lg btn-dark" data-toggle="modal" data-target="#modal-user"><i class="fas fa-user"></i> Counter</button>
			</div>
		</div>
	</div>
	<script src="bootstrap4/jquery/jquery.min.js"></script>
	<script src="bootstrap4/js/bootstrap.bundle.min.js"></script>
	<?php include('modals/admin_login_modal.php'); ?>
	<?php include('modals/employee_login_modal.php'); ?>
</body>

</html>