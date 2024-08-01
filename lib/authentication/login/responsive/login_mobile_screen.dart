import 'package:employee_management_app/authentication/controller/auth_controller.dart';
import 'package:employee_management_app/authentication/login/widgets/wave_clip_design.dart';
import 'package:employee_management_app/authentication/register/register_screen.dart';
import 'package:employee_management_app/dashboard/dashboard_screen.dart';
import 'package:employee_management_app/shared/constants/button_states.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';
import 'package:employee_management_app/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_state_button/multi_state_button.dart';

class ScreenLoginMobile extends StatefulWidget {
  const ScreenLoginMobile({super.key});

  @override
  State<ScreenLoginMobile> createState() => _ScreenLoginMobileState();
}

final AuthController authController = Get.put(AuthController());
final loginController = MultiStateButtonController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _ScreenLoginMobileState extends State<ScreenLoginMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginController.setButtonState = submit;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final heightMq = MediaQuery.of(context).size.height;
    final widthMq = MediaQuery.of(context).size.width;

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
                  child: Lottie.asset(
                    'assets/lottie_assets/auth.json',
                  ),
                ),
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
                            'LOGIN',
                            style: GoogleFonts.poppins(
                                fontSize: 27, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            style: theme.textTheme.labelMedium
                                ?.copyWith(color: ColorManagerLight.textColor),
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Enter your email',
                              hintStyle: theme.textTheme.displayMedium,
                              label: Text('Email',
                                  style: theme.textTheme.labelMedium),
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
                          const SizedBox(height: 6),
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
                          const SizedBox(height: 5),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
