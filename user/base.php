<div class="header d-flex" style="background-color:rgb(112, 13, 54);">
	<img class="img-fluid w-20 mt-2 ml-3" src="../images/mainLogo.png">
</div>
<div class="sidebar" style="background-color: #8D0B41;">
	<button class="border border-0" style="background-color: #8D0B41;">
		<h3 class="text-white"><i class="fas fa-tachometer-alt text-white"></i> Dashboard</h3>
	</button>
	<button class="text-white border border-0" id="sidebar_button" style="background-color: #8D0B41;" onclick="window.location.href='../user/profile.php'"><i class="fas fa-user-circle"></i> Profile</button>
	<button class="text-white border border-0" id="sidebar_button" style="background-color: #8D0B41;" onclick="window.location.href='../user/user.php'"><i class="fas fa-list-ul"></i> User List</button>
	<button class="text-white border border-0" id="sidebar_button" style="background-color: #8D0B41;" onclick="window.location.href='../user/add_user.php'"><i class="fas fa-user-plus"></i> Add User</button>
	<button class="text-white border border-0" id="sidebar_button" style="background-color: #8D0B41;" type="button" data-toggle="popover" title="User Management" data-content="Here you can create, update, delete and view user profiles." data-placement="bottom"><i class="fas fa-question"></i> Help</button>
	<div class="fixed-bottom">
		<button class="btn m-2 p-2" id="sidebar_button" onclick="window.location.href='../main.php'"><i class="fas fa-arrow-alt-circle-left"></i> Back</button>
	</div>
</div>