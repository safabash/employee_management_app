import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      elevation: 0,
      child: Container(
        color: ColorManagerLight.scaffoldBgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Employee management",
                style: TextStyle(
                  color: theme.primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: Icons.abc,
              press: () {},
            ),
            DrawerListTile(
              title: "Recruitment",
              icon: Icons.abc,
              press: () {},
            ),
            DrawerListTile(
              title: "Onboarding",
       icon: Icons.abc,
              press: () {},
            ),
            DrawerListTile(
              title: "Reports",
              icon: Icons.abc,
              press: () {},
            ),
            DrawerListTile(
              title: "Calendar",
        icon: Icons.abc,
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
         icon: Icons.abc,
              press: () {},
            ),
            Spacer(),
       
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? press;

  const DrawerListTile({Key? key, this.title, this.icon, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: ColorManagerLight.scaffoldBgColor,
      ),
      title: Text(
        title ?? '',
        style: TextStyle(color: ColorManagerLight.scaffoldBgColor),
      ),
    );
  }
}
