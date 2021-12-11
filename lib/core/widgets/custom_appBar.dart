import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            onTap();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 4.0.w,
          ),
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
