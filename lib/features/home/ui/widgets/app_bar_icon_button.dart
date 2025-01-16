import 'package:flutter/material.dart';

class AppBarIconButtom extends StatelessWidget {
  const AppBarIconButtom({
    super.key,
    required this.icon,
    required this.ontap,
  });
 
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 16,
        child: Icon(
          icon,
          size: 18,
          color: Colors.black45,
        ),
      ),
    );
  }
}