<?php require "../model/registration.php" ?>
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
<div class="form-container center-screen">
    <form method="POST">
        <h2 class="login-form-title">Registration</h2>
        <fieldset>
            <div>
                <div>
                    <label class="form-label" for="username">Username</label>
                    <input autofocus class="form-input-box" id="username" name="username"
                           placeholder="Enter your name here" type="text"
                           value="<?php echo isset($_POST['username']) ? $_POST['username'] : '' ?>">
                </div>
                <div>
                    <label class="form-label" for="email">Email</label>
                    <input class="form-input-box" id="email" name="email"
                           placeholder="Enter your email here" type="text"
                           value="<?php echo isset($_POST['email']) ? $_POST['email'] : '' ?>">
                </div>
                <div>
                    <label class="form-label" for="password">Password</label>
                    <input autocomplete="off" class="form-input-box"  id="password" name="password"
                           placeholder="Enter your password here" type="password"
                           value="<?php echo isset($_POST['password']) ? $_POST['password'] : '' ?>">
                </div>
                <div>
                    <label class="form-label" for="cPassword">Confirm
                        Password</label>
                    <input autocomplete="off" class="form-input-box" id="cPassword" name="cPassword"
                           placeholder="Enter the password again here" type="password"
                           value="<?php echo isset($_POST['cPassword']) ? $_POST['cPassword'] : '' ?>">
                </div>
                <div>
                    <label class="form-label" for="phone">Phone Number</label>
                    <input class="form-input-box" id="phone" name="phone"
                           placeholder="Enter your phone number here" type="text"
                           value="<?php echo isset($_POST['phone']) ? $_POST['phone'] : '' ?>">
                </div>
                <div>
                    <label for="manager">Manager</label>
                    <select name="manager" id="manager" class="radio-button">
                        <option value="0">Select your manager...</option>
                        <option value="1">Manager 1</option>
                        <option value="2">Manager 2</option>
                        <option value="3">Manager 3</option>
                        <option value="4">Manager 4</option>
                        <option value="5">Manager 5</option>
                    </select>
                </div>
            </div>
        </fieldset>
        <div>
            <div class="center-text">
                <p id="prompt-message">
                    <?php
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        if (!register()) {
                            echo '<span class="error-message">Please fill out all the fields properly</span>';
                        }
                    }

                    if (isset($_GET['success']))
                        echo '<span class="success">Registration Successful</span>';
                    ?>
                </p>
            </div>
            <div class="center">
                <input id="form-submit" type="submit" class="button"
                       value="Register">
            </div>
            <div class="center-text bottom-text">
                Already have an account? <a href="login.php">Login</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>