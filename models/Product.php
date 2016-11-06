<?php

class Product {

	private $dbh;

	public function __construct($host,$user,$pass,$db)	{
		$this->dbh = new PDO("mysql:host=".$host.";dbname=".$db,$user,$pass);
	}


	public function getProducts(){
		$sth = $this->dbh->prepare("SELECT * FROM products
      LEFT JOIN grapeTypes on products.grapeTypeId = grapeTypes.grapeTypeID
      LEFT JOIN wineColors on products.wineColorId = wineColors.wineColorId
      LEFT JOIN discounts on products.discountId = discounts.discountId");
		$sth->execute();
		return json_encode($sth->fetchAll());
	}
}
?>
