<?php
function __autoload($className){
	include_once("models/$className.php");
}

$products=new Product("localhost","root","root","eleanor");

if(!isset($_POST['action'])) {
	print json_encode(0);
	return;
}

switch($_POST['action']) {
	case 'get_products':
		print $products->getProducts();
	break;
}

exit();
