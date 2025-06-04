import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_event.dart';
import 'package:test_app/Features/catgories/bloc/categories_state.dart';

import '../../../Models/ProductsModel/products_model.dart';
import '../../../Repositories/catgories_repository.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesState()) {
    on<GetCategories>(getCategories);
    on<GetCategoriesBeauty>(getCateogoriesBeauty);
    on<GetProducts>(getProducts);
    on<GetProductsImageDetails>(getProductsImageDetails);
    on<SearchProducts>(searchProducts);
    on<AddToFavourites>(addToFavourites);
    on<RemoveFromFavourites>(removeFromFavourites);
  }

  CategoriesRepository categoriesRepository = CategoriesRepository();

  getCategories(GetCategories event, emit) async {
    try {
      final categories = await categoriesRepository.getCategories();
      emit(state.copyWith(
        categoryModel: categories,
        categoriesEnum: CategoriesEnum.loaded,
      ));
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        categoriesEnum: CategoriesEnum.initial, 
      ));
    }
  }

  getCateogoriesBeauty(GetCategoriesBeauty event, emit) async {
    try {
      final categories = await categoriesRepository.getCategoriesBeauty();
      emit(state.copyWith(
        beautyCatregoryModel: categories, 
        categoriesBeautyEnum: CategoriesBeautyEnum.loaded,
      ));
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        categoriesBeautyEnum:
            CategoriesBeautyEnum.initial, 
      ));
    }
  }

  getProducts(GetProducts event, emit) async {
    emit(state.copyWith(
      productsEnum: ProductsEnum.initial,
    ));
    try {
      final products = await categoriesRepository.fetchProducts();
      print("FETCH PRODUCTS $products");
      print("FETCH PRODUCTS $products");
      print("FETCH PRODUCTS $products");
      emit(state.copyWith(
        productsModel: products,
        productsEnum: ProductsEnum.loaded,
      ));
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        productsEnum: ProductsEnum.initial, // Or handle error state
      ));
    }
  }

  getProductsImageDetails(GetProductsImageDetails event, emit) async {
    emit(state.copyWith(
      productDetailsEnum: ProductDetailsEnum.initial, // Or handle error state
    ));
    try {
      final products = await categoriesRepository.fetchProductImages(event.id);
      print("getProductsImageDetails $products");
      print("getProductsImageDetails $products");
      print("getProductsImageDetails $products");
      emit(state.copyWith(
        productImagesModel: products, 
        productDetailsEnum: ProductDetailsEnum.loaded,
      ));
    } catch (e) {
      print('Error: $e');
      emit(state.copyWith(
        productDetailsEnum: ProductDetailsEnum.initial,
      ));
    }
  }

  void searchProducts(SearchProducts event, Emitter<CategoriesState> emit) {
    final query = event.query.toLowerCase();

    if (state.productsModel != null) {
      final filtered = state.productsModel!.where((product) {
        final title = product.title.toLowerCase();
        final brand = product.brand?.toLowerCase() ?? '';
        return title.contains(query) || brand.contains(query);
      }).toList();

      emit(state.copyWith(filteredProductsModel: filtered));
    }
  }

  addToFavourites(AddToFavourites event, emit) {
    final updatedFavourites = List<ProductModel>.from(state.favouriteProducts)
      ..add(event.product);

    emit(state.copyWith(favouriteProducts: updatedFavourites));
  }

  removeFromFavourites(RemoveFromFavourites event, emit) {
    final updatedFavourites = List<ProductModel>.from(state.favouriteProducts)
      ..removeWhere((product) => product.id == event.productId);

    emit(state.copyWith(favouriteProducts: updatedFavourites));
  }
}
