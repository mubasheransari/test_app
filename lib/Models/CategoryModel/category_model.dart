import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
    String? slug;
    String? name;
    String? url;

    CategoryModel({
         this.slug,
         this.name,
         this.url,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        slug: json["slug"] ??"",
        name: json["name"]??"",
        url: json["url"]??"",
    );

    Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "url": url,
    };
}
