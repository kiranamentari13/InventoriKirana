<?php
// Require composer autoload
require_once __DIR__ . '/vendor/autoload.php';

// koneksi database
require_once('koneksi.php');

function query($query)
{ 
    global $conn;
    $result = mysqli_query($conn, $query);

    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $row[] = $row;
    }

    return $rows;
}

// Ambil data produk + kategori
$data = query("
    SELECT
        p.id,
        p.product_code,
        p.product_name,
        c.category_name,
        p.stock,
        p.min_stock,
        p.price,
        p.gambar,
        p.created_at
    FROM products p 
    JOIN categories c ON p.category_id = c.id
    ORDER BY p.stock ASC
");

// Inisialisasi mPDF
$mpdf = new \Mpdf\Mpdf([
    'format' => 'A4-L'
]);

$html = '
<html>
<head>
    <title>Laporan Stok Minimum</title>
    
    <style>
        body {
            font-family: sans-serif;
        
        }

        h1 {
            text-align: center;
            color: #262626;
            margin-bottom: 5px;
        }

        h3 {
            text-align: center;
            color: 0;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse; collapse;
            margin-top: 10px;
        }

        thead th {
            background-color: #4e73df;
            color: white;
            padding: 10px;
            font-size: 12px;
        }

        tbody td {
            padding: 8px;
            font-size: 11px;
            border: 1px solid #ccc;
        }
        
        tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        img {
            width: 70px;
            height: 70px;
            object-fit: cover;
        }

        .stok-aman {
            color: greeh;
            font-weight: bold;
        }

        .stok-minim {
            color: red;
            font-weight: bold;
        }

        
    </style>
</head>

<body>

<h1>InventoriKirana</h1>
<hr>
<h3>LAPORAN STOK BARANG</h3>

<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Gambar</th>
            <th>Kode Produk</th>
            <th>Nama Produk</th>
            <th>Kategori</th>
            <th>Harga</th>
            <th>Stok</th>
            <th>Min. Stok</th>
            <th>Status</th>
            <th>Tanggal Dibuat</th>
        </tr>
    </thead>

<tbody>
';

$no = 1;

foreach ($data as$row) {

    $harga = "Rp ". number_format($row['price'], 0,',', '.');

    // Status stok
    if ($row['stock'] <= $row['min_stock']) {
        $status = '<span class="stok-minim">Stok Minim</span>';
    } else {
        $status = '<span class="stok-aman">Aman</span>';
    }

    // Path gambar
    $gambar ='produk_img' . $row['gambar'];

    // Jika Gambar Kosong
    if (empty($row['gambar']) || !file_exists($gambar)) {
        $gambarHtml = '-';
    } else {
        $gambarHtml = '<img src="' . $gambar . '">';
    }

    $html .= '
        <tr class="warning">
            <td class="text-center">' . $no++ . '</td>
            <td class="text-center">' . $gambarHtml . '</td>
            <td>' . $row['product_code'] . '</td>
            <td>' . $row['product_name'] . '</td>
            <td>' . $row['category_name'] . '</td>
            <td class="text-right">' . $harga . '</td>                         
            <td class="text-center">' . $row['stock'] . '</td>
            <td class="text-center">' . $row['min_stock'] . '</td>
            <td class="text-center">' . $status . '</td>
            <td class="text-center">' . date('d-m-Y H:i', strtotime($row['created_at'])) . '</td>        
        </tr>
    ';
}

$html .= '
    </tbody>
</table>

</body>
</html>
';

// Generate PDF
$mpdf->WriteHTML($html);
$mpdf->Output('laporan_stok_minimum.pdf', 'I');
?>