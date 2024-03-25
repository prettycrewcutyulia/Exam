import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {

  final String title;
  final bool selected;
  const CustomButton({super.key, required, required this.title, required this.selected, });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 3,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.white : Colors.pink,
        border: Border.all(color: Colors.pink, width: 2), // добавляем обводку розового цвета
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
