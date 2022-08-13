class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Product.parseJSON(Map<String, dynamic> data) {
    return Product(
      id: data['id'],
      title: data['title'],
      price: data['price'],
      description: data['description'],
      category: data['category'],
      image: data['image'],
      rating: data['rating'] != null ? Rating.parseJSON(data['rating']) : null,
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({this.rate = 0.0, this.count = 0});

  factory Rating.parseJSON(Map<String, dynamic> data) {
    return Rating(
      rate: data['rate'] ?? 0.0,
      count: data['count'] ?? 0,
    );
  }
}
