import 'package:employee_management_app/authentication/controller/auth_controller.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

final AuthController controller = Get.find();

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context)) ...{
            const Spacer(),
            IconButton(
                icon: Icon(
                  Icons.logout,
                  color: ColorManagerLight.textColor,
                ),
                onPressed: () {
                  controller.logout();
                }),
          },
          Text("Dashboard", style: theme.textTheme.titleMedium),
          if (!Responsive.isMobile(context)) ...{
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  child: navigationIcon(icon: Icons.logout),
                  onTap: () {
                    controller.logout();
                  },
                ),
              ],
            )
          }
        ],
      ),
    );
  }

  Widget navigationIcon({icon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        color: ColorManagerLight.textColor,
      ),
    );
  }
}
