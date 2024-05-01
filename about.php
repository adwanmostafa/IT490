<?php
include_once("dbutils.php");

// Redirect to login page if user is not logged in
if (!isset($_SESSION["loggedIn"]) || $_SESSION["loggedIn"] !== true) {
    header("Location: login.php");
    exit;
}

$column_names = ['height_feet', 'height_inches', 'weight', 'time_available', 'equipment', 'gym_access', 'exercise_goals'];

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $valstr = [];

    // Process and store form data in session variables
    foreach ($column_names as $col) {
        if (isset($_POST[$col]) && $_POST[$col] != '') {
            if ($col == 'height_feet')
                $valstr['height'] = $_POST[$col];
            else if ($col == 'height_inches')
                $valstr['height'] .= "." . $_POST[$col];
            else if ($col == 'gym_access')
                $valstr[$col] .= ($_POST[$col] == 'Yes' ? 0 : 1);
            else if ($col == 'equipment')
                $valstr[$col] = implode(", ", str_replace('_', ' ', $_POST[$col]));
            else
                $valstr[$col] = $_POST[$col];
        }
    }

    $sql = "UPDATE `accounts` SET ";
    foreach ($valstr as $col => $val) {
        $sql .= "`" . $col . "` = '" . $val . "',";
    }
    $sql = substr($sql, 0, -1);
    $sql .= " WHERE username = '" . $_SESSION['user'] . "'";
    executeSQL($sql);

    // Redirect to next step (optional)
    // header("Location: next_step.php");
    // exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <?php include 'navigation.php'; ?>
    <h2>Edit Profile</h2>
    <form action="profilesetup.php" method="post">
        <!-- Tab 1: Personal Information -->
        <div class="tab">
            <label for="height_feet">Height:</label>
            <input type="number" id="height_feet" name="height_feet" value="<?php echo $_SESSION['height_feet']; ?>" placeholder="Feet">
            <input type="number" id="height_inches" name="height_inches" value="<?php echo $_SESSION['height_inches']; ?>" placeholder="Inches"><br><br>

            <label for="weight">Weight (lbs):</label>
            <input type="number" id="weight" name="weight" value="<?php echo $_SESSION['weight']; ?>"><br><br>

            <label for="time_available">Time Available for Exercise (minutes per day):</label>
            <input type="number" id="time_available" name="time_available" value="<?php echo $_SESSION['time_available']; ?>"><br><br>
        </div>

        <!-- Tab 2: Equipment and Goals -->
        <div class="tab">
            <label for="equipment">Equipment Available:</label><br>
            <!-- Checkbox options here... -->

            <label for="gym_access">Gym Access:</label><br>
            <input type="radio" id="yes" name="gym_access" value="Yes" <?php if ($_SESSION['gym_access'] == 'Yes') echo "checked"; ?>>
            <label for="yes">Yes</label>
            <input type="radio" id="no" name="gym_access" value="No" <?php if ($_SESSION['gym_access'] == 'No') echo "checked"; ?>>
            <label for="no">No</label><br><br>

            <label for="exercise_goals">Exercise Goals:</label><br>
            <!-- Radio options here... -->
        </div>

        <!-- Next button -->
        <div style="overflow:auto;">
            <div style="float:right;">
                <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
            </div>
        </div>

        <!-- Steps indicator -->
        <div style="text-align:center;margin-top:40px;">
            <span class="step"></span>
            <span class="step"></span>
        </div>
    </form>

    <script>
        var currentTab = 0;
        showTab(currentTab);

        function showTab(n) {
            var tabs = document.getElementsByClassName("tab");
            tabs[n].style.display = "block";

            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }

            if (n == (tabs.length - 1)) {
                document.getElementById("nextBtn").innerHTML = "Submit";
            } else {
                document.getElementById("nextBtn").innerHTML = "Next";
            }

            fixStepIndicator(n);
        }

        function nextPrev(n) {
            var tabs = document.getElementsByClassName("tab");

            if (n == 1 && !validateForm()) return false;

            tabs[currentTab].style.display = "none";
            currentTab += n;

            if (currentTab >= tabs.length) {
                document.getElementById("profileForm").submit();
                return false;
            }

            showTab(currentTab);
        }

        function validateForm() {
            var tabs, inputs, i, valid = true;
            tabs = document.getElementsByClassName("tab");
            inputs = tabs[currentTab].getElementsByTagName("input");

            for (i = 0; i < inputs.length; i++) {
                if (inputs[i].value == "") {
                    inputs[i].className += " invalid";
                    valid = false;
                }
            }

            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid;
        }

        function fixStepIndicator(n) {
            var i, steps = document.getElementsByClassName("step");
            for (i = 0; i < steps.length; i++) {
                steps[i].className = steps[i].className.replace(" active", "");
            }
            steps[n].className += " active";
        }
    </script>
</body>
</html>
