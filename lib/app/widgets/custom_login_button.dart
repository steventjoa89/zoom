import 'package:flutter/material.dart';
import 'package:zoom/app/constants/colors.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const CustomLoginButton({
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
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png',
                  ),
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
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
