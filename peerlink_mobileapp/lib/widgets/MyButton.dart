import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color btnColor;
  final VoidCallback? onPress;
  const MyButton({
    Key? key,
    required this.title,
    required this.btnColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
