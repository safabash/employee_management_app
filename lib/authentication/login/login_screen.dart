
import 'package:employee_management_app/authentication/login/responsive/login_mobile_screen.dart';
import 'package:employee_management_app/authentication/login/responsive/login_windows_screen.dart';
import 'package:employee_management_app/shared/utils/responsive.dart';
import 'package:flutter/material.dart';



class ScreenLoginPage extends StatelessWidget {
  const ScreenLoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Responsive(mobile: Builder(builder: (context) {
       
        return  const ScreenLoginMobile();
      }), tablet: Builder(builder: (context) {
       
        return const ScreenLoginWindows();
      }), desktop: Builder(builder: (context) {
        
        return const ScreenLoginWindows();
      })),
    );
  }
}