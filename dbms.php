#!/usr/bin/php
<?php
require_once('dbconnect.php');

function sanitize(string $str) {
    $str = strip_tags(filter_var(trim($str), FILTER_SANITIZE_STRING));
    return $str;
}

function doSQL($sql) {
    global $db;
    try {
        $stmt = $db->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        echo "User data:";
        var_dump($result);
        return $result;
    } catch (PDOException $e) {
        return array("error" => $e->getMessage());
    }
}

function doLogin($username, $password) {
    global $db;
    $sql = "SELECT user_id, username, pwd_hash FROM accounts WHERE username = :username";
    try {
        $stmt = $db->prepare($sql);
        $stmt->bindValue(':username', sanitize($username), PDO::PARAM_STR);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo $e->getMessage();
        return array("returnCode" => false);
    }
    if ($user && password_verify(sanitize($password), $user['pwd_hash'])) {
        echo "returning true";
        return array("returnCode" => true);
    }
    echo "returning false";
    return array("returnCode" => false);
}

function requestProcessor($request) {
    echo "received request".PHP_EOL;
    var_dump($request);
    if (!isset($request['type'])) {
        return "ERROR: unsupported message type";
    }
    switch ($request['type']) {
        case "login":
            return doLogin($request['username'], $request['password']);
        case "sql":
            return doSQL($request['sql']);
        case "validate_session":
            // Implement session validation if required
            break;
        default:
            return array("returnCode" => '0', 'message' => "Server received request and processed");
    }
}

// Replace testRabbitMQServer with your server processing code if needed

echo "DBMS Script Execution Complete".PHP_EOL;
?>
