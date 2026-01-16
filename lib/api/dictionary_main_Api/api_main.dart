import 'dart:convert';
import 'dart:developer';
import 'package:dictonary/api/dictionary_main_Api/api_url.dart';
import 'package:dictonary/controller/getx_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:http/http.dart' as http;
import 'package:dictonary/api/dictionary_main_Api/api_model.dart';

// List<Map<String, String>> historyData = [];

Future<List<DictModel>> dictViewApi(String value) async {
  final Getx getx = Get.find<Getx>();

  List<DictModel> word = [];
  List<Noun> nounDefination = [];
  List<Verb> verbDefination = [];
  List<Pronoun> pronounDefination = [];
  List<Adjective> adjectiveDefination = [];
  List<Adverb> adverbDefination = [];
  List<Preposition> prepositionDefination = [];
  List<Conjunction> conjunctionDefination = [];
  List<Interjection> interjectionDefination = [];
  List synonyms = [];
  List antonyms = [];

  try {
    final res = await http.get(Uri.parse("${Apiurl.dictUrl}/$value"));

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);

      // historyData.insert(0, {"word": value, "time": DateTime.now().toString()});

      for (int i = 0; i < json.length; i++) {
        var meanings = json[i]["meanings"] ?? [];

        var meaning = meanings[0];

        var definitions = json[i]["meanings"][0]["definitions"] ?? [];

        if (meaning["partOfSpeech"] == "noun") {
          for (int j = 0; j < definitions.length; j++) {
            Noun nounObj = Noun(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            nounDefination.add(nounObj);
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "verb") {
          for (int j = 0; j < definitions.length; j++) {
            Verb verbObj = Verb(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            verbDefination.add(verbObj);
            // =========
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "pronoun") {
          for (int j = 0; j < definitions.length; j++) {
            Pronoun pronoun = Pronoun(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            pronounDefination.add(pronoun);
          }
          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "adjective") {
          for (int j = 0; j < definitions.length; j++) {
            Adjective adjectiveObj = Adjective(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            adjectiveDefination.add(adjectiveObj);
            // =========
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "adverb") {
          for (int j = 0; j < definitions.length; j++) {
            Adverb adverbObj = Adverb(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            adverbDefination.add(adverbObj);
            // =========
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "preposition") {
          for (int j = 0; j < definitions.length; j++) {
            Preposition prepositionObj = Preposition(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            prepositionDefination.add(prepositionObj);
            // =========
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "conjunction") {
          for (int j = 0; j < definitions.length; j++) {
            Conjunction conjunctionObj = Conjunction(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            conjunctionDefination.add(conjunctionObj);
            // =========
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        } else if (meaning["partOfSpeech"] == "interjection") {
          for (int j = 0; j < definitions.length; j++) {
            Interjection interjectionObj = Interjection(
              definition: definitions[j]["definition"] ?? "",
              example: definitions[j]["example"] ?? "",
            );
            interjectionDefination.add(interjectionObj);
            // =========
            if (getx.historyData.isEmpty ||
                getx.historyData[0]["word"] != value ||
                getx.historyData[0]["definition"] == "") {
              getx.historyData.insert(0, {
                "word": value,
                "definition": definitions[j]["definition"] ?? "",
                "time": DateTime.now().toString(),
              });
            }
          }

          if (meaning["synonyms"] != null) {
            synonyms.addAll(List<String>.from(meaning["synonyms"]));
          }
          if (meaning["antonyms"] != null) {
            antonyms.addAll(List<String>.from(meaning["antonyms"]));
          }
        }
      }
      if (json.isNotEmpty) {
        word.add(
          DictModel(
            word: json[0]["word"] ?? "",
            phonetic: json[0]["phonetic"] ?? "",
            nouns: List.from(nounDefination),
            verbs: List.from(verbDefination),
            pronouns: List.from(pronounDefination),
            adjectives: List.from(adjectiveDefination),
            adverbs: List.from(adverbDefination),
            prepositions: List.from(prepositionDefination),
            conjunctions: List.from(conjunctionDefination),
            interjections: List.from(interjectionDefination),
            synonyms: List.from(synonyms),
            antonyms: List.from(antonyms),
          ),
        );
      }
    } else {
      log('Request failed');
    }
  } catch (e) {
    log(e.toString());
  }
  return word;
}
