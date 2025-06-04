import 'dart:convert';

BeautyCatregoryModel beautyCatregoryModelFromJson(String str) =>
    BeautyCatregoryModel.fromJson(json.decode(str));

String beautyCatregoryModelToJson(BeautyCatregoryModel data) =>
    json.encode(data.toJson());

class BeautyCatregoryModel {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  BeautyCatregoryModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory BeautyCatregoryModel.fromJson(Map<String, dynamic> json) =>
      BeautyCatregoryModel(
        products: (json["products"] as List<dynamic>?)
            ?.map((x) => Product.fromJson(x))
            .toList(),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products?.map((x) => x.toJson()).toList(),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: (json["price"] as num?)?.toDouble(),
        discountPercentage: (json["discountPercentage"] as num?)?.toDouble(),
        rating: (json["rating"] as num?)?.toDouble(),
        stock: json["stock"],
        tags:
            (json["tags"] as List<dynamic>?)?.map((e) => e as String).toList(),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: json["dimensions"] != null
            ? Dimensions.fromJson(json["dimensions"])
            : null,
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: json["shippingInformation"],
        availabilityStatus: json["availabilityStatus"],
        reviews: (json["reviews"] as List<dynamic>?)
            ?.map((x) => Review.fromJson(x))
            .toList(),
        returnPolicy: json["returnPolicy"],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: json["meta"] != null ? Meta.fromJson(json["meta"]) : null,
        images: (json["images"] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags,
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": reviews?.map((x) => x.toJson()).toList(),
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images": images,
        "thumbnail": thumbnail,
      };
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json["width"] as num?)?.toDouble(),
        height: (json["height"] as num?)?.toDouble(),
        depth: (json["depth"] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] != null
            ? DateTime.tryParse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.tryParse(json["updatedAt"])
            : null,
        barcode: json["barcode"],
        qrCode: json["qrCode"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: json["date"] != null ? DateTime.tryParse(json["date"]) : null,
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date?.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}
