-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Nov 06, 2016 at 10:52 PM
-- Server version: 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `eleanor`
--

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `discountId` int(11) NOT NULL,
  `discountPercentage` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`discountId`, `discountPercentage`) VALUES
(1, 20),
(2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `grapeTypes`
--

CREATE TABLE `grapeTypes` (
  `grapeTypeID` int(11) NOT NULL,
  `grapeTypeName` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grapeTypes`
--

INSERT INTO `grapeTypes` (`grapeTypeID`, `grapeTypeName`) VALUES
(1, 'Cabernet Sauvignon'),
(2, 'Cabernet Franc'),
(3, 'Malbec'),
(4, 'Merlot'),
(5, 'Sauvignon Blanc'),
(6, 'Sauvignon Gris'),
(7, 'Semillon'),
(15, 'Bordeaux Blends');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `producerName` varchar(100) NOT NULL,
  `grapeTypeId` int(11) NOT NULL,
  `wineColorId` int(11) NOT NULL,
  `productTitle` varchar(50) NOT NULL,
  `productDescription` varchar(1000) NOT NULL,
  `vintageYear` varchar(4) NOT NULL,
  `blendDescription` varchar(200) NOT NULL,
  `bottleprice` float(15,2) NOT NULL,
  `casePrice` float(15,2) NOT NULL,
  `discountId` int(11) NOT NULL,
  `alcoholPercentage` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `producerName`, `grapeTypeId`, `wineColorId`, `productTitle`, `productDescription`, `vintageYear`, `blendDescription`, `bottleprice`, `casePrice`, `discountId`, `alcoholPercentage`) VALUES
(1, 'Chateau Clinet', 4, 1, 'Ronan by Clinet', 'A brilliant ruby red appearance. The aroma hints of ripe cherries, raspberries and blackberries. In addition, subtle spicy and floral tones and a hint of bay leaf and licorice. The taste is mouth filling and the accessibility and juiciness of a good Merlot. The fresh acidity make for a wonderful fraicheur and elegance and are well balanced with ripe dark fruit.', '2012', 'Medium-Full Bodied, Dry', 11.95, 137.40, 1, 13),
(2, 'Chateau Simard', 15, 1, 'Saint Emilion 2005', 'Brilliant ruby color with some brick notes. The nose has hints of berries, violets and earth. In the mouth, flavors of cassis, black cherry and plum expand within a good, round structure; medium length and plenty of aging potential. This wine can be enjoyed with red meats, stews and grillade. It is well aged and ready for drinking.', '2005', 'Medium-Full Bodied, Dry', 20.95, 251.40, 0, 13),
(3, 'Chateau Calet', 15, 1, 'Blaye, Cotes de Bordeaux 2009', 'Each glass has a pronounced nose showing pure fruit character, which is extremely appealing and approachable. The palate shows lovely bright, polished fruit, plump and plummy with silky tannins, for real drinkability. There is plenty to enjoy here with excellent length and balance.\nMerlot and Cabernet Franc blend\n', '2012', 'Medium-Full Bodied, Dry', 9.95, 119.40, 2, 13.5),
(4, 'Saint-Emilion', 4, 1, 'Saint-Emilion Bordeaux 2012', 'A ruminant velvety mouth feel is accompanied by mounds of plummy red fruit character, cherry and damson as well as background notes of cedar and vanilla. This fruit driven merlot has the softness, balance and complexity of a much more expensive wine.\n', '2012', 'Medium-Full Bodied, Demi-sec', 18.95, 239.40, 0, 13),
(6, 'Chateau Poujeaux', 1, 1, 'Moulis 2011', 'Its dark ruby color is followed by sweet plum, black cherry and currant fruit, no herbaceousness, a medium-bodied, elegant mouthfeel, and noteworthy purity. Drink this tasty, mid-weight Moulis over the next 5-6 years', '2011', 'Cabernet Sauvignon, Merlot \r\n', 31.09, 383.40, 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `wineColors`
--

CREATE TABLE `wineColors` (
  `wineColorId` int(11) NOT NULL,
  `wineColorName` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wineColors`
--

INSERT INTO `wineColors` (`wineColorId`, `wineColorName`) VALUES
(1, 'Red'),
(2, 'White'),
(3, 'Rose');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`discountId`);

--
-- Indexes for table `grapeTypes`
--
ALTER TABLE `grapeTypes`
  ADD PRIMARY KEY (`grapeTypeID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD UNIQUE KEY `productId` (`productId`);

--
-- Indexes for table `wineColors`
--
ALTER TABLE `wineColors`
  ADD PRIMARY KEY (`wineColorId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `discountId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `grapeTypes`
--
ALTER TABLE `grapeTypes`
  MODIFY `grapeTypeID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wineColors`
--
ALTER TABLE `wineColors`
  MODIFY `wineColorId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
