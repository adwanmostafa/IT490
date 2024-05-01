<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Confirmation</title>
    <link rel="stylesheet" href="styles.css"> 
</head>
<body>
    <h1>Thank You for Signing Up!</h1>
    <p>You'll receive push notifications to remind you to exercise.</p>

    <?php
    // Check if success message is set in session
    session_start();
    if (isset($_SESSION['success'])) {
        // Display success message
        echo "<p class='success-message'>" . $_SESSION['success'] . "</p>";

        // Unset the success message to avoid displaying it again on page refresh
        unset($_SESSION['success']);

        // Delayed redirect to user list PHP page after 3 seconds
        echo "<script>
                setTimeout(function() {
                    window.location.href = 'user_listing.php';
                }, 3000); // 3 seconds delay
              </script>";
    }
    ?>
</body>
</html>