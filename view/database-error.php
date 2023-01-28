<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../../public/img/logo.svg"/>
    <link rel="preload" href="../../public/img/background.jpg"/>
    <link href="../../public/css/style.css" type="text/css" rel="stylesheet">
    <title>Bear Burger</title>
</head>

<body>

<header>
    <a class="logo" href="Welcome.php"><img src="../../public/img/nav-logo.svg" alt="logo"></a>
    <nav>
        <ul class="nav-links">
            <li><a href="https://github.com/Raofin/BearBurger-PHP">GitHub</a></li>
            <li><a href="https://raofin.net">raofin.net</a></li>
        </ul>
    </nav>
</header>

<div id="database-error" class="database-error">
    <h1>Connection Error</h1>
    <p>Please make sure that MySQL is running and the Database is correctly configured.</p>
    <button class="button" onclick="location.href='../models/DBTest.php'">Try again</button>
</div>

</body>

<footer class="footer">
    <p>Copyright &copy 2022 by <a href="https://raofin.net">Raofin</a>. All Rights Reserved.</p>
</footer>

</html>
