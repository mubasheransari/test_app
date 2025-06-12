import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/views/product_details_view.dart';
import 'package:test_app/widgets/product_card.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/search_widget.dart';
import '../bloc/categories_bloc.dart';
import '../bloc/categories_state.dart';

class CategoryDetail extends StatefulWidget {
  String categoryName;
  CategoryDetail({super.key, required this.categoryName});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  TextEditingController searchController = TextEditingController();
  void _onSearchChanged(String query) {
    // context.read<CategoriesBloc>().add(SearchProducts(query));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: widget.categoryName,
          fontFamily: 'playfair',
          fontWeight: FontWeight.w600,
          textSize: 24,
        ),
      ),
      body: Column(
        children: [
          SearchWidget(
            controller: searchController,
            onChanged: _onSearchChanged,
          ),
          Expanded(
            child: BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
              return state.categoriesBeautyEnum == CategoriesBeautyEnum.loaded
                  ? ListView.builder(
                      itemCount: state.beautyCatregoryModel!.products.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            var product =
                                state.beautyCatregoryModel!.products[index];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: context.read<CategoriesBloc>(),
                                  child: ProductDetailsPage(
                                    id: product.id!.toInt(),
                                    title: product.title.toString(),
                                    mainImage: product.thumbnail.toString(),
                                    price: product.price!.toDouble(),
                                    category: product.category.toString(),
                                    brand: product.brand.toString(),
                                    rating: product.rating!.toDouble(),
                                    stock: product.stock!.toInt(),
                                    description: product.description.toString(),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            imagePath: state
                                .beautyCatregoryModel!.products[index].thumbnail
                                .toString(),
                            title: state
                                .beautyCatregoryModel!.products[index].title
                                .toString(),
                            rating: state
                                .beautyCatregoryModel!.products[index].rating!
                                .toDouble(),
                            price: state
                                .beautyCatregoryModel!.products[index].price!
                                .toDouble(),
                            brand: "",
                            category: state
                                .beautyCatregoryModel!.products[index].category!
                                .toString(),
                          ),
                        );
                      })
                  : const Center(child: Text('No data found'));
            }),
          ),
        ],
      ),
    );
  }
}
