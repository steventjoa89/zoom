// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zoom/app/constants/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final String text;
  const HomeMeetingButton({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(text, style: const TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}
