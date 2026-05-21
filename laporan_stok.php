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
        p.product code,
        p.product_name,
        c.category_name,
        p.stock,
        p.min_stock,
        p.price,
        p.gambar,
        p.created_at
    FROM products p
    JOIN categories c ON p.category_id = c.id
    ORDER BY p.product_name ASC
");

// Inisialisasi mPDF
$mpdf = new \Mpdf\Mpdf([
    'format' => 'A4-L'
]);

$html = '
<html>
<head>
    <title>Laporan Stok Barang</title>
    
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
            border-collapse;
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
            background-color: #f2f2f2;
        }

        .text-center {
            text-align: center;
        }

        .text-center {
            text-align: right;
        }

        img {
            width: 70px;
            height: 70px;
            object-fit: cover;
        }

        .stok-aman {
            color: green;
            font-weight: bold;
        }

        .stok-minim {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>


