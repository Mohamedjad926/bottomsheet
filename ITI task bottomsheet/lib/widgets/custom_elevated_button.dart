import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.paddingWidth,
    this.bottomSheet,
    this.formKey,
    this.activateBottomSheet = true,
  });
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final double paddingWidth;
  Widget? bottomSheet;
  bool activateBottomSheet;
  GlobalKey<FormState>? formKey;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: Color(0xffFFDE69), width: 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding:
                EdgeInsets.symmetric(horizontal: paddingWidth, vertical: 20),
            backgroundColor: backgroundColor),
        onPressed: () {
          if (activateBottomSheet) {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0xffFFECAA),
              context: context,
              builder: (context) {
                return bottomSheet!;
              },
            );
          } else {
            formKey!.currentState!.validate();
          }
        },
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: textColor),
        ));
  }
}
