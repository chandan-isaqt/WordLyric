// import 'dart:convert';
// import 'dart:developer';

// import 'package:dictonary/api/dictionaryMainApi/apiurl.dart';
// import 'package:http/http.dart' as http;

// import 'package:dictonary/api/quizApi/quizModel.dart';

// Future<List<QuestionModel>> qustionApi() async {
//   // List<QuestionModel> word = [];
//   List<Noun> nounDefination = [];
//   List<Verb> verbDefination = [];
//   List<Pronoun> pronounDefination = [];
//   List<Adjective> adjectiveDefination = [];
//   List<Adverb> adverbDefination = [];
//   List<Preposition> prepositionDefination = [];
//   List<Conjunction> conjunctionDefination = [];
//   List<Interjection> interjectionDefination = [];
//   try {
//     final responseRandom = await http.get(Uri.parse('$Randomword.randomUrl'));

//     if (responseRandom.statusCode == 200) {
//       var jsonRandom = jsonDecode(responseRandom.body);

//       for (int i = 0; i < jsonRandom.length; i++) {
//         final resposeForDic = await http.get(
//           Uri.parse("${Apiurl.dictUrl}/${jsonRandom[i]}"),
//         );
//         if (resposeForDic.statusCode == 200) {
//           var jsonDict = jsonDecode(resposeForDic.body);

//           for (int j = 0; j < jsonDict.length; j++) {
//             var meanings = jsonDict[j]["meanings"] ?? [];
//             if (meanings.isEmpty) continue;

//             var meaning = meanings[0];
//             var definitions = meaning["definitions"] ?? [];
//             if (definitions.isEmpty) continue;

//             var firstDef = definitions[0];

//             if (meaning["partOfSpeech"] == "noun") {
//               nounDefination.add(
//                 Noun(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "verb") {
//               verbDefination.add(
//                 Verb(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "pronoun") {
//               pronounDefination.add(
//                 Pronoun(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "adjective") {
//               adjectiveDefination.add(
//                 Adjective(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "adverb") {
//               adverbDefination.add(
//                 Adverb(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "preposition") {
//               prepositionDefination.add(
//                 Preposition(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "conjunction") {
//               conjunctionDefination.add(
//                 Conjunction(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             } else if (meaning["partOfSpeech"] == "interjection") {
//               interjectionDefination.add(
//                 Interjection(
//                   definition: firstDef['definition'] ?? '',
//                   word: jsonDict[j]['word'] ?? '',
//                 ),
//               );
//             }
//           }
//         }
//       }
//     } else {
//       log('Request failed');
//     }
//   } catch (e) {
//     log(e.toString());
//   }
//   return [];
// }
