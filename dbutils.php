<?php
require_once('dbconnect.php');

// Function to sanitize input data
function sanitize(string $str) {
    return htmlspecialchars(strip_tags(trim($str)));
}

// Function to handle user login
function doLogin($username, $password) {
    global $db;
    $sql = "SELECT username, pwd_hash FROM accounts WHERE username = :username";
    try {
        $stmt = $db->prepare($sql);
        $stmt->bindValue(':username', $username, PDO::PARAM_STR);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($user && password_verify($password, $user['pwd_hash'])) {
            return true;
        }
        return false;
    } catch (PDOException $e) {
        error_log("Error in doLogin: " . $e->getMessage());
        return false;
    }
}

// Function to execute SQL queries
function executeSQL($SQL, $params = []) {
    global $db;
    try {
        $stmt = $db->prepare($SQL);
        $stmt->execute($params);
        return $stmt->fetchAll();
    } catch (PDOException $e) {
        error_log("Error in executeSQL: " . $e->getMessage());
        return [];
    }
}

// Function to save user subscription for push notifications
function saveSubscription($email, $phone) {
    global $db;
    
    // Check if the email or phone number already exists in the database
    $sql = "SELECT COUNT(*) AS count FROM push_notifications WHERE email = :email OR phone = :phone";
    try {
        $stmt = $db->prepare($sql);
        $stmt->bindValue(':email', $email, PDO::PARAM_STR);
        $stmt->bindValue(':phone', $phone, PDO::PARAM_STR);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($result['count'] > 0) {
            // User already exists, no need to insert again
            return true;
        }
        
        // User does not exist, insert subscription
        $insertSql = "INSERT INTO push_notifications (email, phone) VALUES (:email, :phone)";
        $insertStmt = $db->prepare($insertSql);
        $insertStmt->bindValue(':email', $email, PDO::PARAM_STR);
        $insertStmt->bindValue(':phone', $phone, PDO::PARAM_STR);
        $insertStmt->execute();
        return true;
    } catch (PDOException $e) {
        error_log("Error saving subscription: " . $e->getMessage());
        return false;
    }
}

// Function to send confirmation email
function sendConfirmationEmail($email) {
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
        error_log("Error sending confirmation email: " . $err);
        return false;
    }
    curl_close($curl);
    return true;
}

// Start session
session_start();
if (!isset($_SESSION['loggedIn'])) {
    $_SESSION['loggedIn'] = false;
    $_SESSION['user'] = null;
}
if (isset($_GET['logout'])) {
    $_SESSION['loggedIn'] = false;
    $_SESSION['user'] = null;
    session_destroy();
}
?>