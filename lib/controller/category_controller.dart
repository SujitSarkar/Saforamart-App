import 'package:get/get.dart';

class CategoryController extends GetxController {
  final Map<String, List<String>> _categories = {
    "All": [
      "Electronics",
      "Health & Beauty",
      "Cooking Essential",
      "Fruits and Vegetable",
      "Fashion",
      "Organic",
      "Games"
    ],
    "Women clothing": ["Dresses", "Shoes"],
    "Men clothing": ["Shirt", "Paint", "Shoes"],
    "Home Accessories": [
      "Home Decor",
      "Home Furniture",
      "Garden Tool",
      "Kitchen & Dining"
    ],
    "Grocery": ["All Grocery"],
    "Phone & Accessories": ["Phone Cover", "Headphone"],
    "Consumer Electronics": ["AC", "TV", "Fridge", "Gadget", "Fan"],
    "Beauty Product": ["Cream", "Aurganic Product"]
  };

  final _variable = [
    {
      "main": "All",
      "sub": [
        "Electronics",
        "Health & Beauty",
        "Cooking Essential",
        "Fruits and Vegetable",
        "Fashion",
        "Organic",
        "Games"
      ],
    },
    {
      "main": "Women clothing",
      "sub": ["Dresses", "Shoes"]
    },
    {
      "main": "Men clothing",
      "sub": ["Shirt", "Paint", "Shoes"]
    },
    {
      "main": "Home Accessories",
      "sub": [
        "Home Decor",
        "Home Furniture",
        "Garden Tool",
        "Kitchen & Dining"
      ],
    },
    {
      "main": "Grocery",
      "sub": ["All Grocery"],
    },
    {
      "main": "Phone & Accessories",
      "sub": ["Phone Cover", "Headphone"]
    },
    {
      "main": "Consumer Electronics",
      "sub": ["AC", "TV", "Fridge", "Gadget", "Fan"],
    },
    {
      "main": "Beauty Product",
      "sub": ["Cream", "Aurganic Product"]
    },
  ];

  List<String> mainCategory = [
    "Category1",
    "Category2",
    "Category3",
    "Category4",
    "Category5",
    "Category6",
    "Category7",
    "Category8",
    "Category9",
    "Category10",
  ];
  List<String> subCategory = [
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
    "Sub Category",
  ];

  List categoryItems = [
    {
      "name": "category",
      "img": "assets/image/snacks.png",
    }
  ];
  get categories {
    return _categories;
  }

  get variable {
    return _variable;
  }
}
