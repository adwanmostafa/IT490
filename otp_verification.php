<?php
session_start();

// Check if the request comes from the registration process
// Database connection and initialization
include_once("dbutils.php");
error_reporting(E_ALL); 
ini_set('display_errors', '1');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    // Retrieve OTP entered by the user
    $otp_entered = $_POST['token'];

    // Retrieve the OTP sent to the user's email (Assuming it was stored in the session during registration)
    $otp_sent = $_SESSION['otp'];

    // Validate the OTP
    if ($otp_entered === $otp_sent) {
        // OTP is correct
        // Redirect the user to the success page or perform any other desired action
        header("Location: profilesetup.php");
        
    } else {
        // OTP is incorrect
        $error = "Invalid OTP. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>OTP Verification</h1>
    <?php if (isset($error)): ?>
        <div style="color: red;"><?php echo $error; ?></div>
    <?php endif; ?>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" name="otp" required>
        <br>
        <button type="submit">Verify OTP</button>
    </form>
</body>
</html>