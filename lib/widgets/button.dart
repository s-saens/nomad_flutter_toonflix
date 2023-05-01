import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color fontColor;

  const Button({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: ButtonBar(
        children: [
          Text(
            text,
            style: TextStyle(
              color: fontColor,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: fontColor,
            size: 15,
          ),
        ],
      ),
    );
  }
}
