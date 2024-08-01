import 'package:employee_management_app/authentication/register/responsive/register_mobile_screen.dart';
import 'package:employee_management_app/authentication/register/responsive/register_windows_screen.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Responsive(mobile: Builder(builder: (context) {
        return const ScreenRegisterMobile();
      }), tablet: Builder(builder: (context) {
        return const ScreenRegisterWindows();
      }), desktop: Builder(builder: (context) {
        return const ScreenRegisterWindows();
      })),
    );
  }
}
