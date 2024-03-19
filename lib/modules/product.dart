class Product {
  Product(
      {this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category,
      required this.rate,
      this.count,
      this.isLiked});

  factory Product.fromJson(
    Map<String, dynamic> json
  ) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rate:json['rate'],
      count: json['count'],
      isLiked: json['isLiked'],
    );
  }

  int? id;

  String title;

  double price;

  String description;

  String image;

  String category;

  double? rate;

  int? count;

  String? isLiked;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
      'isLiked': isLiked,
      'count':count,
      'rate': rate
    };
  }
}
