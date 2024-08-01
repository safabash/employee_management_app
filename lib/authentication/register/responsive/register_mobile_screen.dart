import 'package:employee_management_app/authentication/controller/auth_controller.dart';
import 'package:employee_management_app/authentication/login/login_screen.dart';
import 'package:employee_management_app/authentication/login/widgets/wave_clip_design.dart';
import 'package:employee_management_app/dashboard/dashboard_screen.dart';
import 'package:employee_management_app/shared/constants/button_states.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:multi_state_button/multi_state_button.dart';

class ScreenRegisterMobile extends StatefulWidget {
  const ScreenRegisterMobile({super.key});

  @override
  State<ScreenRegisterMobile> createState() => _ScreenRegisterMobileState();
}

final AuthController authController = Get.put(AuthController());
final registerController = MultiStateButtonController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ScreenRegisterMobileState extends State<ScreenRegisterMobile> {
  @override
  void initState() {
    super.initState();
    registerController.setButtonState = submit;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final heightMq = size.height;
    final widthMq = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: [
          Stack(
            children: [
              TopClip(
                size: size,
                height: 140,
                color: const Color(0xFFB4CEF3),
                clipper: WaveClipperOne(),
              ),
              TopClip(
                size: size,
                height: 120,
                color: const Color(0xFFECEFFF),
                clipper: WaveClipperTwo(),
              ),
              BottomClip(
                size: size,
                height: 130,
                color: const Color(0xFFECEFFF),
                clipper: WaveClipperOne(reverse: true),
              ),
              BottomClip(
                size: size,
                height: 120,
                color: const Color(0xFFB4CEF3),
                clipper: WaveClipperTwo(reverse: true),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: heightMq / 2.5,
                  width: widthMq / 2.3,
                  child: Lottie.asset('assets/lottie_assets/auth.json'),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: heightMq / 1.4,
              width: widthMq / 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'REGISTER',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: ColorManagerLight.textColor),
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
                      const SizedBox(height: 6),
                      TextFormField(
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: ColorManagerLight.textColor),
                        controller: passwordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.lock_rounded),
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
                        obscureText: false,
                      ),
                      const SizedBox(height: 6),
                      TextFormField(
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: ColorManagerLight.textColor),
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: const Icon(Icons.lock_rounded),
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
                        obscureText: false,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const ScreenLoginPage());
                              },
                              child: Text(
                                'Login',
                                style: theme.textTheme.labelMedium,
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        key: const Key('register'),
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
