<div class="header d-flex" style="background-color:rgb(112, 13, 54);">
	<img class="img-fluid w-20 mt-2 ml-3" src="../images/mainLogo.png">
</div>
<div class="sidebar" style="background-color: #8D0B41;">
	<button style="background-color: #8D0B41;" class="text-white border border-0">
		<h3><i class="fas fa-tachometer-alt"></i> Dashboard</h3>
	</button>
	<button style="background-color: #8D0B41;" class="text-white border border-0" id="sidebar_button" onclick="window.location.href='../customer/customer.php'"><i class="fas fa-list-ul"></i> Customer List</button>
	<button style="background-color: #8D0B41;" class="text-white border border-0" id="sidebar_button" onclick="window.location.href='../customer/add_customer.php'"><i class="fas fa-user-plus"></i> Add Customer</button>
	<button style="background-color: #8D0B41;" class="text-white border border-0" id="sidebar_button" type="button" data-toggle="popover" title="Customer Management" data-content="Here you can create, update, delete and view customer profiles." data-placement="bottom"><i class="fas fa-question"></i> Help</button>
	<div class="fixed-bottom">
		<button class="btn m-2 p-2" id="sidebar_button" onclick="window.location.href='../main.php'"><i class="fas fa-arrow-alt-circle-left"></i> Back</button>
	</div>
</div>