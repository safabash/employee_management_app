import 'package:employee_management_app/authentication/login/widgets/wave_clip_design.dart';
import 'package:employee_management_app/authentication/controller/auth_controller.dart';
import 'package:employee_management_app/shared/theme/color_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ScreenLoginWindows extends StatefulWidget {
  const ScreenLoginWindows({super.key});

  @override
  State<ScreenLoginWindows> createState() => _ScreenLoginWindowsState();
}

final AuthController authController = Get.put(AuthController());

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _ScreenLoginWindowsState extends State<ScreenLoginWindows> {
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
                padding:
                    EdgeInsets.only(right: widthMq / 12, top: heightMq / 6),
                child: SizedBox(
                  height: heightMq / 2,
                  width: widthMq / 4,
                  child: Column(
                    children: [
                      Text(
                        'LOGIN',
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: heightMq / 30),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter your username',
                          hintStyle: theme.textTheme.displayMedium,
                          label: Text(
                            'Username',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(
                                0xff5570F1,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: heightMq / 37),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_rounded),
                          suffixIcon: const Icon(Icons.visibility_off),
                          hintText: 'Enter your password',
                          hintStyle: theme.textTheme.displayMedium,
                          label: Text('Password',
                              style: theme.textTheme.labelMedium),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Are you a new user',
                        style: theme.textTheme.labelSmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Register ?',
                                style: theme.textTheme.labelMedium,
                              ))
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: widthMq / 6,
                        height: heightMq / 22,
                        child: ElevatedButton(
                          onPressed: () {
                            authController.login(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManagerLight.blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
