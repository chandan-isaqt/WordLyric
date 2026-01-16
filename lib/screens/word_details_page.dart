import 'package:dictonary/api/dictionary_main_Api/api_main.dart';
import 'package:dictonary/api/dictionary_main_Api/api_model.dart';
import 'package:dictonary/controller/getx_controller.dart' show Getx;

import 'package:dictonary/widgets/details_word_widget.dart';
import 'package:get/get.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class Worddetails extends StatefulWidget {
  final String value;

  const Worddetails({super.key, required this.value});

  @override
  State<Worddetails> createState() => _WorddetailsState();
}

class _WorddetailsState extends State<Worddetails> {
  // String defultLanguage = "en";

  final Map<String, String> languages = {
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
  };
  final Getx getx = Get.find<Getx>();

  List<DictModel> words = [];
  bool isLading = true;
  bool isSave = false;

  final FlutterTts flutterTts = FlutterTts();
  Future speak(String text) async {
    await flutterTts.setLanguage("en-US");

    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  @override
  void initState() {
    super.initState();
    loadData();
    call();
  }

  Future<void> call() async {
    await getx.saveFinalData();
    // log("message");
  }

  Future<void> loadData() async {
    // log(" word: ${widget.value}");
    words = await dictViewApi(widget.value.toString());
    setState(() {
      isLading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF101623),
      appBar: AppBar(
        // backgroundColor: const Color(0xFF101623),
        centerTitle: true,
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color.fromARGB(255, 157, 157, 157),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: words.isNotEmpty
                ? Obx(() {
                    bool isSave = false;
                    for (var w in getx.saveHistory) {
                      if (w["save"] == widget.value) {
                        isSave = true;
                        break;
                      }
                    }

                    return InkWell(
                      onTap: () {
                        getx.iconSave(widget.value);
                      },
                      child: Icon(
                        isSave ? Icons.bookmark : Icons.bookmark_add_outlined,
                        color: const Color.fromARGB(255, 149, 149, 149),
                      ),
                    );
                  })
                : SizedBox(),
          ),
        ],
      ),
      body: isLading
          ? Container(
              // color: const Color(0xFF101623),
              child: Center(
                child: LoadingAnimationWidget.discreteCircle(
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
              ),
            )
          : words.isNotEmpty
          ? Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF1e273a)
                        : const Color.fromARGB(255, 193, 193, 193),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 18.0,
                  right: 18.0,
                  bottom: 5,
                  top: 20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        words[0].word,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          // color: Colors.white,
                        ),
                      ),
                      Text(
                        words[0].phonetic,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF1479E0),
                        ),
                      ),
                      SizedBox(height: 20),

                      CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                            ? Color(0xFF1C2D4D)
                            : const Color.fromARGB(255, 149, 161, 170),
                        child: InkWell(
                          onTap: () {
                            speak(words[0].word);
                          },
                          child: Icon(
                            Icons.volume_up,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      words.isNotEmpty
                          ? partofspech(
                              title: "Noun",
                              items: words[0].nouns,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Verb",
                              items: words[0].verbs,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Pronoun",
                              items: words[0].pronouns,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Adjective",
                              items: words[0].adjectives,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Adverb",
                              items: words[0].adverbs,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Preposition",
                              items: words[0].prepositions,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Conjunction",
                              items: words[0].conjunctions,
                              context: context,
                            )
                          : SizedBox.shrink(),
                      words.isNotEmpty
                          ? partofspech(
                              title: "Interjection",
                              items: words[0].interjections,
                              context: context,
                            )
                          : SizedBox.shrink(),

                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.check_circle, color: Color(0xFF13BAA8)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Synonyms",
                              style: GoogleFonts.averiaLibre(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                // color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: words.isNotEmpty && words[0].synonyms.isNotEmpty
                            ? Wrap(
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  words[0].synonyms.length,
                                  (index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color(0xFF1B2E34)
                                            : Color.fromARGB(
                                                255,
                                                196,
                                                226,
                                                235,
                                              ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        words[0].synonyms[index],
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF13BAA8),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "No synonyms available",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      112,
                                      111,
                                      111,
                                    ),
                                  ),
                                ),
                              ),
                      ),

                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.check_circle, color: Color(0xFFEC4899)),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "Antonyms",
                              style: GoogleFonts.averiaLibre(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                // color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: words.isNotEmpty && words[0].antonyms.isNotEmpty
                            ? Wrap(
                                alignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  words[0].antonyms.length,
                                  (index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Color(0xFF322232)
                                            : Color.fromARGB(
                                                182,
                                                245,
                                                216,
                                                245,
                                              ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        words[0].antonyms[index],
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEC4899),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "No antonyms available",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      112,
                                      111,
                                      111,
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Color(0xFF1D2333)
                              : const Color.fromARGB(255, 228, 228, 228),
                          child: Icon(
                            Icons.search_off,
                            size: 50,
                            color: Colors.grey[600],
                          ),
                        ),

                        SizedBox(height: 30),
                        Text(
                          "No results found",
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            // color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 10),
                        Text(
                          "We couldn't find any definitions for",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Color(0xFF768396),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 15),

                        Text(
                          "\"${widget.value}\"",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Color.fromARGB(255, 194, 194, 194)
                                : const Color.fromARGB(255, 87, 132, 169),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: 20),
                        Container(
                          height: 240,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Color(0xFF1D2333)
                                : const Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                              width: 0.9,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.transparent
                                  : Color.fromARGB(255, 203, 203, 203),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "SUGGESTIONS",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF1C2D4D)
                                          : Color.fromARGB(255, 190, 204, 230),
                                      child: Icon(
                                        Icons.error_outline,
                                        size: 18,
                                        color: Color(0xFF1459E9),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Check your spelling",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFBBC4D1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF1C2D4D)
                                          : Color.fromARGB(255, 190, 204, 230),
                                      child: Icon(
                                        Icons.search_rounded,
                                        size: 18,
                                        color: Color(0xFF1459E9),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Try a more general word",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFBBC4D1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF1C2D4D)
                                          : Color.fromARGB(255, 190, 204, 230),
                                      child: Icon(
                                        Icons.wifi_find_rounded,
                                        size: 18,
                                        color: Color(0xFF1459E9),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Check your internet",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFBBC4D1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),

                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF1C2D4D)
                                          : Color.fromARGB(255, 190, 204, 230),
                                      child: Icon(
                                        Icons.add_link_rounded,
                                        size: 18,
                                        color: Color(0xFF1459E9),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "Try using a synonym",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFBBC4D1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                1,
                                66,
                                179,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(6),
                              ),
                            ),
                            child: Text(
                              "Search Again",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

      // floatingActionButton: InkWell(
      //   onTap: () {
      //     showDialog(
      //       context: context,
      //       builder: (_) {
      //         return AlertDialog(
      //           backgroundColor: Color(0xFF101623),

      //           // contentPadding: EdgeInsets.symmetric(
      //           //   vertical: 50,
      //           //   horizontal: 10,
      //           // ),
      //           content: Container(

      //             height: 100,
      //             child: Column(
      //               children: [
      //                 DropdownButtonHideUnderline(
      //                   child: Obx(
      //                     () => DropdownButton<String>(
      //                       value: getx.defultLanguage.value,
      //                       dropdownColor: const Color(0xFF1F2838),
      //                       iconEnabledColor: Colors.white,
      //                       items: languages.keys.map((key) {
      //                         return DropdownMenuItem<String>(
      //                           value: key,
      //                           child: Text(
      //                             languages[key]!,
      //                             style: const TextStyle(color: Colors.white),
      //                           ),
      //                         );
      //                       }).toList(),
      //                       onChanged: (value) {
      //                         getx.defultLanguage.value = value!;
      //                       },
      //                     ),
      //                   ),
      //                 ),
      //                 ElevatedButton(
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Color.fromARGB(255, 1, 66, 179),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadiusGeometry.circular(6),
      //                     ),
      //                   ),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text(
      //                         "Translate",
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w600,
      //                         ),
      //                       ),
      //                       SizedBox(width: 6),
      //                       Icon(Icons.translate, color: Colors.white),
      //                     ],
      //                   ),
      //                   onPressed: () {

      //                   },
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   child: Container(
      //     width: 50,
      //     height: 50,
      //     decoration: BoxDecoration(
      //       color: const Color(0xFF145BEC),
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     child: const Icon(Icons.translate, color: Colors.white),
      //   ),
      // ),
    );
  }
}
