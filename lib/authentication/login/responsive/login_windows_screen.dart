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

class ScreenLoginWindows extends StatefulWidget {
  const ScreenLoginWindows({super.key});

  @override
  State<ScreenLoginWindows> createState() => _ScreenLoginWindowsState();
}

final AuthController authController = Get.put(AuthController());
final loginController = MultiStateButtonController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _ScreenLoginWindowsState extends State<ScreenLoginWindows> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginController.setButtonState = submit;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightMq = MediaQuery.of(context).size.height;
    final widthMq = MediaQuery.of(context).size.width;
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
                  child: Lottie.asset(
                    'assets/lottie_assets/auth.json',
                  ),
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
                        'LOGIN',
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: heightMq / 30),
                      TextFormField(
                        controller: emailController,
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: ColorManagerLight.textColor),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter your email',
                          hintStyle: theme.textTheme.displayMedium,
                          label:
                              Text('Email', style: theme.textTheme.labelMedium),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Email validation
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: heightMq / 37),
                      TextFormField(
                        controller: passwordController,
                        obscureText: false,
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: ColorManagerLight.textColor),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.lock_rounded),
                          hintText: 'Enter your password',
                          hintStyle: theme.textTheme.displayMedium,
                          label: Text('Password',
                              style: theme.textTheme.labelMedium),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Are you a new user?',
                        style: theme.textTheme.labelSmall,
                        textAlign: TextAlign.right,
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
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        key: const Key('login'),
                        controller: loginController,
                        text: 'Login',
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            loginController.setButtonState = loading;
                            await authController.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            loginController.setButtonState = submit;

                            // Assuming successful login
                            // Get.to(() => const Dashboard());
                          } else {
                            // Handle validation error
                            loginController.setButtonState = submit;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
