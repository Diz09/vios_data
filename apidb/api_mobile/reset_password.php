<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// require 'path/to/PHPMailer/src/Exception.php';
// require 'path/to/PHPMailer/src/PHPMailer.php';
// require 'path/to/PHPMailer/src/SMTP.php';

require "vendor/autoload.php";

if(!empty($_POST['user_email'])){
    $email = $_POST['user_email'];
    $con = mysqli_connect("localhost", "id21452276_vioscake1", "Slaoapwan211#@", "id21452276_vioscakedb");
    if($con){
        try{
        $otp = random_int(100000, 999999);
            
        }catch(Exception $e){
        $otp = rand(100000, 999999);
        }
        $sql = "update user set reset_password_otp = '".$otp."', reset_password_created_at = '"
        .date('Y-m-d H:i:s')."' where user_email = '".$email."'";
        if(mysqli_query($con, $sql)){
            if(mysqli_affected_rows($con)){
                $mail = new PHPMailer(true);

                try {
                    $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
                    $mail->isSMTP();                                            //Send using SMTP
                    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                    $mail->Username   = 'viosckae1@gmail.com';                     //SMTP username
                    $mail->Password   = 'vioscake123456';                               //SMTP password
                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;            //Enable implicit TLS encryption
                    $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                
                    //Recipients
                    $mail->setFrom('vioscake1@gmail.com', 'Vios Cake');
                    $mail->addAddress($email);     //Add a recipient
                    $mail->addReplyTo('info@example.com', 'Information');
                    
                     //Attachments
                    // $mail->addAttachment('/var/tmp/file.tar.gz'); 
                    // $mail->addAttachment('/tmp/image.jpg');
                
                    //Content
                    $mail->isHTML(true);                                  //Set email format to HTML
                    $mail->Subject = 'Reset Password';
                    $mail->Body    = 'Your OTP to reset password is [ ' . $otp . ' ]';
                    $mail->AltBody = 'Reset Password to access application';
                
                    if($mail->send())
                        echo 'success';
                    else
                        echo 'Failed to send OTP through mail';
                } catch (Exception $e) {
                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                }
            }
            else echo "Reset Password Failed";
        }
        else echo "Reset Password Failed";
    }else echo "Database connection failed";
}else echo "All fields are required";
?>