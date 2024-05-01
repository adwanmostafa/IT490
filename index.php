<?php include_once('dbutils.php'); ?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
	
    <title>Gym Assistant</title>
</head>
<body>
 
    <?php include('navigation.php'); ?>
    <?php if(!$_SESSION['loggedIn']){?>
        <a href="login.php"><button class="btn btn-primary" name="upload"><span class="glyphicon glyphicon-upload"></span> Login</button></a>
        
        <a href="register.php"><button class="btn btn-primary" name="upload"><span class="glyphicon glyphicon-upload"></span> Register</button></a>
    <?php } else {?>
        <form>
    <button class="btn btn-primary" name="logout"><span class="glyphicon glyphicon-upload"></span> Logout</button>
    
        </form>
    <?php }?>
</body>
</html>
