import 'package:equatable/equatable.dart';

import '../../../Models/ProductsModel/products_model.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

class GetCategories extends CategoriesEvent {
  const GetCategories();
}

class GetCategoriesBeauty extends CategoriesEvent {
  const GetCategoriesBeauty();
}

class GetProducts extends CategoriesEvent {
  const GetProducts();
}

class GetProductsImageDetails extends CategoriesEvent {
  int id;
  GetProductsImageDetails({required this.id});
}

class SearchProducts extends CategoriesEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}
class AddToFavourites extends CategoriesEvent {
  final ProductModel product;
  AddToFavourites({required this.product});
}

class RemoveFromFavourites extends CategoriesEvent {
  final int productId;
  RemoveFromFavourites({required this.productId});
}