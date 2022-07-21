// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zoom/app/constants/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  final String text;
  final Color buttonColor;
  const HomeMeetingButton({
    Key? key,
    required this.onPress,
    required this.icon,
    required this.text,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: size.width * 0.4,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.white.withOpacity(0.1),
                              offset: const Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.3))),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(text,
                        maxLines: 2,
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
