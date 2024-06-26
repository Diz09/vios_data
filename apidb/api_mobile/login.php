<?php
/*
    catatan:
    -login dengan post
    -show user pada GET
    -tambah user / register pada POST
    -edit data user pada PUT
    -hapus user pada DELETE
*/

use Google\Service\RemoteBuildExecution\Resource\Actions;

header ('Content-Type: application/json');

include '../koneksi.php';
//db a_vioscake_test

$request_method = $_SERVER['REQUEST_METHOD'];

//periksa 'action' yang diatur pada setiap folder yang terhubung dengan API
if (isset($_GET['action'])){
    $action = $_GET['action'];

    switch ($request_method){
        case 'GET' :
            if ($action == 'get_users') {
                $query = "SELECT * FROM user WHERE id_level = 2 ORDER BY id_user desc;";
                $result = $koneksi -> query($query);

                if ($result) {
                    $users = $result -> fetch_all(MYSQLI_ASSOC);
                    echo json_encode($users);
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error retrieving data"));
                }
            } 
            break; 

        case 'POST' :
            if ($action == 'login') {
                $valEmail = $_POST['user_email'];
                $valPass = $_POST['user_password'];

                $query = "SELECT * FROM user WHERE user_email = '".$valEmail."' AND user_password = '".$valPass."' AND id_level = 1";
                $result = $koneksi -> query($query);

                if ($result) {
                    if ($result->num_rows > 0) {
                        $hasil = $result->fetch_all(MYSQLI_ASSOC);
                        $response = array(
                            'code' => 200,
                            'status' => 'sukses',
                            'data' => $hasil
                        );
                        echo json_encode($response);
                    } else {
                        // Incorrect password or user not found
                        http_response_code(401);
                        $response = array(
                            'code' => 401,
                            'status' => 'gagal',
                            'message' => 'Email or password is incorrect',
                            'data' => array()
                        );
                        echo json_encode($response);
                    }
                } else {
                    // Database query error
                    http_response_code(500);
                    $response = array(
                        'code' => 500,
                        'status' => 'gagal',
                        'message' => 'Internal Server Error',
                        'data' => array()
                    );
                    echo json_encode($response);
                }
                break;
            }

            if ($action == 'login2') {
                
                $email = $_POST['user_email'];  // Access data from form-data in POST request
                $password = $_POST['user_password'];

                $query_check = "select * from user where user_email = '$email'";
                $check = mysqli_fetch_array(mysqli_query($koneksi, $query_check));
                $json_array = array();
                $response = "";

                if (isset($check)) {
                    $query_check_pass = "select * from user where user_email = '$email' and user_password = '$password'";
                    $query_pass_result = mysqli_query($koneksi, $query_check_pass);
                    $check_password = mysqli_fetch_array($query_pass_result);
                    if (isset($check_password)) {
                        $apiKey = bin2hex(random_bytes(23)); // Generate API Key
                        $query_update_apiKey = "UPDATE user SET apiKey = '$apiKey' WHERE user_email = '$email'";
                        mysqli_query($koneksi, $query_update_apiKey); // Set API Key in the database

                        $query_pass_result = mysqli_query($koneksi, $query_check_pass);
                        while ($row = mysqli_fetch_assoc($query_pass_result)) {
                            $json_array[] = $row;
                        }
                        $response = array(
                            'code' => 200,
                            'status' => 'Sukses',
                            'data' => $json_array
                        );
                        echo json_encode($response);
                    } else {
                        $response = array(
                            'code' => 401,
                            'status' => 'Password salah, periksa kembali!',
                            'data' => $json_array
                        );
                        echo json_encode($response);
                    }
                } else {
                    $response = array(
                        'code' => 404,
                        'status' => 'Data tidak ditemukan',
                        'data' => $json_array
                    );
                    echo json_encode($response);
                }
                break;
            }

            if ($action == 'logout') {
                $email = $_POST['user_email']; // Access data from form-data in POST request
                $apiKey = $_POST['apiKey'];
            
                $query_check_apiKey = "SELECT * FROM user WHERE user_email = '$email' AND apiKey = '$apiKey'";
                $check_apiKey = mysqli_fetch_array(mysqli_query($koneksi, $query_check_apiKey));
                $response = "";
            
                if (isset($check_apiKey)) {
                    $query_update_apiKey = "UPDATE user SET apiKey = '' WHERE user_email = '$email'";
                    mysqli_query($koneksi, $query_update_apiKey); // Remove API Key from the database
            
                    $response = array(
                        'code' => 200,
                        'status' => 'Logout berhasil',
                    );
                    echo json_encode($response);
                } else {
                    $response = array(
                        'code' => 401,
                        'status' => 'Unauthorized, apiKey tidak valid!',
                    );
                    echo json_encode($response);
                }
                break;
            }
            
            if ($action == 'logout2') {
                $email = $_POST['user_email']; // Access data from form-data in POST request
                // $apiKey = $_POST['apiKey'];
            
                $query_check_apiKey = "SELECT * FROM user WHERE user_email = '$email'";
                $check_apiKey = mysqli_fetch_array(mysqli_query($koneksi, $query_check_apiKey));
                $response = "";
            
                if (isset($check_apiKey)) {
                    $query_update_apiKey = "UPDATE user SET apiKey = '' WHERE user_email = '$email'";
                    mysqli_query($koneksi, $query_update_apiKey); // Remove API Key from the database
            
                    $response = array(
                        'code' => 200,
                        'status' => 'Logout berhasil',
                    );
                    echo json_encode($response);
                } else {
                    $response = array(
                        'code' => 401,
                        'status' => 'Unauthorized, apiKey tidak valid!',
                    );
                    echo json_encode($response);
                }
                break;
            }

            if ($action == 'add_users') {
                $valNama = $_POST['user_fullname'];
                $valEmail = $_POST['user_email'];
                $valPass = $_POST['user_password'];

                $query = "INSERT INTO user (user_fullname, user_email, user_password, id_level) VALUES ('$valNama','$valEmail','$valPass', '2');";
                if ($koneksi -> query($query)) {
                    echo json_encode(array("message" => "User added successfully"));
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error adding user"));
                }
            } 
            
            break;

        case 'PUT' :

            if ($action == 'update_users') {
                parse_str(file_get_contents('php://input'), $value);
                $valId = $value['id_user'];
                $valNama = $value['user_fullname'];
                $valEmail = $value['user_email'];
                $valTelp = $value['telp'];
                $valAlamat = $value['alamat'];
                $valPict = $value['pict'];

                $query = "UPDATE `user` SET 
                                `user_email` = '$valEmail',  
                                `user_fullname` = '$valNama', 
                                `telp` = '$valTelp', 
                                `alamat` = '$valAlamat', 
                                `pict` = '$valPict' 
                            WHERE `user`.`id_user` = '$valId'";
                if ($koneksi -> query($query)) {
                    echo json_encode(array("message" => "User update successfully"));
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error update user"));
                }
            } 
            
            break;

        case 'DELETE' :
            
            if ($action == 'delete_users') {
                if (isset($_GET['id_level'])) {
                    parse_str(file_get_contents('php://input'), $value);
                    $valId = $value['id_user'];

                    $query = "DELETE FROM user WHERE id_user = '$valId'";
                    if ($koneksi -> query($query)) {
                        echo json_encode(array("message" => "User deleted successfully"));
                    } else {
                        http_response_code(500);
                        echo json_encode(array("message" => "Error deleting user"));
                    }
                } else {
                    http_response_code(400);
                    echo json_encode(array("message" => "'id_level' parameter is missing"));
                }
            } break;
        
        default:
            //metode http tidak didukung
            http_response_code(405);
            echo json_encode(array("message" => "Method not allowed"));
            break;
    }
} else {
    //action tidak diatur
    http_response_code(400);
    echo json_encode(array("message" => "'action' parameter is missing"));
}
$koneksi -> close();

?>
