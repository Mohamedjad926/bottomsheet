import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text1,
    required this.text2,
    required this.bottomSheet,
  });
  final String text1;
  final String text2;
  final Widget bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Color(0xff050522),
            fontSize: 18,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0xffFFECAA),
              context: context,
              builder: (context) {
                return bottomSheet;
              },
            );
          },
          child: Text(
            text2,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
