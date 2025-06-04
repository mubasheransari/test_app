class ProductImagesModel {
  final List<String> images;

  ProductImagesModel({required this.images});

  factory ProductImagesModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> rawImages = json['images'] ?? [];
    List<String> imageUrls = rawImages.map((e) => e.toString()).toList();

    return ProductImagesModel(images: imageUrls);
  }
}
