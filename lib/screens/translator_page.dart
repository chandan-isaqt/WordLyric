import 'package:dictonary/controller/getx_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/services.dart';

class Translator extends StatefulWidget {
  const Translator({super.key});

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  final Getx getx = Get.find<Getx>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final translator = GoogleTranslator();
  final FlutterTts flutterTts = FlutterTts();

  final TextEditingController translateController = TextEditingController();

  Future<String> translateText(String text, String toLanguage) async {
    if (text.trim().isEmpty) return "Please enter text to translate";
    try {
      final result = await translator.translate(text, to: toLanguage);
      return result.text;
    } catch (e) {
      return "Translation failed";
    }
  }

  Future speak(String text, String language) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  String formatDateTime(String dtString) {
    try {
      final dt = DateTime.parse(dtString);
      return DateFormat('hh:mm a').format(dt);
    } catch (e) {
      return dtString;
    }
  }

  void copyText() {
    if (getx.translatedText.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: getx.translatedText.string));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF101623),
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Color(0xFF101623),
        title: Text("Translator"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF242F48)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: getx.selectedLanguage.value,
                          dropdownColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1F2838)
                              : Colors.white,
                          iconEnabledColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          items: getx.languages.keys.map((key) {
                            return DropdownMenuItem<String>(
                              value: key,
                              child: Text(
                                getx.languages[key]!,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            getx.selectedLanguage.value = value!;
                          },
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        final demo1 = getx.selectedLanguage.value;
                        final demo2 = getx.selectedLanguage2.value;
                        getx.selectedLanguage2.value = demo1;
                        getx.selectedLanguage.value = demo2;
                      },
                      child: Icon(
                        Icons.swap_horiz,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),

                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: getx.selectedLanguage2.value,
                          dropdownColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1F2838)
                              : Colors.white,
                          iconEnabledColor:
                              Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          items: getx.languages.keys.map((key) {
                            return DropdownMenuItem<String>(
                              value: key,
                              child: Text(
                                getx.languages[key]!,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            getx.selectedLanguage2.value = value!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Container(
                height: 230,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF242F48)
                      : const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.transparent.withOpacity(0.3)
                          : Colors.blue.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      // offset: Offset(6, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            getx.languages[getx.selectedLanguage.value]!,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              // color: Colors.white70,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel, color: Colors.grey),
                          onPressed: () {
                            translateController.clear();
                            getx.translatedText.value = "";
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Divider(height: 1, color: Theme.of(context).dividerColor),
                    Expanded(
                      child: TextField(
                        controller: translateController,
                        maxLines: null,
                        // style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Enter text to translate",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: false,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.volume_up, color: Colors.blue),
                        onPressed: () {
                          speak(
                            translateController.text,
                            getx.selectedLanguage.value,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 1, 66, 179),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(6),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Translate",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.translate, color: Colors.white),
                  ],
                ),
                onPressed: () async {
                  getx.translatedText.value = await translateText(
                    translateController.text,
                    getx.selectedLanguage2.value,
                  );
                  if (translateController.text != "") {
                    getx.historyTranslate.insert(0, {
                      "selectedLanguage":
                          getx.languages[getx.selectedLanguage.value]!,
                      "selectedLanguage2":
                          getx.languages[getx.selectedLanguage2.value]!,
                      "transData": translateController.text,
                      "translatedText": getx.translatedText.string,
                      "time": DateTime.now().toString(),
                    });
                  }
                },
              ),

              SizedBox(height: 10),

              Container(
                height: 230,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF242F48)
                      : const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.transparent.withOpacity(0.3)
                          : Colors.blue.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      // offset: Offset(6, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Obx(
                        () => Text(
                          getx.languages[getx.selectedLanguage2.value]!,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            // color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Divider(height: 1, color: Theme.of(context).dividerColor),
                    Obx(() {
                      if (translateController.text.isEmpty) {
                        getx.translatedText.value = "";
                      }

                      return Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              left: 8.0,
                            ),
                            child: Text(
                              getx.translatedText.value,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    }),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.volume_up, color: Colors.blue),
                          onPressed: () {
                            speak(
                              getx.translatedText.string,
                              getx.selectedLanguage2.value,
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.copy, color: Colors.blue),
                          onPressed: copyText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return getx.historyTranslate.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent",
                            style: GoogleFonts.averiaLibre(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            child: InkWell(
                              onTap: () {
                                getx.historyTranslate.clear();
                              },
                              child: Text(
                                "Clear all",
                                style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 2, 127, 230),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox();
              }),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                child: Obx(() {
                  return ListView.builder(
                    itemCount: getx.historyTranslate.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = getx.historyTranslate[index];
                      return Container(
                        height: 90,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xFF1F2838)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 0.2,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? const Color.fromARGB(
                                    255,
                                    106,
                                    105,
                                    105,
                                  ).withOpacity(0.3)
                                : const Color.fromARGB(255, 106, 105, 105),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        item["selectedLanguage"] ?? "",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                            255,
                                            148,
                                            148,
                                            148,
                                          ),
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: const Color.fromARGB(
                                          255,
                                          136,
                                          136,
                                          136,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        item["selectedLanguage2"] ?? "",
                                        style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item["transData"] ?? "",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color.fromARGB(
                                              179,
                                              255,
                                              255,
                                              255,
                                            )
                                          : const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    maxLines: 1,

                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    item["translatedText"] ?? "",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? const Color.fromARGB(
                                              179,
                                              157,
                                              157,
                                              157,
                                            )
                                          : const Color.fromARGB(
                                              255,
                                              76,
                                              76,
                                              76,
                                            ),
                                      fontStyle: FontStyle.italic,
                                    ),

                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              formatDateTime(item["time"] ?? ""),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
