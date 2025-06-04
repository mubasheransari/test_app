import 'package:test_app/Models/ProductsModel/products_model.dart';
import '../../../Models/CategoryModel/beauty_category.dart';
import '../../../Models/CategoryModel/category_model.dart';
import '../../../Models/ProductsModel/product_images_model.dart';

enum CategoriesEnum { initial, loading, loaded }

enum CategoriesBeautyEnum { initial, loading, loaded }

enum ProductsEnum { initial, loading, loaded }

enum ProductDetailsEnum { initial, loading, loaded }

class CategoriesState {
  CategoriesState(
      {this.categoriesEnum = CategoriesEnum.initial,
      this.categoryModel = const [],
      this.categoriesBeautyEnum = CategoriesBeautyEnum.initial,
      this.beautyCatregoryModel,
      this.productsEnum = ProductsEnum.initial,
      this.productsModel,
      this.filteredProductsModel,
      this.productDetailsEnum = ProductDetailsEnum.initial,
      this.productImagesModel,
      this.favouriteProducts =const [] });

  final CategoriesEnum? categoriesEnum;
  List<CategoryModel>? categoryModel;
  final CategoriesBeautyEnum? categoriesBeautyEnum;
  List<BeautyCatregoryModel>? beautyCatregoryModel;
  final ProductsEnum? productsEnum;
  List<ProductModel>? productsModel;
  final List<ProductModel>? filteredProductsModel;
  final ProductDetailsEnum productDetailsEnum;
  ProductImagesModel? productImagesModel;
  final List<ProductModel> favouriteProducts;

  CategoriesState copyWith(
      {CategoriesEnum? categoriesEnum,
      List<CategoryModel>? categoryModel,
      CategoriesBeautyEnum? categoriesBeautyEnum,
      List<BeautyCatregoryModel>? beautyCatregoryModel,
      ProductsEnum? productsEnum,
      List<ProductModel>? productsModel,
      List<ProductModel>? filteredProductsModel,
      ProductDetailsEnum? productDetailsEnum,
      ProductImagesModel? productImagesModel,
      final List<ProductModel>? favouriteProducts}) {
    return CategoriesState(
        categoriesEnum: categoriesEnum ?? this.categoriesEnum,
        categoryModel: categoryModel ?? this.categoryModel,
        categoriesBeautyEnum: categoriesBeautyEnum ?? this.categoriesBeautyEnum,
        beautyCatregoryModel: beautyCatregoryModel ?? this.beautyCatregoryModel,
        productsEnum: productsEnum ?? this.productsEnum,
        productsModel: productsModel ?? this.productsModel,
        filteredProductsModel:
            filteredProductsModel ?? this.filteredProductsModel,
        productDetailsEnum: productDetailsEnum ?? this.productDetailsEnum,
        productImagesModel: productImagesModel ?? this.productImagesModel,
        favouriteProducts: favouriteProducts ?? this.favouriteProducts);
  }
}

