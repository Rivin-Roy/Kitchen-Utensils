-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2022 at 04:15 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `billingAddress` varchar(255) DEFAULT NULL,
  `biilingCity` varchar(150) DEFAULT NULL,
  `billingState` varchar(100) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `billingCountry` varchar(100) DEFAULT NULL,
  `shippingAddress` varchar(300) DEFAULT NULL,
  `shippingCity` varchar(150) DEFAULT NULL,
  `shippingState` varchar(100) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `shippingCountry` varchar(100) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userrrid` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `userId`, `billingAddress`, `biilingCity`, `billingState`, `billingPincode`, `billingCountry`, `shippingAddress`, `shippingCity`, `shippingState`, `shippingPincode`, `shippingCountry`, `postingDate`) VALUES
(5, 8, 'QWE', 'Q', 'Ker', 68669, 'India', 'QWE', 'Q', 'Ker', 68669, 'India', '2022-04-10 22:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productQty` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uiid` (`userID`),
  KEY `piddd` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`, `createdBy`) VALUES
(12, 'Dinnerware', 'Dinnerware', '2022-04-10 22:10:02', NULL, 1),
(13, 'Serveware', 'Serveware', '2022-04-10 22:10:30', NULL, 1),
(14, 'Kitchen Tools & Accessories ', 'Kitchen Tools & Accessories ', '2022-04-10 22:11:00', '2022-04-10 22:17:29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `addressId` int(11) DEFAULT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `txnType` varchar(200) DEFAULT NULL,
  `txnNumber` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(120) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uidddd` (`userId`),
  KEY `addressid` (`addressId`),
  KEY `orderNumber` (`orderNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderNumber`, `userId`, `addressId`, `totalAmount`, `txnType`, `txnNumber`, `orderStatus`, `orderDate`) VALUES
(7, 982018405, 8, 5, '200.00', 'Debit/Credit Card', '21', 'Cancelled', '2022-04-10 22:54:04'),
(8, 834377015, 8, 5, '809.00', 'Cash on Delivery', '23', 'Delivered', '2022-04-12 04:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `ordersdetails`
--

DROP TABLE IF EXISTS `ordersdetails`;
CREATE TABLE IF NOT EXISTS `ordersdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNumber` bigint(12) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderStatus` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderidd` (`orderNumber`),
  KEY `useridd` (`userId`),
  KEY `productiddd` (`productId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordersdetails`
--

INSERT INTO `ordersdetails` (`id`, `orderNumber`, `userId`, `productId`, `quantity`, `orderDate`, `orderStatus`) VALUES
(11, 982018405, 8, 26, 1, '2022-04-10 22:54:04', NULL),
(12, 834377015, 8, 27, 1, '2022-04-12 04:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

DROP TABLE IF EXISTS `ordertrackhistory`;
CREATE TABLE IF NOT EXISTS `ordertrackhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `actionBy` int(3) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `canceledBy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderidddddd` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `actionBy`, `postingDate`, `canceledBy`) VALUES
(14, 7, 'Cancelled', 'Wrong Product\r\n', NULL, '2022-04-10 22:54:29', 'User'),
(15, 8, 'Delivered', '.', 1, '2022-04-12 04:09:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` decimal(10,2) DEFAULT NULL,
  `productPriceBeforeDiscount` decimal(10,2) DEFAULT NULL,
  `productDescription` longtext,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` decimal(10,2) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `addedBy` int(11) DEFAULT NULL,
  `lastUpdatedBy` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catidddd` (`category`),
  KEY `subCategory` (`subCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `addedBy`, `lastUpdatedBy`) VALUES
(26, 12, 15, 'Ageria 11 inch', 'Opalware', '200.00', '250.00', '100 percent bone ash free\r\nExtra strong - toughened glass\r\nLight weight\r\nDishwasher safe\r\nMicrowave safe\r\nChip resistance\r\nColor: White', 'f7e36d79d7f3e3a182f90f530f1f95ff.jpg', '1a21dfaf331b62f277c13bcc5ede8ce2.jpg', 'f5462439b4d72957ce56babe6e9f7e46.jpg', '0.00', 'In Stock', '2022-04-10 22:22:13', '2022-04-10 22:52:14', 1, 1),
(27, 13, 20, 'Twilight Floral Mixing Bowls with Lid(500ml, 1000ml,1500ml), 3 Pc, White', 'Opalware', '809.00', '849.00', 'Made in India with most advanced German technology as per European standards\r\n100 percent vegetarian, bone ash free and made of green material. Vibrant prints on smooth super white surfaces create dazzling lightweight dinnerware.', '5f4bbfdd9844639db49a9633335f1aae.jpg', 'eaa1d59489d8c3a2ba01eb53154095af.jpg', 'ddbce7265f039872858560d2df03275a.jpg', '0.00', 'In Stock', '2022-04-11 03:25:22', NULL, 1, NULL),
(28, 14, 22, 'Stainless Steel Wall Mount Modern Kitchen Dish and Utensils Storage Organizer Stand Rack - 30 x 31 inch', 'Generic', '1599.00', '2500.00', 'Material : Stainless Steel; Product Dimension : Length 24 Inch x Breadth 18 Inch; Shelves/ Layers : 4\r\nDurable and Premium Built Quality : Durable, Strong and Sturdy construction with premium seamless welding for smooth finish 100 % Non Magnetic Stainless Steel built. The products are produced with intensive details.', 'e2a8f801e5e15245d2cec2638482cb82.jpg', '5e6771b5de8920cc035e2c0fdb068783.jpg', '56b9f30a70f965d0695559c51cc4267a.jpg', '0.00', 'In Stock', '2022-04-11 03:46:50', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategoryName`, `creationDate`, `updationDate`, `createdBy`) VALUES
(15, 12, 'Plates', '2022-04-10 22:11:45', NULL, 1),
(16, 12, 'Bowls', '2022-04-10 22:12:01', NULL, 1),
(17, 12, 'Dessert Plates', '2022-04-10 22:12:26', NULL, 1),
(18, 12, 'Dinner Sets', '2022-04-10 22:13:02', NULL, 1),
(19, 13, 'Serving Boards & Plates', '2022-04-10 22:14:24', NULL, 1),
(20, 13, 'Serveware Sets', '2022-04-10 22:14:43', '2022-04-10 22:14:49', 1),
(21, 13, 'Serving Dishes', '2022-04-10 22:15:44', NULL, 1),
(22, 14, 'Tools', '2022-04-11 03:44:58', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactNumber` bigint(12) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `username`, `password`, `contactNumber`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 45231025890, '2022-01-24 16:21:18', '2022-02-06 08:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `regDate`, `updationDate`) VALUES
(8, 'Jeril Yeldho', 'jeril@gmail.com', 9896934212, '4297f44b13955235245b2497399d7a93', '2022-04-10 22:52:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usseridddd` (`userId`),
  KEY `ppiidd` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
