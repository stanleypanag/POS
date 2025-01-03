<?php
include("../server/connection.php");
include '../set.php';

$result = mysqli_query($db, "SELECT MAX(product_no) AS max_product_no FROM products");
$row = mysqli_fetch_assoc($result);
$next_product_no = $row['max_product_no'] + 1; // Increment by 1

if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST['add'])) {
    // Retrieve and sanitize form inputs
    $product_no = mysqli_real_escape_string($db, $_POST['product_no']);
    $product_name = mysqli_real_escape_string($db, $_POST['product_name']);
    $price = mysqli_real_escape_string($db, $_POST['price']);
    $qty = mysqli_real_escape_string($db, $_POST['qty']);
    $unit = mysqli_real_escape_string($db, $_POST['unit']);
    $min_stocks = mysqli_real_escape_string($db, $_POST['min_stocks']);
    $remarks = mysqli_real_escape_string($db, $_POST['remarks']);
    $location = mysqli_real_escape_string($db, $_POST['location']);

    // Handle file upload
    $image_path = "";
    if (!empty($_FILES['images']['name'])) {
        $target_dir = "../uploads/"; // directory to save the uploaded image
        $image_path = $target_dir . basename($_FILES['images']['name']);

        // Move the uploaded file to the server's file system
        if (!move_uploaded_file($_FILES['images']['tmp_name'], $image_path)) {
            $msg = "Failed to upload image.";
        }
    }

    // Insert into the database
    $sql = "INSERT INTO products (product_no, product_name, sell_price, quantity, unit, min_stocks, remarks, location, images) 
                VALUES ('$product_no', '$product_name', '$price', '$qty', '$unit', '$min_stocks', '$remarks', '$location', '$image_path')";

    if (mysqli_query($db, $sql)) {
        $msg = "Product added successfully!";
    } else {
        $msg = "Error: " . mysqli_error($db);
    }
}
?>
<!DOCTYPE html>
<html>

<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <?php include('../templates/head1.php'); ?>
</head>

<body>
    <div class="contain h-100">
        <?php include('../products/base.php'); ?>
        <div class="main">
            <div class="side">
                <h1 class="ml-4">Add New Product</h1>
                <hr>
            </div>
            <div class="first_side ml-5 mt-5 mr-3">
                <div style="border:1px dashed black; width: 250px;height: 250px;">
                    <img id="imagePreview" class="img-fluid p-2 h-100 w-100"
                        src="<?php echo !empty($image_path) ? $image_path : '../images/default.png'; ?>"
                        alt="Product Image Placeholder">
                </div>
                <form method="post" enctype="multipart/form-data" action="">
                    <input type="hidden" name="size" value="1000000">
            </div>
            <div class="second_side table-responsive">
                <p class="bg-success w-50"> <?php echo $msg; ?> </p>
                <table class="mt-5">
                    <tbody>
                        <tr>
                            <td valign="baseline">Product No:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div>
                                    <input type="text" name="product_no" class="form-control-sm form-control" value="<?php echo $next_product_no; ?>" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Name:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="text" name="product_name" class="form-control-sm form-control" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Sell Price:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="number" name="price" step="0.01" class="form-control form-control-sm" required>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Quantity:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="number" name="qty" class="form-control-sm form-control" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Unit:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="text" name="unit" class="form-control-sm form-control" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Minimum stocks:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="number" name="min_stocks" class="form-control-sm form-control" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Remarks:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="text" name="remarks" class="form-control-sm form-control">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td valign="baseline">Location:</td>
                            <td class="pl-5 pb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1"><i class="fas fa-pen-alt"></i></span></div><input type="text" name="location" class="form-control-sm form-control" required>
                                </div>
                            </td>
                        </tr>

                    </tbody>
                </table>
                <div>
                    <td>Upload Photo (OPTIONAL):</td>
                    <input type="file" name="images" id="images" accept="image/*" class="form-control-sm">
                </div>
                <div class="text-left mt-3">
                    <button type="submit" name="add" class="btn btn-secondary"><i class="fas fa-thumbs-up"></i> Add Product</button>
                    <button type="button" class="btn btn-danger" onclick="window.location.href='../products/products.php'"><i class="fas fa-ban"></i> Cancel</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    <script src="../bootstrap4/jquery/jquery.min.js"></script>
    <script src="../bootstrap4/js/bootstrap.bundle.min.js"></script>
    <script>
        $(function() {
            $('[data-toggle="popover"]').popover()
        })
    </script>

    <script>
        // Show image preview when a file is selected
        $('#images').change(function() {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#imagePreview').attr('src', e.target.result); // Update the image preview immediately
            };
            reader.readAsDataURL(this.files[0]);
        });

        // AJAX form submission for image upload
        $('#imageUploadForm').submit(function(e) {
            e.preventDefault(); // Prevent normal form submission

            var formData = new FormData(this);

            $.ajax({
                url: 'upload_image.php', // Create a PHP file that will handle the upload
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    // Update the image preview with the uploaded image path returned by the server
                    $('#imagePreview').attr('src', response.image_path);
                },
                error: function() {
                    alert('Error uploading image.');
                }
            });
        });
    </script>
</body>

</html>