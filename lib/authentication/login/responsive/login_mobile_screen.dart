import 'package:employee_management_app/authentication/login/widgets/wave_clip_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenLoginMobile extends StatefulWidget {
  const ScreenLoginMobile({super.key});

  @override
  State<ScreenLoginMobile> createState() => _ScreenLoginMobileState();
}

class _ScreenLoginMobileState extends State<ScreenLoginMobile> {
  @override
  Widget build(BuildContext context) {
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
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: SizedBox(
                //     height: heightMq / 1.8,
                //     width: widthMq / 1.6,
                //     child: Lottie.asset(
                //       'assets/lottie_files/login_lottie.json',
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: heightMq / 1.4,
                    width: widthMq / 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: GoogleFonts.poppins(
                                fontSize: 27, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Enter your username',
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffa0a6b9),
                              ),
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
                          const SizedBox(height: 6),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_rounded),
                              suffixIcon: const Icon(Icons.visibility_off),
                              hintText: 'Enter your password',
                              hintStyle: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffa0a6b9),
                              ),
                              label: Text(
                                'Password',
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
                          const SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Password must be at least ',
                                  style: GoogleFonts.inder(
                                      fontSize: 10, color: Colors.black),
                                ),
                                TextSpan(
                                    text: '8 Characters',
                                    style: GoogleFonts.inder(
                                      color: Colors.green[800],
                                      fontSize: 10,
                                    )),
                                TextSpan(
                                  text: 'and must contain at least',
                                  style: GoogleFonts.inder(
                                      fontSize: 10, color: Colors.black),
                                ),
                                TextSpan(
                                    text:
                                        ' a Capital Letter, a Number and a Special Character',
                                    style: GoogleFonts.inder(
                                      color: Colors.green[800],
                                      fontSize: 10,
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                              ),
                              const Text('Remember Me'),
                              const Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.normal),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: widthMq / 2,
                            height: heightMq / 15,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2C82FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
