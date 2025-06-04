import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/views/product_details_view.dart';

import '../../../widgets/custom_text.dart';
import '../../../widgets/product_card.dart';
import '../../../widgets/search_widget.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_event.dart';
import '../bloc/categories_state.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    context.read<CategoriesBloc>().add(SearchProducts(query));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: "Products",
          fontFamily: 'playfair',
          fontWeight: FontWeight.w600,
          textSize: 24,
        ),
      ),
      body: Column(
        children: [
          SearchWidget(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
          Expanded(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                final String query = _searchController.text.trim();
                if (state.productsEnum == ProductsEnum.loaded) {
                  final List products = _searchController.text.isEmpty
                      ? state.productsModel ?? []
                      : state.filteredProductsModel ?? [];
                  if (products.isEmpty && query.isNotEmpty) {
                    return const Center(child: Text("No products found"));
                  }

                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: context.read<CategoriesBloc>(),
                                child: ProductDetailsPage(
                                  id: product.id,
                                  title: product.title,
                                  mainImage: product.thumbnail,
                                  price: product.price!.toDouble(),
                                  category: product.category.toString(),
                                  brand: product.brand.toString(),
                                  rating: product.rating!.toDouble(),
                                  stock: product.stock!.toInt(),
                                  description: product.description,
                                ),
                              ),
                            ),
                          );

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProductDetailsPage(
                          //       id: product.id,
                          //       title: product.title.toString(),
                          //       mainImage: product.thumbnail,
                          //       price: product.price!.toDouble(),
                          //       category: product.category.toString(),
                          //       brand: product.brand.toString(),
                          //       rating: product.rating!.toDouble(),
                          //       stock: product.stock!.toInt(),
                          //       description: product.description,
                          //     ),
                          //   ),
                          // );
                          context.read<CategoriesBloc>().add(
                              GetProductsImageDetails(
                                  id: int.parse(product.id.toString())));
                        },
                        child: ProductCard(
                          imagePath: product.thumbnail,
                          title: product.title,
                          rating: product.rating!.toDouble(),
                          price: product.price!.toDouble(),
                          brand: product.brand.toString(),
                          category: product.category.toString(),
                        ),
                      );
                    },
                  );
                } else if (state.productsEnum == ProductsEnum.initial) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('No products found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


// class ProductView extends StatefulWidget {
//   const ProductView({super.key});

//   @override
//   State<ProductView> createState() => _ProductViewState();
// }

// class _ProductViewState extends State<ProductView> {
//   final TextEditingController _searchController = TextEditingController();

//   void _onSearchChanged(String query) {
//     print("Search Query: $query");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const CustomTextWidget(
//         text: "Products",
//         fontFamily: 'playfair',
//         fontWeight: FontWeight.w600,
//         textSize: 24,
//       )),
//       body: Column(
//         children: [
//           SearchWidget(
//             controller: _searchController,
//             onChanged: _onSearchChanged,
//           ),
//           Expanded(
//             child: BlocBuilder<CategoriesBloc, CategoriesState>(
//               builder: (context, state) {
//                 return state.productsEnum == ProductsEnum.loaded
//                     ? ListView.builder(
//                         itemCount: state.productsModel!.length,
//                         itemBuilder: (context, index) {
//                           final product = state.productsModel![index];
//                           return InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ProductDetailsPage(
//                                             id: product.id,
//                                             title: product.title.toString(),
//                                             mainImage: product.thumbnail,
//                                             price: product.price!.toDouble(),
//                                             category:
//                                                 product.category.toString(),
//                                             brand: product.brand.toString(),
//                                             rating: product.rating!.toDouble(),
//                                             stock: product.stock!.toInt(),
//                                             description: product.description,
//                                           )));
//                               print("${product.id}");
//                               context.read<CategoriesBloc>().add(
//                                   GetProductsImageDetails(
//                                       id: int.parse(product.id.toString())));
//                             },
//                             child: ProductCard(
//                               imagePath: product.thumbnail,
//                               title: product.title,
//                               rating: product.rating!.toDouble(),
//                               price: product.price!.toDouble(),
//                               brand: product.brand.toString(),
//                               category: product.category.toString(),
//                             ),
//                           );
//                         },
//                       )
//                     : Center(child: Text('loading'));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
