<?php
$conn = new mysqli("localhost", "root", "", "ecommerce");
if ($conn->connect_error) die("DB Error");
session_start();
?>

<!DOCTYPE html>
<html>
<head>
<title>Amazon Clone Responsive</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
body { font-family: Arial; margin:0; background:#f3f3f3; }
.header { background:#131921; color:white; padding:12px; display:flex; flex-wrap:wrap; align-items:center; justify-content:space-between; }
.logo { font-size:20px; font-weight:bold; }
.search { flex:1; margin:10px; }
.search input { width:100%; padding:8px; border-radius:5px; border:none; }
.container { padding:15px; }
.products { display:grid; grid-template-columns: repeat(4,1fr); gap:15px; }

.card {
 background:white;
 padding:10px;
 border-radius:10px;
 text-align:center;
 box-shadow:0 2px 5px rgba(0,0,0,0.1);
 transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
 transform: scale(1.05);
 box-shadow:0 6px 15px rgba(0,0,0,0.2);
}

.card img { width:100%; height:180px; object-fit:cover; border-radius:8px; }

button {
 background:#ffd814;
 border:none;
 padding:8px;
 margin-top:5px;
 cursor:pointer;
 border-radius:5px;
}

@media (max-width: 768px) {
 .products { grid-template-columns: repeat(2,1fr); }
}
@media (max-width: 480px) {
 .products { grid-template-columns: 1fr; }
}
</style>
</head>
<body>

<div class="header">
<div class="logo">Amazon Clone</div>
<div class="search"><input placeholder="Search products..."></div>
<div>Cart (<?php echo isset($_SESSION['cart']) ? count($_SESSION['cart']) : 0; ?>)</div>
</div>

<div class="container">
<h2>Products</h2>
<div class="products">

<?php
$res = $conn->query("SELECT * FROM products");
while ($row = $res->fetch_assoc()) {
?>

<div class="card">
<img src="<?php echo $row['image']; ?>">
<h3><?php echo $row['name']; ?></h3>
<p>₹<?php echo $row['price']; ?></p>
<a href="?add=<?php echo $row['id']; ?>"><button>Add to Cart</button></a>
</div>

<?php } ?>
</div>

<?php
if (isset($_GET['add'])) {
$id = $_GET['add'];
$_SESSION['cart'][$id] = ($_SESSION['cart'][$id] ?? 0) + 1;
header("Location: index.php");
}
?>

</div>
</body>
</html>
