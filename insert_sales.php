<?php
include 'server/connection.php';

if (isset($_POST['product'])) {
	$user = mysqli_real_escape_string($db, $_SESSION['username']);
	$discount = floatval($_POST['discount']);
	$total = floatval($_POST['totalvalue']);
	$product = $_POST['product'];
	$customer = mysqli_real_escape_string($db, $_POST['customer']);
	$price = $_POST['price'];
	$quantity = $_POST['quantity'];
	$reciept = [];

	// Validate input arrays
	if (count($product) !== count($price) || count($product) !== count($quantity)) {
		echo "failure";
		exit;
	}

	// Get customer ID
	$customer_id_query = "SELECT customer_id FROM customer WHERE CONCAT(firstname, ' ', lastname) LIKE '$customer'";
	$customer_id_result = mysqli_query($db, $customer_id_query);

	if (!$customer_id_result || mysqli_num_rows($customer_id_result) == 0) {
		echo "failure";
		exit;
	}

	$cust_id_row = mysqli_fetch_array($customer_id_result);
	$cust_id_new = $cust_id_row['customer_id'];

	// Insert into sales table
	$sales_query = "INSERT INTO sales (customer_id, username, discount, total) VALUES ('$cust_id_new', '$user', $discount, $total)";
	$sales_result = mysqli_query($db, $sales_query);

	if ($sales_result) {
		// Get the receipt number of the last inserted sale
		$reciept_no = mysqli_insert_id($db);

		$query = "";
		for ($i = 0; $i < count($product); $i++) {
			$product_clean = mysqli_real_escape_string($db, $product[$i]);
			$price_clean = floatval($price[$i]);
			$quantity_clean = intval($quantity[$i]);

			// Update product quantity in products table
			$quantity_query = "SELECT quantity FROM products WHERE product_no = '$product_clean'";
			$quantity_result = mysqli_query($db, $quantity_query);

			if ($quantity_result) {
				$quantity_row = mysqli_fetch_array($quantity_result);
				$new_quantity = $quantity_row['quantity'] - $quantity_clean;

				$update_query = "UPDATE products SET quantity = $new_quantity WHERE product_no = '$product_clean'";
				mysqli_query($db, $update_query);
			}

			// Add product sale to sales_product table
			$query .= "INSERT INTO sales_product (reciept_no, product_id, price, qty) 
                       VALUES ('$reciept_no', '$product_clean', $price_clean, $quantity_clean);";
		}

		// Insert into logs table
		$log_query = "INSERT INTO logs (username, purpose) VALUES ('$user', 'Product sold')";
		mysqli_query($db, $log_query);

		// Execute batch insert for sales_product
		if (mysqli_multi_query($db, $query)) {
			echo "success";
			// Redirect to employee_page if successful
		} else {
			echo "failure";
		}
	} else {
		echo "failure";
	}
}
