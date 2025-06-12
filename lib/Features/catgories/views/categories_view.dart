import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_bloc.dart';
import 'package:test_app/Features/catgories/bloc/categories_state.dart';
import 'package:test_app/widgets/custom_text.dart';
import '../../../widgets/search_widget.dart';
import '../bloc/categories_event.dart';
import 'category_beauty_view.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    print("Search Query: $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomTextWidget(
        text: "Categories",
        fontFamily: 'playfair',
        fontWeight: FontWeight.w600,
        textSize: 24,
      )),
      body: Column(
        children: [
          SearchWidget(
            controller: _searchController,
            onChanged: _onSearchChanged,
          ),
          Expanded(child: BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
            return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
              ),
              itemCount: state.categoryModel!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final urlLink = state.categoryModel![index].url.toString();
                    print("URL HIT ${urlLink}");
                    final url = urlLink.split('.com/').last;
                    context
                        .read<CategoriesBloc>()
                        .add(CategoriesDetails(url: urlLink));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryBeautyView()));
                  },
                  child: MyContainerWithBackground(
                    name: state.categoryModel![index].name.toString(),
                    image: "",
                  ),
                );
              },
            );
          })),
        ],
      ),
    );
  }
}

class MyContainerWithBackground extends StatelessWidget {
  final String name;
  final String image;

  const MyContainerWithBackground(
      {Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(color: Colors.grey
          // image: DecorationImage(
          //   image: NetworkImage(image.toString()),
          //   fit: BoxFit.cover,
          // ),
          ),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
