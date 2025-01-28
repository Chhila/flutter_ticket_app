import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/style/app_styles.dart';

class AppDoubleText extends StatelessWidget {
  final String smallText;
  final String bigText;
  final VoidCallback func;
  AppDoubleText({super.key, required this.smallText, required this.bigText, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            bigText,
            style: AppStyles.headLineStyle2,
          ),
          InkWell(
            onTap: func,
            child: Text(smallText, style: AppStyles.headLineStyle3.copyWith(color: AppStyles.primaryColor)),
          ),
        ],
      ),
    );
  }
}
