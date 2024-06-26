<?php


header ('Content-Type: application/json');

include '../koneksi.php';

$request_method = $_SERVER['REQUEST_METHOD'];

if (isset($_GET['action'])){
    $action = $_GET['action'];

    switch ($request_method){
        case 'GET' :
            if ($action == 'transaksi') {
                $query = "SELECT * FROM transaksi";

                $result = $koneksi->query($query);

                if ($result) {
                    $transaksi = $result->fetch_all(MYSQLI_ASSOC);
                    echo json_encode($transaksi);
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error retrieving data"));
                } 
                break;
            }
            break;

        case 'POST' :

            if ($action == 'rincian') {
                $valIdTransaksi = $_POST['id'];
                    $query = "SELECT
                            transaksi.id_transaksi as id,
                            user.user_fullname as nama,
                            basecake.basecake as base,
                            ukuran_cake.ukuran as ukuran,
                            ukuran_cake.jenis as jenis,
                            toping.topping as toping,
                            transaksi.keterangan as ket,
                            transaksi.waktu as waktu,
                            transaksi.total as harga,
                            desain.gambar as pict,
                            SUM(detailharga_ukurandanbasecake.harga) + SUM(toping.harga*2) as subtotal,
                            transaksi.status as status
                            FROM user
                            JOIN transaksi ON user.id = transaksi.id_user
                            JOIN transaksi_detail ON transaksi_detail.id_transaksi = transaksi.id_transaksi
                            JOIN detailharga_ukurandanbasecake on transaksi_detail.id_harga = detailharga_ukurandanbasecake.id_harga
                            JOIN ukuran_cake ON detailharga_ukurandanbasecake.id_uk = ukuran_cake.id_ukuran
                            JOIN basecake ON detailharga_ukurandanbasecake.id_ba = basecake.id_basecake
                            JOIN toping ON transaksi_detail.id_topping = toping.id_topping
                            JOIN desain ON transaksi_detail.id_desain = desain.id_desain
                            WHERE transaksi.id_transaksi = $valIdTransaksi";

                $result = $koneksi->query($query);

                if ($result) {
                    $transactions = $result->fetch_all(MYSQLI_ASSOC);
                    echo json_encode($transactions);
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error retrieving data"));
                }
                break;
            }

            if ($action == 'konfirm') {

                $valIdTransaksi = $_POST['id'];
                $valTotal = $_POST['total'];

                $query =  "UPDATE `transaksi` SET `total`='$valTotal',`status`='menunggu pembayaran' WHERE id_transaksi = $valIdTransaksi";

                $result = $koneksi->query($query);

                if ($result === TRUE) {
                    echo json_encode(array("message" => "Update successful"));
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error updating data: " . $koneksi->error));
                }
                break;
            }

            if ($action == 'ubahStatus') {

                $valId = $_POST['id_transaksi'];
                $valStatus = $_POST['status'];

                $query = "UPDATE `transaksi` SET `status` = '$valStatus' WHERE `id_transaksi` = '$valId'";

                $result = $koneksi->query($query);

                if ($result === TRUE) {
                    echo json_encode(array("message" => "Update successful"));
                } else {
                    http_response_code(500);
                    echo json_encode(array("message" => "Error updating data: " . $koneksi->error));
                }
                break;
            }

            break;

        default :
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
