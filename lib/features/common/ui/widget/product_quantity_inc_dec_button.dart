import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductQuantityIncreamentDecrementButton extends StatefulWidget {
  const ProductQuantityIncreamentDecrementButton({
    super.key,
    required this.onchange,
  });

  final Function(int) onchange;

  @override
  State<ProductQuantityIncreamentDecrementButton> createState() =>
      _ProductQuantityIncreamentDecrementButtonState();
}

class _ProductQuantityIncreamentDecrementButtonState
    extends State<ProductQuantityIncreamentDecrementButton> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconButton(
            icon: Icons.remove,
            ontap: () {
              if (counter > 0) {
                counter--;
              }
              widget.onchange(counter);
              setState(() {});
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$counter',
            style: const TextStyle(fontSize: 18),
          ),
        ),
        buildIconButton(
            icon: Icons.add,
            ontap: () {
              if (counter < 20) {
                counter++;
                widget.onchange(counter);
              }
              setState(() {});
            })
      ],
    );
  }

  Widget buildIconButton(
      {required IconData icon, required VoidCallback ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: AppColors.themecolor,
            borderRadius: BorderRadius.circular(4)),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
