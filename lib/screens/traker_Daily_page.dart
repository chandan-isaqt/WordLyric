import 'package:dictonary/controller/getx_controller.dart';
import 'package:dictonary/screens/main_quiz_page.dart';
import 'package:dictonary/widgets/daily_check_wideget.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DailyTraker extends StatefulWidget {
  const DailyTraker({super.key});

  @override
  State<DailyTraker> createState() => _DailyTrakerState();
}

class _DailyTrakerState extends State<DailyTraker> {
  final Getx getx = Get.find<Getx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Daily Goal Tracker',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Obx(
                    () => CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 14.0,
                      animation: true,
                      animationDuration: 1200,
                      percent: getx.progressDailyCheck.value,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                          ? Color(0xFF182234)
                          : Color(0xFFE6EAF0),
                      progressColor:
                          Theme.of(context).brightness == Brightness.dark
                          ? Color(0xFF256AF4)
                          : Colors.blue,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(getx.progressDailyCheck.value * 100).toInt()}%",
                            style: const TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              // color: Colors.black,
                            ),
                          ),

                          SizedBox(height: 8),
                          Text(
                            'DAILY GOAL',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB0B8C1),
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF182234)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Color(0xFF2D2A30)
                              : Color(0xFFFFF3E6),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.whatshot),
                            color: const Color.fromARGB(255, 254, 107, 9),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Growth happens daily',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                // color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Current Streak",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                          3,
                          (index) => Container(
                            width: 8,
                            height: 25,
                            margin: EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFF3B82F6),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Daily Quests',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 0.4)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Obx(
                () => Dailyiteam(
                  icon: Icons.search,
                  iconColor: Color(0xFF3B82F6),
                  iconBgColor: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFF192947)
                      : Color(0xFFDEEBFF),
                  title: 'Search 5 new words',
                  subtitle: 'Expand your vocabulary',
                  progress: getx.countForSearch.value,
                  total: 5,
                ),
              ),
              SizedBox(height: 12),

              Obx(
                () => Dailyiteam(
                  icon: Icons.timer,
                  iconColor: Color(0xFF8B5CF6),
                  iconBgColor: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFF252747)
                      : Color(0xFFF3E8FF),
                  title: 'Complete 1 Speed Quiz',
                  subtitle: 'Test your reflexes',
                  progress: getx.mainProgress2.value == 5 ? 1 : 0,
                  total: 1,
                ),
              ),

              SizedBox(height: 12),

              Obx(
                () => Dailyiteam(
                  icon: getx.isdailyGoalSave.value == true
                      ? Icons.check
                      : Icons.add,
                  iconColor: Color(0xFF10B981),
                  iconBgColor: Theme.of(context).brightness == Brightness.dark
                      ? Color.fromARGB(66, 69, 82, 75)
                      : Color(0xFFD1FAE5),
                  title: 'Save 1 word to favorites',
                  subtitle: '',
                  progress: getx.isdailyGoalSave.value == true ? 1 : 0,
                  total: 1,
                ),
              ),

              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        'Daily Quiz',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 0.4)),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                constraints: BoxConstraints(maxWidth: 400),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Color(0xFF151E33)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFF4A00E0)
                                : Color(0xFF8B6914),
                            Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFF3F51B5)
                                : Color(0xFFB91C1C),
                            Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFFE91E63)
                                : Colors.black,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 24,
                            right: 24,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Daily Mix',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 24,
                            left: 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily Challenge',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Obx(() {
                                      return Row(
                                        children: [
                                          Icon(
                                            getx.mainProgress2.value != 5
                                                ? Icons.check_circle
                                                : Icons.access_time,
                                            color: Colors.white,
                                            size: 19,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            getx.mainProgress2.value != 5
                                                ? "Available! Play now "
                                                : "Resets in ${getx.timeLeft.value}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'TODAY\'S GOAL',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey
                                      : Color(0xFF2563EB),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Your 5-Word Daily Challenge',
                            style: TextStyle(
                              // color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Obx(
                              () => LinearProgressIndicator(
                                value: getx.mainProgress2.value,
                                minHeight: 8,
                                backgroundColor: Colors.grey[300],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                if (getx.mainProgress2.value != 5) {
                                  Get.to(
                                    () => Maingame(),
                                    transition: Transition.downToUp,
                                  );
                                } else {
                                  if (!Get.isSnackbarOpen) {
                                    Get.snackbar(
                                      'Sorry!',
                                      'You have already completed your daily quiz. Please try again tomorrow.',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: const Color.fromARGB(
                                        189,
                                        21,
                                        101,
                                        192,
                                      ),
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 1),
                                      margin: EdgeInsets.all(12),
                                      borderRadius: 10,
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF2563EB),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_circle_filled, size: 24),
                                  SizedBox(width: 8),
                                  Text(
                                    'Start Daily Mix',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
