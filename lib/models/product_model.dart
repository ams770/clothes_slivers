class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String decription;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.decription,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      decription: json['decription'],
      image: json['image'],
    );
  }
}

class LookupData {
  final List<String> categories;
  final List<Product> gridProducts;
  final List<Product> listProducts;

  LookupData({required this.categories, required this.gridProducts, required this.listProducts});

  factory LookupData.fromJson(Map<String, dynamic> json) {
    return LookupData(
      categories: List<String>.from(json['categories']),
      gridProducts: (json['gridProducts'] as List)
          .map((i) => Product.fromJson(i))
          .toList(),
      listProducts: (json['listProducts'] as List)
          .map((i) => Product.fromJson(i))
          .toList(),
    );
  }
}
