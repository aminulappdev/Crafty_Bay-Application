import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';


class SizePickerWidget extends StatefulWidget {
  const SizePickerWidget({super.key, required this.sizes, required this.onSizeSelected});

  final List<String> sizes;
  final Function(String) onSizeSelected;
  @override
  State<SizePickerWidget> createState() => _SizePickerWidgetState();
}

class _SizePickerWidgetState extends State<SizePickerWidget> {
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getSizeItems(),
      ),
    );
  }

  List<Widget> getSizeItems() {
    List<Widget> sizeItemList = [];
    for (var size in widget.sizes) {
      Widget item = getSizeItemsWidget(
          name: size,
          ontap: () {
            selectedSize = size;
            widget.onSizeSelected(selectedSize!);
            setState(() {});
          },
          isSelected: selectedSize == size);
      sizeItemList.add(item);
    }
    return sizeItemList;
  }

  Widget getSizeItemsWidget(
      {required String name,
      required VoidCallback ontap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(),
            color: isSelected ? AppColors.themecolor : Colors.transparent),
        alignment: Alignment.center,
        child: Text(name),
      ),
    );
  }
}
