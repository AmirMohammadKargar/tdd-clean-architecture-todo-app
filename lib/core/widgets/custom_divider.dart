import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5.w,
    );
  }
}
