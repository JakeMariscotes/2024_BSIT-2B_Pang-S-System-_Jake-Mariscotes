<?php
include_once "db.php";
session_start();


if(isset($_POST['l_username'])){
    $uname = $_POST['l_username'];
    $pword = $_POST['l_password'];
    
    $sql_check_user_info = "SELECT *
                              FROM `user_information`
                            WHERE `username` = '$uname'
                              AND `password` = '$pword'
                            ";
    $sql_result = mysqli_query($conn,$sql_check_user_info);
    $count_result = mysqli_num_rows($sql_result);
    
    if($count_result == 1){
        //existing user
        $row = mysqli_fetch_assoc($sql_result);
        
        //create session variables
        $_SESSION['user_info_id'] = $row['user_id'];
        $_SESSION['user_info_user_type'] = $row['user_type'];
        $_SESSION['user_info_fullname'] = $row['fullname'];
        $_SESSION['user_info_username'] = $row['username'];
        $_SESSION['user_info_password'] = $row['password'];
        $_SESSION['user_info_age'] = $row['age'];
        $_SESSION['user_info_sex'] = $row['sex'];
        $_SESSION['user_info_contact_no'] = $row['contact_number'];
        $_SESSION['user_info_email_address'] = $row['email_address'];
        $_SESSION['user_info_address'] = $row['address'];
       
        
        if($row['user_type'] == 'Admin'){
            //admin
            header("location: admin/operations.php");
        }
        else if($row['user_type'] == 'Customer'){
            //common user
            header("location: index.php");
        }
        else if($row['user_type'] == 'Barber'){
            //barber
            header("location: Barber/barber.php");
        }
    }
    else{
        header("location: login.php?error=user_does_not_exist");
    }
}

?>