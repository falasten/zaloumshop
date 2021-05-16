import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/1612852566062.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Lays Chips",
    price: 3,
    description: "Family Size Classic Lays Chips",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/1612852566059.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Lays Chips",
    price: 3,
    description: "Lays Chips Bekoh flavor",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/1612852566064.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Jam of Roses",
    price: 20,
    description: "250 gm Jam of Roses from Beytoti",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/1612852566067.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Green fig jam",
    price: 20.20,
    description: "250 gm green fig jam from Beytoti",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/1612852566073.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "White beans",
    price: 10,
    description: "200 gm white beans from Beytoti",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/1612852566079.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Dry Chickpeas",
    price: 7,
    description: "200 gm Dry Chickpeas from Beytoti",
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/coolranchdo.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Doritos Chips",
    price: 3,
    description: "Family Size Classic Lays Chips",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
Product(
    id: 8,
    images: [
      "assets/images/nachodo.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Doritos Chips",
    price: 3,
    description: "Family Size Classic Lays Chips",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 9,
    images: [
      "assets/images/yugart.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Lays Chips",
    price: 3,
    description: "Family Size Classic Lays Chips",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

List<Product> favProducts=demoProducts.where((element) => element.isFavourite).toList();
