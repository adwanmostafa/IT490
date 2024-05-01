<!DOCTYPE html>
<?php 
include_once("dbutils.php");

$message = "";

// Handle the POST request from the login form
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['username']) && isset($_POST['password'])) {
        if (doLogin($_POST['username'], $_POST['password'])) {
            $_SESSION["loggedIn"] = true;
            $_SESSION["user"] = $_POST['username'];
            echo "<script>window.location.href = 'index.php';</script>"; // Redirect to index.php if login is successful
            exit;
        } else {
            $message = "Incorrect Username or Password. Please try again."; // Provide user feedback for incorrect credentials
        }
    }
}

// Check if already logged in
if (isset($_SESSION["loggedIn"]) && $_SESSION["loggedIn"] === true) {
    echo "<script>window.location.href = 'index.php';</script>"; // Redirect if already logged in
    exit;
}
?>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="login-container">
            <h1>Login</h1>
            <?php if ($message != "") echo "<p>$message</p>"; ?> <!-- Display login errors if any -->
            <form action="login.php" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <br>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <br>
                <input type="submit" value="Login" />
                <div class="forgot-password">
                    <a href="#">Forgot Password?</a>
                </div>
                <div class="register">
                    <p>Don't have an account? <a href="register.php">Register here</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
