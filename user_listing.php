<?php
// User Listing Page (user_listing.php)
include_once("dbutils.php");

// Fetch all users enrolled for push notifications
$users = executeSQL("SELECT * FROM push_notifications");

foreach ($users as $user) {
    echo "<p>{$user['email']} <a href='send_request.php?recipient_id={$user['id']}'>Send Request</a></p>";
}
?>