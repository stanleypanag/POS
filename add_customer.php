<?php
include('server/connection.php');

if (isset($_POST['submit'])) {
	$user 		= mysqli_real_escape_string($db, $_POST['user']);
	$fname 		= mysqli_real_escape_string($db, $_POST['fname']);
	$lname 		= mysqli_real_escape_string($db, $_POST['lname']);
	$address	= mysqli_real_escape_string($db, $_POST['address']);
	$number		= mysqli_real_escape_string($db, $_POST['number']);

	// Check if an image is uploaded
	if (!empty($_FILES['image']['name'])) {
		$image   	= $_FILES['image']['name'];
		$target   	= "images/" . basename($_FILES['image']['name']);
	} else {
		$image = NULL; // Set to NULL if no image is uploaded
	}

	$sql  = "INSERT INTO customer (firstname, lastname, address, contact_number, image) 
		         VALUES ('$fname', '$lname', '$address', '$number', '$image')";
	$result = mysqli_query($db, $sql);

	// Move uploaded file only if an image is provided
	if ($image && move_uploaded_file($_FILES['image']['tmp_name'], $target) || $result == true) {
		$query 	= "INSERT INTO logs (username, purpose, logs_time) 
			           VALUES ('$user', 'Customer $fname Added', CURRENT_TIMESTAMP)";
		$insert = mysqli_query($db, $query);
		header('location: employee_page.php?username=' . $user . '&added');
	} else {
		$msg = "Something went wrong!";
	}
}
