import 'dart:convert';
import 'package:test_app/Models/ProductsModel/products_model.dart';
import '../Constants/constants.dart';
import '../Models/CategoryModel/beauty_category.dart';
import '../Models/CategoryModel/category_model.dart';
import '../Models/ProductsModel/product_images_model.dart';
import '../Service/api_basehelper.dart';
import 'package:http/http.dart' as http;

class CategoriesRepository {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<CategoryModel>> getCategories() async {
    final response = await apiBaseHelper.get(
      url: Constants.baseUrl,
      path: Constants.categoriesApi,
    );

    print("Response $response");

    if (response is List) {
      return categoryModelFromJson(json.encode(response));
    } else {
      throw Exception('Expected a list response');
    }
  }

  Future<List<BeautyCatregoryModel>> getCategoriesBeauty() async {
    final response = await apiBaseHelper.get(
      url: Constants.baseUrl,
      path: Constants.beautyCategoryApi,
    );

    print("Response $response");

    if (response is Map && response.containsKey('products')) {
      final List<dynamic> productList = response['products'];
      return productList
          .map((item) => BeautyCatregoryModel.fromJson(item))
          .toList();
    } else {
      throw Exception('Expected a map with "products" key');
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await apiBaseHelper.get(
        url: Constants.baseUrl,
        path: Constants.getProducts,
        queryParam: {'limit': '100'},
      );
      final List<dynamic> productsJson = response['products'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  Future<ProductImagesModel> fetchProductImages(int productId) async {
    try {
      final response = await apiBaseHelper.get(
        url: Constants.baseUrl,
        path: '/products/$productId',
      );

      return ProductImagesModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to load images: $e');
    }
  }

fetchCategory(String category) async {
    try {
            final response = await http
          .get(Uri.parse(category));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Ensure JSON contains products and default to empty list if not
        if (jsonData is Map<String, dynamic>) {
          return BeautyCatregoryModel.fromJson(jsonData);
        } else {
          throw Exception("Unexpected data format");
        }
      } else {
        throw Exception(
            'Failed to load beauty category: ${response.statusCode}');
      }
    } catch (e) {
      // Log or handle error
      print('Error fetching beauty category: $e');
      // Return an empty model to prevent null usage in UI
      return BeautyCatregoryModel(products: []);
    }
  }

  // Future<List<BeautyCatregoryModel>> categoriesDetials(String url) async {
  //   final response = await apiBaseHelper.get(
  //     url: Constants.baseUrl,
  //     path: url,
  //   );

  //   print("Response $response");

  //   if (response is Map && response.containsKey('products')) {
  //     final List<dynamic> productList = response['products'];
  //     return productList
  //         .map((item) => BeautyCatregoryModel.fromJson(item))
  //         .toList();
  //   } else {
  //     throw Exception('Expected a map with "products" key');
  //   }
  // }
}
