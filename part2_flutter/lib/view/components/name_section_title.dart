import 'package:flutter/material.dart';

class NameSectionTitle extends StatelessWidget {

  final String title;
  const NameSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(title, style: const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 24
    ),
    ),
    );
  }
}
