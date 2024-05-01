<?php
// Send Request Page (send_request.php)
require_once("dbutils.php");

$recipient_id = $_GET['recipient_id']; // Get recipient ID from the URL parameter

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Insert workout sharing request into database
    $sender_id = $_SESSION['user_id']; // Assuming you have a session variable for the current user ID
    $sql = executeSQL("INSERT INTO workout_requests (sender_id, recipient_id, status) VALUES ('{$sender_id}', '{$recipient_id}', 'pending')");

    if ($sql) {
        // Notify the recipient
        // You can customize the notification message as needed
        $recipient_email = ""; // Get recipient's email from the database based on $recipient_id
        $notification_sent = sendConfirmationEmail($recipient_email);

        // Check if the notification was sent successfully
        if ($notification_sent) {
            // Set success message for display on the confirmation page
            $_SESSION['success'] = "Workout sharing request sent successfully.";

            // Delay before redirecting to the confirmation page
            echo "<script>
                    setTimeout(function() {
                        window.location.href = 'confirmation_page.php';
                    }, 3000); // 3 seconds delay
                  </script>";
            exit;
        } else {
            // Set error message and redirect back to the user listing page
            $_SESSION['error'] = "Failed to send notification to the recipient.";
            header("Location: user_listing.php");
            exit;
        }
    } else {
        // Set error message and redirect back to the user listing page
        $_SESSION['error'] = "Failed to insert workout sharing request into the database.";
        header("Location: user_listing.php");
        exit;
    }
}
?>