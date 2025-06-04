class ProductModel {
  final int id;
  final String title;
  final String description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final List<String>? tags;
  final List<String> images;
  final String thumbnail;
  final Dimensions? dimensions;
  final List<Review> reviews;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.tags,
    required this.images,
    required this.thumbnail,
    this.dimensions,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'],
      brand: json['brand'],
      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList(),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
      dimensions: json['dimensions'] != null
          ? Dimensions.fromJson(json['dimensions'])
          : null,
      reviews: (json['reviews'] as List? ?? [])
          .map((e) => Review.fromJson(e))
          .toList(),
    );
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );
  }
}

class Review {
  final int rating;
  final String comment;
  final String reviewerName;
  final String reviewerEmail;
  final DateTime date;

  Review({
    required this.rating,
    required this.comment,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
      date: DateTime.parse(json['date']),
    );
  }
}

