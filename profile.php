<?php
require_once('dbutils.php');

// Redirect to login page if user is not logged in
if (!isset($_SESSION['loggedIn']) || !$_SESSION['loggedIn']) {
    header("Location: login.php");
    exit;
}

$user_id = $_SESSION['user'];
$sql = "SELECT * FROM accounts WHERE username = :username";
$userProfile = executeSQL($sql, [':username' => $user_id]);

// Check if user profile exists
if (!$userProfile) {
    echo "User profile not found.";
    exit;
}

// Extract user profile data from the result
$user = $userProfile[0];
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <?php include 'navigation.php'; ?>
    <h1>User Profile</h1>
    <p><strong>Username:</strong> <?php echo $user["username"]; ?></p>
    <p><strong>Email:</strong> <?php echo $user["email"]; ?></p>
    <p><strong>Height:</strong> <?php echo $user["height_feet"] . " feet " . $user["height_inches"] . " inches"; ?></p>
    <p><strong>Weight:</strong> <?php echo $user["weight"]; ?> lbs</p>
    <p><strong>Time Available for Exercise:</strong> <?php echo $user["time_available"]; ?> minutes per day</p>
    <p><strong>Equipment Available:</strong> <?php echo $user["equipment"]; ?></p>
    <p><strong>Gym Access:</strong> <?php echo $user["gym_access"]; ?></p>
    <p><strong>Exercise Goals:</strong> <?php echo $user["exercise_goals"]; ?></p>
    <p><a href="edit_profile.php">Edit Profile</a></p>
    <p><a href="logout.php">Logout</a></p>
</body>
</html>
