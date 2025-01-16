
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    super.key, required this.textEditingController,
  });
  
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search,color: Colors.grey,)
      ),
    
    );
  }
}