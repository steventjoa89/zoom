// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:zoom/app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: buttonColor),
          ),
        ),
      ),
    );
  }
}
