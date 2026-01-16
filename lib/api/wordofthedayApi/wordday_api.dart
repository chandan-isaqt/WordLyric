import 'dart:convert';
import 'dart:developer';
import 'package:dictonary/api/dictionary_main_Api/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:dictonary/controller/getx_controller.dart';

Future<void> wordOfTheDayFun() async {
  final Getx getx = Get.find<Getx>();
  String wordDay = "";
  String meaningDay = "";
  String ipaDay = "";
  String partOfSpeechDay = "";
  String dateDay = "";

  try {
    final res = await http.get(Uri.parse(wordofthedayUrl.wordDayUrl));

    if (res.statusCode == 200) {
      final data = json.decode(res.body);

      wordDay = data["word"] ?? "No word available today";
      meaningDay = data["definition"] ?? "No meaning available";
      ipaDay = data["ipa"] ?? "";
      partOfSpeechDay = data["pos"] ?? "";
      dateDay = data["date"] ?? "";

      getx.word.value = wordDay;
      getx.meaning.value = meaningDay;
      getx.ipa.value = ipaDay;
      getx.partOfSpeech.value = partOfSpeechDay;
      getx.date.value = dateDay;
      // log(getx.meaning.value);
    } else {
      log('Request failed');
    }
  } catch (e) {
    log("Error : $e");
  }
}
