<?php 
include_once('dbutils.php'); 

// Function to generate a random token
function generateToken($length = 6) {
    return substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"), 0, $length);
}

$q = executeSQL("SELECT 1 FROM `accounts` WHERE username = '{$_POST['username']}';");

if(count($q) == 0){
    // Check if the passwords match
    if ($_POST['password'] !== $_POST['confirm_password']) {
        $error_message = "Passwords do not match.";
    } else {
        // Generate a random 2FA token
        $token = generateToken();

        // Hash the password
        $hash = password_hash(sanitize($_POST['password']), PASSWORD_DEFAULT);

        // Insert user data and token into the database
        $val = executeSQL("INSERT INTO accounts (username, email, pwd_hash, token) VALUES ('{$_POST['username']}', '{$_POST['email']}', '{$hash}', '{$token}')");

        if(count($val) == 0){
            // Send email with 2FA token
            $to = $_POST['email'];
            $subject = 'Two-Factor Authentication Token';
            $message = 'Your 2FA token is: ' . $token;
            $headers = 'From: your@example.com';

            // Uncomment the line below to send the email
            // mail($to, $subject, $message, $headers);

            // Set success message and delay the refresh
            $success_message = "Congratulations! Your account has successfully been created! A verification email has been sent to your email address. Please check your inbox.";
            echo $success_message; // Display success message

            // Display verification code sent to the user
            echo "<p>Verification code: $token</p>";

            // Delay the refresh for 5 seconds before redirecting to OTP verification page
            header("refresh:5;url=otp_verification.php");
            exit();
        } else {
            $error_message = "An error occurred while creating your account. Please try again later.";
        }
    }
} else {
    $error_message = "This username already exists, please try again using a different name!";
}

// Include the HTML page to display the messages
include("confirmation_page.php");
?>