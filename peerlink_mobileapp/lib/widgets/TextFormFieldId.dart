import 'package:flutter/material.dart';
import 'package:peerlink_mobileapp/res/colors/app_color.dart';

class TextFormFieldId extends StatelessWidget {
  final String hintText;
  final Function sendTextFieldValue;
  const TextFormFieldId({
    super.key,
    required this.hintText,
    required this.sendTextFieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Container(
          padding: const EdgeInsets.only(top: 25),
          child: const Icon(
            Icons.person,
          ),
        ),
        errorStyle: const TextStyle(
          fontSize: 10,
        ),
        contentPadding: const EdgeInsets.only(
          // bottom: 20,
          top: 20,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.blackColor.withOpacity(0.3),
          fontSize: 12,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Id";
        }
        return null;
      },
      onSaved: (value) {
        // _id = int.parse(value!);
        // Fluttertoast.showToast(msg: "value : $value");
        sendTextFieldValue(value);
      },
    );
  }
}
