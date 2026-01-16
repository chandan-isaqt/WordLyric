import 'package:dictonary/controller/getx_controller.dart';
import 'package:dictonary/screens/about_us.dart';
import 'package:dictonary/screens/help_support.dart';
import 'package:dictonary/screens/privacy_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final Getx getx = Get.find<Getx>();

  @override
  Widget build(BuildContext context) {
    final checkFinalDark = Get.isDarkMode;
    return Scaffold(
      // backgroundColor: const Color(0xFF101623),
      appBar: AppBar(title: Text("Settings")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "DISPLAY",
                  style: GoogleFonts.averiaLibre(
                    // color: Color(0xFF919FB4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  // color: Color(0xFF919FB4),
                  child: Divider(thickness: 0.4),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1E293B)
                    : Colors.white,
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : const Color(0xFFE3E8F0),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: checkFinalDark
                                  ? Color(0xFF1C2D4D)
                                  : const Color(0xFFE7EEFD),

                              radius: 18,
                              child: Icon(
                                Icons.language,
                                size: 20,

                                color: Color(0xFF145BEC),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "Language",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "English",
                          style: TextStyle(color: const Color(0xFF778599)),
                        ),
                      ],
                    ),
                  ),

                  // color: Color.fromARGB(255, 59, 77, 105)
                  Divider(height: 1, color: Theme.of(context).dividerColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: checkFinalDark
                                  ? Color(0xFF1C2D4D)
                                  : const Color(0xFFE7EEFD),
                              radius: 18,
                              child: Icon(
                                Icons.text_fields,
                                size: 20,
                                color: Color(0xFF145BEC),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "Word of the day",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Obx(() {
                          return Switch(
                            value: getx.ischeckWordOfTheDay.value,
                            onChanged: (value) {
                              getx.ischeckWordOfTheDay.value = value;
                            },
                            activeColor: const Color.fromARGB(255, 2, 72, 213),
                            activeTrackColor: const Color(0xFF778599),
                            inactiveThumbColor: const Color(0xFF253042),
                            inactiveTrackColor: const Color(0xFF919FB4),
                          );
                        }),
                      ],
                    ),
                  ),
                  // color: Color.fromARGB(255, 59, 77, 105)
                  Divider(height: 0.1, color: Theme.of(context).dividerColor),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: checkFinalDark
                                  ? Color(0xFF1C2D4D)
                                  : const Color(0xFFE7EEFD),
                              radius: 18,
                              child: Icon(
                                Icons.dark_mode,
                                size: 20,
                                color: Color(0xFF145BEC),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              "Light Mode",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                // color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Obx(
                          () => Switch(
                            value: getx.isDarkCheck.value,
                            onChanged: (value) {
                              getx.toggleTheme(value);
                            },
                            activeColor: const Color.fromARGB(255, 2, 72, 213),
                            activeTrackColor: const Color(0xFF778599),
                            inactiveThumbColor: const Color(0xFF253042),
                            inactiveTrackColor: const Color(0xFF919FB4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Text(
                  "SUPPORT",
                  style: GoogleFonts.averiaLibre(
                    // color: Color(0xFF919FB4),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  // color: Color(0xFF919FB4),
                  child: Divider(thickness: 0.4),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xFF1E293B)
                    : Colors.white,
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : const Color(0xFFE3E8F0),
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: checkFinalDark
                              ? Color(0xFF1C2D4D)
                              : const Color(0xFFE7EEFD),
                          radius: 18,
                          child: Icon(
                            Icons.info_outline,
                            size: 20,
                            color: Color(0xFF145BEC),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "About Us",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            // color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => Aboutus(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 300),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            // color: const Color(0xFF778599),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: Theme.of(context).dividerColor),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: checkFinalDark
                              ? Color(0xFF1C2D4D)
                              : const Color(0xFFE7EEFD),
                          radius: 18,
                          child: Icon(
                            Icons.help_outline,
                            size: 20,
                            color: Color(0xFF145BEC),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Help & Support",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            // color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => Help(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 300),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            // color: const Color(0xFF778599),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(height: 1, color: Theme.of(context).dividerColor),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: checkFinalDark
                              ? Color(0xFF1C2D4D)
                              : const Color(0xFFE7EEFD),
                          radius: 18,
                          child: Icon(
                            Icons.privacy_tip_outlined,
                            size: 20,
                            color: Color(0xFF145BEC),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Privacy Policy",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            // color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => Privacy(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 300),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            // color: const Color(0xFF778599),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1, color: Theme.of(context).dividerColor),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: checkFinalDark
                              ? Color(0xFF1C2D4D)
                              : const Color(0xFFE7EEFD),
                          radius: 18,
                          child: const Icon(
                            Icons.star,
                            size: 20,
                            color: Color(0xFF145BEC),
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          "Rate app",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            // color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            if (getx.isRating.value) {
                              if (!Get.isSnackbarOpen) {
                                Get.snackbar(
                                  "Oops! 😔",
                                  "You already submitted your rating.",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    53,
                                    62,
                                    80,
                                  ),
                                  colorText: Colors.white,
                                  margin: EdgeInsets.all(10),
                                  borderRadius: 8,
                                  duration: Duration(seconds: 1),
                                );
                              }
                            } else {
                              Get.defaultDialog(
                                title: "Rate App",
                                backgroundColor: checkFinalDark
                                    ? Color(0xFF1E293B)
                                    : Color.fromARGB(255, 255, 255, 255),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("How would you rate this app?"),
                                    SizedBox(height: 10),
                                    RatingBar.builder(
                                      initialRating: 0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        if (!getx.isRating.value) {
                                          getx.isRating.value = true;
                                          Get.back();

                                          if (!Get.isSnackbarOpen) {
                                            Get.snackbar(
                                              "Thank you! 🌟",
                                              "Your rating has been recorded.",
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor: Color.fromARGB(
                                                255,
                                                52,
                                                102,
                                                201,
                                              ),
                                              colorText: Colors.white,
                                              margin: EdgeInsets.all(10),
                                              borderRadius: 8,
                                              duration: Duration(seconds: 1),
                                            );
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
