import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error_outline,
        size: 20.0.w,
      ),
    );
  }
}
