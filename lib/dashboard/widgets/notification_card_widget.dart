import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManagerLight.primaryColor,
          borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(
                      fontSize: 16, color: ColorManagerLight.textColor),
                  children: [
                    TextSpan(
                        text: "Good Morning ",
                        style: TextStyle(
                          color: ColorManagerLight.scaffoldBgColor,
                        )),
                    TextSpan(
                      text: "User",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorManagerLight.scaffoldBgColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Today you have 9 New Applications.\nAlso you need to hire 2 new UX Designers. 1\nReact Native Developer",
                style: TextStyle(
                  fontSize: 14,
                  color: ColorManagerLight.scaffoldBgColor,
                  height: 1.5,
                ),
              ),
            ],
          ),
          if (MediaQuery.of(context).size.width >= 620) ...{
            Spacer(),
            // Image.asset(
            //   "assets/notification_image.png",
            //   height: 160,
            // )
          }
        ],
      ),
    );
  }
}
