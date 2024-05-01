<?php
// Database connection and initialization
include_once("dbutils.php");
error_reporting(E_ALL); 
ini_set('display_errors', '1');

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Validate email and phone number using regular expressions
    $email = $_POST['email'];
    $phone = $_POST['phone'];

    // Regex patterns for email and phone number validation
    $email_pattern = "/^\S+@\S+\.\S+$/";
    $phone_pattern = "/^\d{10}$/"; // Assuming a 10-digit phone number format, you can adjust it as needed

    if (!preg_match($email_pattern, $email)) {
        // Email format is not valid
        $_SESSION['error'] = "Invalid email format";
        header("Location: signup_push_notifications.php");
        exit;
    }

    if (!preg_match($phone_pattern, $phone)) {
        // Phone number format is not valid
        $_SESSION['error'] = "Invalid phone number format (10 digits only)";
        header("Location: signup_push_notifications.php");
        exit;
    }

    // Check if the user is already signed up for push notifications
    $existing_subscription = executeSQL("SELECT COUNT(*) AS count FROM push_notifications WHERE email = '{$email}' OR phone = '{$phone}'");
    if ($existing_subscription[0]['count'] > 0) {
        // User is already signed up, display error message
        $_SESSION['error'] = "You are already signed up for push notifications.";
        header("Location: signup_push_notifications.php");
        exit;
    }

    // Save data to the database if both email and phone number are valid
    $sql = executeSQL("INSERT INTO push_notifications (email, phone) VALUES ('{$email}', '{$phone}')");

    // Sending confirmation email
    $curl = curl_init();
    $url = "https://api.mailgun.net/v3/sandboxd748455b78024d19844e8a74ba2076e5.mailgun.org/messages";

    curl_setopt_array($curl, [
        CURLOPT_URL => $url,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 30,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POST => true, 
        CURLOPT_POSTFIELDS => array(
            'from'=>'postmaster@jimbotron.jim', 
            'to'=>$email,
            'subject'=>'Thank you for signing up!',
            'text'=>'We will email you with reminders to exercise daily!'
        ),
        CURLOPT_USERPWD => "api:f7ad09394c63f290954a6956c6b96f98-b02bcf9f-d4c89daf"
    ]);

    $response = curl_exec($curl);
    $err = curl_error($curl);

    if ($err) {
        echo "cURL Error #:" . $err;
    }
    curl_close($curl);

    // Set success message
    $_SESSION['success'] = "You have successfully signed up for push notifications.";

    // Delayed header refresh
    echo "<meta http-equiv='refresh' content='3;url=confirmation_page.php'>"; // Redirect after 3 seconds
    exit;
}
?>