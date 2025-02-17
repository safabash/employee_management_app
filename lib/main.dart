import 'package:employee_management_app/authentication/login/login_screen.dart';
import 'package:employee_management_app/dashboard/controller/dashboard_controller.dart';
import 'package:employee_management_app/dashboard/dashboard_screen.dart';
import 'package:employee_management_app/firebase_options.dart';
import 'package:employee_management_app/shared/theme/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Replace with your actual dashboard file import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Employee Management',
          initialBinding: BindingsBuilder(() {
            Get.put(DashboardController()); // Initialize the controller
          }),
          debugShowCheckedModeBanner: false,
          theme: getApplicationThemeLight(context),
          home: const ScreenLoginPage(),
        );
      },
    );
  }
}
