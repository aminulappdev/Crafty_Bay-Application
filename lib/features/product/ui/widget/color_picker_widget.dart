import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';


class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});

  final List<String> colors;
  final Function(String) onColorSelected;
  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: getColorItems(),
      ),
    );
  }

  List<Widget> getColorItems() {
    List<Widget> colorItemList = [];
    for (var color in widget.colors) {
      Widget item = getColorItemsWidget(
          name: color,
          ontap: () {
            selectedColor = color;
            widget.onColorSelected(selectedColor!);
            setState(() {});
          },
          isSelected: selectedColor == color);
      colorItemList.add(item);
    }
    return colorItemList;
  }

  Widget getColorItemsWidget(
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
