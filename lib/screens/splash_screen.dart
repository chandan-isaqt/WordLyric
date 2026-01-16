import 'dart:async';

import 'package:dictonary/api/wordofthedayApi/wordday_api.dart';
import 'package:dictonary/controller/getx_controller.dart';
import 'package:dictonary/screens/home_page.dart';
import 'package:get/get.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final Getx getx = Get.find<Getx>();
  @override
  void initState() {
    super.initState();
    wordOfTheDayFun();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              // "assets/whitebg.jpeg",
              Theme.of(context).brightness == Brightness.dark
                  ? "assets/bg.jpeg"
                  : "assets/whitebg.jpeg",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(color: const Color(0xFF101623).withOpacity(0.0)),
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),

                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 10, 109, 190),
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 10,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/applogo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                      Text(
                        "WordLyric",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          // color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Fall in Love with Words",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 150, 150, 150),
                        ),
                      ),

                      const SizedBox(height: 50),
                      LoadingAnimationWidget.discreteCircle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color.fromARGB(255, 7, 38, 96),

                        size: 40,

                        secondRingColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Color(0xFF0F1623)
                            : Colors.white,
                        thirdRingColor: Colors.blue,
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "Developed by Chandan",
                    style: GoogleFonts.fahkwang(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 143, 143, 143),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
