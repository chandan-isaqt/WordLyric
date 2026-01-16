import 'package:dictonary/controller/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Maingame extends StatefulWidget {
  const Maingame({super.key});

  @override
  State<Maingame> createState() => _MaingameState();
}

class _MaingameState extends State<Maingame> {
  final Getx getx = Get.find<Getx>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, size: 28),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor:
                                Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFF101623)
                                : Colors.white,
                            title: Text('Quit Quiz?'),
                            content: Text('Your progress will be lost.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  Get.back();
                                  getx.isCheckAnswer.value = false;
                                  getx.progress.value = 0.2;
                                  getx.currentQuestion.value = 1;
                                  getx.currentQuestionIndex.value = 0;
                                  getx.selectedOption.value = null;
                                  getx.totalQuestions.value = 5;
                                  getx.mainProgress2.value = 5;
                                  getx.progressPercentage();
                                  getx.saveLoading();
                                  getx.score.value = 0;
                                },
                                child: Text('Quit'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Text(
                      'Quiz',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        // color: Colors.black87,
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${getx.currentQuestion.value}/${getx.totalQuestions}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          // color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Obx(
                    () => LinearProgressIndicator(
                      value: getx.progress.value,
                      minHeight: 8,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(
                  () => Text(
                    "${getx.questions[getx.currentQuestionIndex.value]['word']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => Column(
                      children: List.generate(
                        getx
                            .questions[getx
                                .currentQuestionIndex
                                .value]['options']
                            .length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: questionOption(
                            text:
                                getx.questions[getx
                                    .currentQuestionIndex
                                    .value]['options'][index],
                            index: index,
                            correctAnswer:
                                getx.questions[getx
                                    .currentQuestionIndex
                                    .value]['correctAnswer'],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (getx.selectedOption.value == null) return;

                    if (getx.isCheckAnswer.value) {
                      getx.nextQuestion(getx.questions.length, context);
                      getx.isCheckAnswer.value = false;
                    } else {
                      getx.isCheckAnswer.value = true;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(
                        () => Text(
                          getx.isCheckAnswer.value
                              ? 'Next Question'
                              : 'Check Answer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget questionOption({
    required String text,
    required int index,
    required String correctAnswer,
  }) {
    return Obx(() {
      bool isSelectCheck;
      bool isCorrectCheck;

      if (getx.selectedOption.value == index) {
        isSelectCheck = true;
      } else {
        isSelectCheck = false;
      }

      if (text == correctAnswer) {
        isCorrectCheck = true;
        // getx.scoreIncress();
      } else {
        isCorrectCheck = false;
      }

      Color borderColor;
      Color backgroundColor;

      if (getx.isCheckAnswer.value) {
        if (isSelectCheck && isCorrectCheck) {
          backgroundColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.green.shade50;
          borderColor = Colors.green;
        } else if (isSelectCheck && !isCorrectCheck) {
          backgroundColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.red.shade50;
          borderColor = Colors.red;
        } else if (isCorrectCheck) {
          backgroundColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.green.shade50;
          borderColor = Colors.green;
        } else {
          backgroundColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.white;
          borderColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.grey.shade300;
        }
      } else {
        if (isSelectCheck) {
          backgroundColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.blue.shade50;
          borderColor = Colors.blue;
        } else {
          backgroundColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.white;
          borderColor = Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF1E293B)
              : Colors.grey.shade300;
        }
      }

      return InkWell(
        onTap: () {
          if (!getx.isCheckAnswer.value) {
            getx.selectedOption.value = index;
          }
          if (text == correctAnswer) {
            isCorrectCheck = true;
            getx.scoreIncress();
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    // color: Colors.black87,
                  ),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelectCheck ? Colors.blue : Colors.grey,
                    width: 2,
                  ),
                  color: isSelectCheck ? Colors.blue : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
