import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
                icon: Icon(
                  Icons.menu,
                  color: ColorManagerLight.textColor,
                ),
                onPressed: () {}),
          Text("Dashboard", style: theme.textTheme.titleMedium),
          if (!Responsive.isMobile(context)) ...{
            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                navigationIcon(icon: Icons.search),
                navigationIcon(icon: Icons.send),
                navigationIcon(icon: Icons.notifications_none_rounded),
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
