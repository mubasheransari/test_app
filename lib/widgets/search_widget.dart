import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  SearchWidget({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        // width: 348,
        height: 49,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}
