<?php require "../model/users.php" ?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">
    <title>Registration</title>
</head>
<body>
<h1 class="title">Metro Ticket</h1>
<div class="manage-user-container">
    <h2 class="admin-form-title">Manage Users</h2>
    <div class="table-wrapper">
        <table class="manage-users" id="users-table">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Phone</th>
                <th>Manager</th>
                <th>Action</th>
            </tr>
            <?PHP fetchUsers(); ?>
        </table>
    </div>
</div>

</body>
</html>