import 'dart:async';
import 'dart:developer';

import 'package:dictonary/DataBase/db_delete.dart';
import 'package:dictonary/DataBase/db_init.dart';
import 'package:dictonary/DataBase/db_insert.dart';
import 'package:dictonary/DataBase/db_read.dart';
import 'package:dictonary/api/quizApi/data_for_quiz.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getx extends GetxController {
  late List<Map<String, dynamic>> questions;
  late List<Map<String, dynamic>> shuffledOptions;
  Timer? _timer;
  @override
  void onInit() async {
    super.onInit();
    checkTheme();
    _updateTime();
    // await getLoading();
    // saveLoading();
    await checkDailyReset();

    shuffledOptions = List<Map<String, dynamic>>.from(quizQuestions)..shuffle();
    questions = shuffledOptions.take(5).toList();

    for (var q in questions) {
      q['options'] = List<String>.from(q['options'])..shuffle();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (_) => _updateTime());
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  RxBool isCheckAnswer = false.obs;
  RxDouble progress = 0.2.obs;
  RxDouble mainProgress2 = 0.2.obs;
  RxBool isdailyGoalSave = false.obs;
  RxInt countForSearch = 0.obs;
  RxDouble progressDailyCheck = .0.obs;

  RxString selectedLanguage = "en".obs;
  RxString selectedLanguage2 = "bn".obs;
  var languages = <String, String>{
    "en": "English",
    "bn": "Bengali",
    "hi": "Hindi",
    "ur": "Urdu",
    "fr": "French",
    "es": "Spanish",
    "de": "German",
    "ar": "Arabic",
    "ru": "Russian",
    "ja": "Japanese",
    "ko": "Korean",
    "zh-cn": "Chinese",
    "pt": "Portuguese",
    "it": "Italian",
  }.obs;

  RxInt currentQuestion = 1.obs;
  RxInt currentQuestionIndex = 0.obs;
  RxnInt selectedOption = RxnInt();
  RxInt totalQuestions = 5.obs;

  var historyData = <Map<String, String>>[].obs;
  var saveHistory = <Map<String, String>>[].obs;

  var tempfav = <Map<String, String>>[].obs;
  var updatedHistory = <Map<String, String>>[].obs;
  var tempHistory = <Map<String, String>>[].obs;

  var historyTranslate = <Map<String, String>>[].obs;
  var copyHistory = <Map<String, String>>[].obs;

  RxString translatedText = "".obs;

  RxBool ischeckWordOfTheDay = true.obs;
  RxBool isDarkCheck = false.obs;
  RxBool isRating = false.obs;
  RxString word = "".obs;
  RxString meaning = "".obs;
  RxString ipa = "".obs;
  RxString partOfSpeech = "".obs;
  RxString date = "".obs;
  final db = DbHelper();
  RxInt countAmni = 0.obs;
  RxString timeLeft = ''.obs;

  void progressPercentage() {
    if (mainProgress2.value == 5) {
      countAmni.value++;
      saveCountAmni();
    } else if (isdailyGoalSave.value == true) {
      // log("jk");
      countAmni.value++;
      saveCountAmni();
    } else {
      if (countForSearch.value < 5) {
        countAmni.value++;
        saveCountAmni();
      }
    }
    progressDailyCheck.value = (countAmni / 7).clamp(0.0, 1.0);
  }

  void changeProgress() {
    progressDailyCheck.value = (countAmni / 7).clamp(0.0, 1.0);
  }

  Future<void> saveLoading() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('mainProgress2', mainProgress2.value);
    log(" get :${mainProgress2.value.toString()}");
  }

  Future<void> getLoading() async {
    final prefs = await SharedPreferences.getInstance();
    mainProgress2.value = prefs.getDouble('mainProgress2') ?? 0.2;

    countForSearch.value = prefs.getInt('countForSearch') ?? 0;

    isdailyGoalSave.value = prefs.getBool('isdailyGoalSave') ?? false;
    countAmni.value = prefs.getInt('countAmni') ?? 0;

    changeProgress();

    // log(mainProgress2.value.toString());
  }

  Future<void> saveCountForSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countForSearch', countForSearch.value);
  }

  Future<void> saveDailyGoalSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isdailyGoalSave', isdailyGoalSave.value);

  }

  Future<void> saveCountAmni() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countAmni', countAmni.value);

  }

  int lastCheckedMinute = -1;
  void _updateTime() {
    DateTime now = DateTime.now();
    DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1);
    Duration difference = nextMidnight.difference(now);

    int hours = difference.inHours;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    timeLeft.value = '${hours}h ${minutes}m ${seconds}s';

    if (now.minute != lastCheckedMinute) {
      lastCheckedMinute = now.minute;
      checkDailyReset();
    }
  }

  // =========check reset=======
  Future<void> checkDailyReset() async {
    final prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();

    String today =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    // String today = "2026-03-23";
    String? lastReset = prefs.getString('lastResetDate');

    // log("lastReset: $lastReset");
    // log("today: $today");

    if (lastReset != today) {
      mainProgress2.value = 0.2;
      countForSearch.value = 0;
      isdailyGoalSave.value = false;
      countAmni.value = 0;

      prefs.setString('lastResetDate', today);

      prefs.setInt('countForSearch', countForSearch.value);

      prefs.setBool('isdailyGoalSave', isdailyGoalSave.value);
      prefs.setDouble('mainProgress2', mainProgress2.value);

      prefs.setInt('countAmni', countAmni.value);

      changeProgress();
      // log("Daily reset executed");
    } else {
      getLoading();
    }
  }

  void checkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool? saved = prefs.getBool('islight') ?? false;
    isDarkCheck.value = saved;
  }

  // Themetoogle===with SharedPreferences========
  void toggleTheme(bool value) async {
    isDarkCheck.value = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('islight', value);
  }

  RxInt score = 0.obs;

  // =======scoreIncress=====
  void scoreIncress() {
    score.value++;
  }

  // ===============quiznext===
  void nextQuestion(int questionLength, BuildContext context) {
    if (currentQuestionIndex.value < questionLength - 1) {
      currentQuestionIndex.value++;
      currentQuestion.value++;
      selectedOption.value = null;
      progress.value = currentQuestion.value / totalQuestions.value;
    } else {
      Get.dialog(
        AlertDialog(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF0F1729)
              : const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              Icon(Icons.emoji_events, color: Colors.orangeAccent, size: 50),
              SizedBox(height: 8),
              Text(
                'Quiz Finished!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You have completed all questions.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Obx(
                () => Text(
                  'Score: ${score.value} / ${totalQuestions.value}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 12),
              LinearProgressIndicator(
                value: score.value / totalQuestions.value,
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                Get.back();
                Get.back();
                isCheckAnswer.value = false;
                progress.value = 0.2;
                currentQuestion.value = 1;
                currentQuestionIndex.value = 0;
                selectedOption.value = null;
                totalQuestions.value = 5;
                mainProgress2.value = 5;
                await saveLoading();
                score.value = 0;
                progressPercentage();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void assignHistory() async {
    updatedHistory.clear();
    tempfav.clear();

    for (var i = 0; i < historyData.length; i++) {
      tempfav.add(historyData[i]);
    }

    for (var i = 0; i < saveHistory.length; i++) {
      for (var j = 0; j < tempfav.length; j++) {
        if (saveHistory[i]["save"] == tempfav[j]["word"]) {
          bool alreadyAdd = false;

          final finalfavres = await readFav();
          for (int m = 0; m < finalfavres.length; m++) {
            if (finalfavres[m]['word'] == saveHistory[i]['save']) {
              alreadyAdd = true;

              break;
            }
          }

          if (!alreadyAdd) {
            final word = saveHistory[i]["save"] ?? "";
            final definition = tempfav[j]["definition"] ?? "";
            await insertFavdata(word, definition);
          }
          break;
        }
      }
    }
    finalFavData();
  }

  // ======================iconCheck=======
  void iconSave(String word) async {
    bool found = false;
    // saveFinalData();
    for (int i = 0; i < saveHistory.length; i++) {
      if (saveHistory[i]["save"] == word) {
        found = true;
        break;
      }
    }

    if (found) {
      for (int i = 0; i < saveHistory.length; i++) {
        if (saveHistory[i]["save"] == word) {
          saveHistory.removeAt(i);
          deleteSave(word);
          await readSaveHistory();

          db.db.execute('''DELETE FROM favHistory WHERE word = '${word}' ''');
          break;
        }
      }
    } else {
      saveHistory.add({"save": word});

      funcall();
      saveHistoryfun(word);
      await readSaveHistory();
    }

    assignHistory();
  }

  Future<void> funcall() async {
    final prefs = await SharedPreferences.getInstance();
    isdailyGoalSave.value = prefs.getBool('isdailyGoalSave') ?? false;
    if (isdailyGoalSave.value == false) {
      isdailyGoalSave.value = true;
      progressPercentage();
      saveDailyGoalSave();
    }
  }

  RxBool isFound = false.obs;

  Future<void> finalFavData() async {
    final result = await readFav();

    updatedHistory.clear();

    for (var word in result) {
      updatedHistory.add({
        'word': word['word']?.toString() ?? '',
        'definition': word['definition']?.toString() ?? '',
      });
    }
    if (result.isNotEmpty) {
      isFound.value = true;
    } else {
      isFound.value = false;
    }

    copyHistory.assignAll(updatedHistory);
  }

  Future<void> saveFinalData() async {
    final result2 = await readSaveHistory();
    saveHistory.clear();

    for (var word in result2) {
      saveHistory.add({'save': word['save']});
    }
  }

  // ======futurebuildercall======
  Future<List<Map<String, String>>> getUpdatedHistory() async {
    await finalFavData();
    print("add${updatedHistory}");

    return updatedHistory.toList();
  }
}
