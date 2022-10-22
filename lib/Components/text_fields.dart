import 'package:flutter/material.dart';

class RoundedTextFields extends StatelessWidget {
  const RoundedTextFields({super.key, required this.hintText, required this.initialValue});
  final String hintText;
  final String initialValue;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        hintText,
        style: TextStyle(color: Colors.white60),
      ),
      SizedBox(height: 8),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: TextEditingController(text: initialValue),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white60),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    ]);
  }
}
