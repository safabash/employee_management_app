import 'package:employee_management_app/authentication/login/widgets/wave_clip_design.dart';
import 'package:employee_management_app/authentication/controller/auth_controller.dart';
import 'package:employee_management_app/authentication/register/register_screen.dart';
import 'package:employee_management_app/dashboard/dashboard_screen.dart';
import 'package:employee_management_app/shared/constants/button_states.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/widgets/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'package:lottie/lottie.dart';
import 'package:multi_state_button/multi_state_button.dart';

class ScreenRegisterWindows extends StatefulWidget {
  const ScreenRegisterWindows({super.key});

  @override
  State<ScreenRegisterWindows> createState() => _ScreenRegisterWindowsState();
}

final AuthController authController = Get.put(AuthController());
final registerController = MultiStateButtonController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ScreenRegisterWindowsState extends State<ScreenRegisterWindows> {
  @override
  void initState() {
    super.initState();
    registerController.setButtonState = submit;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightMq = size.height;
    final widthMq = size.width;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Stack(
            children: [
              TopClip(
                size: size,
                height: 140.h,
                color: ColorManagerLight.shade1Color,
                clipper: WaveClipperOne(),
              ),
              TopClip(
                size: size,
                height: 120.h,
                color: ColorManagerLight.shade2Color,
                clipper: WaveClipperTwo(),
              ),
              BottomClip(
                size: size,
                height: 130.h,
                color: ColorManagerLight.shade2Color,
                clipper: WaveClipperOne(reverse: true),
              ),
              BottomClip(
                size: size,
                height: 120.h,
                color: ColorManagerLight.shade1Color,
                clipper: WaveClipperTwo(reverse: true),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: heightMq / 2.5,
                  width: widthMq / 2.3,
                  child: Lottie.asset('assets/lottie_assets/auth.json'),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: widthMq / 12, top: heightMq / 6),
              child: SizedBox(
                height: heightMq / 2,
                width: widthMq / 4,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: heightMq / 30),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter your username',
                          hintStyle: theme.textTheme.displayMedium,
                          label: Text(
                            'Username',
                            style: theme.textTheme.labelMedium,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: heightMq / 37),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.lock_rounded),
                          suffixIcon: const Icon(Icons.visibility_off),
                          hintText: 'Enter your password',
                          hintStyle: theme.textTheme.displayMedium,
                          label: Text(
                            'Password',
                            style: theme.textTheme.labelMedium,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      SizedBox(height: heightMq / 37),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.lock_rounded),
                          suffixIcon: const Icon(Icons.visibility_off),
                          hintText: 'Confirm your password',
                          hintStyle: theme.textTheme.displayMedium,
                          label: Text(
                            'Confirm Password',
                            style: theme.textTheme.labelMedium,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const RegisterScreen());
                              },
                              child: Text(
                                'Register',
                                style: theme.textTheme.labelMedium,
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        key: const Key('Register'),
                        controller: registerController,
                        text: 'Register',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            registerController.setButtonState = loading;
                            await authController.register(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            Get.to(() => const Dashboard());
                            registerController.setButtonState = submit;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
