// import 'dart:developer';
// import 'package:dictonary/screens/homepage.dart';
// import 'package:dictonary/api/wordofthedayApi/worddayApi.dart';
import 'package:dictonary/controller/getx_controller.dart' show Getx;

import 'package:dictonary/screens/traker_Daily_page.dart';
import 'package:dictonary/screens/word_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  final TextEditingController searchController = TextEditingController();
  final Getx getx = Get.find<Getx>();

  @override
  void initState() {
    // wordOfTheDayFun();

    super.initState();
  }

  String formatDateTime(String dtString) {
    try {
      final dt = DateTime.parse(dtString);
      return DateFormat('hh:mm a, dd MMM ').format(dt);
    } catch (e) {
      return dtString;
    }
  }

  String formatWordofDay(String word) {
    try {
      final dt = DateTime.parse(word);
      return DateFormat('dd MMM yyyy').format(dt);
    } catch (e) {
      return word;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF101623),
      appBar: AppBar(
        // toolbarHeight: 60,
        // backgroundColor: Color(0xFF101623),
        centerTitle: false,

        title: Text("WordLyric"),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => DailyTraker(), transition: Transition.fadeIn);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.analytics_outlined, size: 30),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          // color: Color(0xFF101623),
          child: Container(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 0,
              top: 16,
            ),
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        TextField(
                          controller: searchController,
                          // style: TextStyle(color: Colors.white, fontSize: 16),
                          decoration: InputDecoration(
                            hintText: "Search Dictionary...",

                            // hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.search,
                              color: const Color.fromARGB(179, 93, 93, 93),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.cancel, color: Colors.grey),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                searchController.clear();
                              },
                            ),

                            filled: true,

                            fillColor:
                                Theme.of(context).brightness == Brightness.dark
                                ? const Color(0xFF1F2838)
                                : const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ).withOpacity(0.6),

                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color.fromARGB(105, 93, 131, 225),
                                width: 0.3,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Color.fromARGB(105, 12, 114, 191),
                                width: 0.9,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (searchController.text.isNotEmpty) {
                                String searchValue = searchController.text;

                                if (getx.countForSearch.value < 5) {
                                  getx.countForSearch.value++;
                                  getx.progressPercentage();
                                  getx.saveCountForSearch();
                                }
                                Get.to(
                                  () => Worddetails(value: searchValue),
                                  transition: Transition.fade,
                                  duration: Duration(milliseconds: 300),
                                );
                              }
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
                              "Look Up Word",
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
                  SizedBox(height: 20),
                  Obx(() {
                    return getx.ischeckWordOfTheDay.value
                        ? Container(
                            width: double.infinity,
                            child: Card(
                              elevation: 3,
                              shadowColor: const Color.fromARGB(
                                255,
                                148,
                                140,
                                140,
                              ),

                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.6,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/tree1.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                child: Container(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Color(0xFF6D7179).withOpacity(0.8)
                                      : Color.fromARGB(194, 252, 252, 251),

                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            color: Color(0xFF5B6E90),
                                            child: Text(
                                              "Word of the Day",
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFBFDBFE),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            formatWordofDay(getx.date.string),
                                            style: TextStyle(
                                              // color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        getx.word.toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        getx.ipa.string,
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 9.0,
                                          bottom: 10,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                width: 2,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10.0,
                                            ),
                                            child: Text(
                                              getx.meaning.string,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontStyle: FontStyle.italic,
                                                color:
                                                    Theme.of(
                                                          context,
                                                        ).brightness ==
                                                        Brightness.dark
                                                    ? Color.fromARGB(
                                                        255,
                                                        209,
                                                        209,
                                                        209,
                                                      )
                                                    : const Color.fromARGB(
                                                        255,
                                                        68,
                                                        68,
                                                        68,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${getx.partOfSpeech.toString()}-English",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                255,
                                                168,
                                                184,
                                                208,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (getx.word.value.isNotEmpty &&
                                                  getx.word.value !=
                                                      "No word available today") {
                                                Get.to(
                                                  () => Worddetails(
                                                    value: getx.word.value,
                                                  ),
                                                  transition: Transition
                                                      .rightToLeftWithFade,
                                                  duration: Duration(
                                                    milliseconds: 300,
                                                  ),
                                                );
                                              } else {
                                                if (!Get.isSnackbarOpen) {
                                                  Get.snackbar(
                                                    "Oops!",
                                                    "Word is not available yet!",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    backgroundColor:
                                                        Colors.black87,
                                                    colorText: Colors.white,
                                                    margin: EdgeInsets.all(12),
                                                    borderRadius: 8,
                                                    duration: Duration(
                                                      seconds: 1,
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Learn More",
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(
                                                              context,
                                                            ).brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.blueAccent,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_right_sharp,

                                                  color:
                                                      Theme.of(
                                                            context,
                                                          ).brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.blueAccent,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox();
                  }),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Now",
                        style: GoogleFonts.averiaLibre(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          // color: Colors.white,
                        ),
                      ),
                      // Icon(Icons.trending_up, color: Colors.blueAccent),
                    ],
                  ),
                  SizedBox(height: 5),

                  SizedBox(
                    height: 80,

                    // color: Colors.red,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => Worddetails(value: "Soliloquy"),
                                transition: Transition.fade,
                                duration: Duration(milliseconds: 300),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Color.fromRGBO(16, 35, 73, 1)
                                    : Color.fromARGB(
                                        59,
                                        180,
                                        189,
                                        242,
                                      ), // soft bluish white
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.trending_up,
                                      color: Colors.blueAccent,
                                    ),
                                    Text(
                                      "Soliloquy",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        // color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.to(
                                () => Worddetails(value: "Zephyr"),
                                transition: Transition.fade,
                                duration: Duration(milliseconds: 300),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color(0xFF181D38)
                                    : const Color.fromARGB(255, 211, 218, 250),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.bolt_outlined,
                                      color: Color(0xFF6366F1),
                                    ),
                                    Text(
                                      "Zephyr",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        // color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Searching",
                        style: GoogleFonts.averiaLibre(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          // color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        child: InkWell(
                          onTap: () {
                            getx.historyData.clear();
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
                  ),
                  Obx(() {
                    return getx.historyData.isEmpty
                        ? Container(
                            height: 200,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "No recent searches yet",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Start searching to see your history here",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: getx.historyData.length,
                                itemBuilder: (context, index) {
                                  final searchItem = getx.historyData[index];
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Color(0xFF1F2838)
                                          : Color(0xFFEAEEF7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.history,
                                        color: Colors.blue,
                                      ),
                                      title: Text(
                                        searchItem["word"] ?? "",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          // color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            searchItem["definition"] ?? "",
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Color.fromARGB(
                                                      255,
                                                      180,
                                                      180,
                                                      180,
                                                    )
                                                  : const Color.fromARGB(
                                                      255,
                                                      92,
                                                      91,
                                                      91,
                                                    ),
                                              fontStyle: FontStyle.italic,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),

                                          SizedBox(height: 4),
                                          Text(
                                            formatDateTime(
                                              searchItem["time"] ?? "",
                                            ),
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color:
                                                  Theme.of(
                                                        context,
                                                      ).brightness ==
                                                      Brightness.dark
                                                  ? Colors.grey[400]
                                                  : const Color.fromARGB(
                                                      255,
                                                      51,
                                                      48,
                                                      48,
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          getx.historyData.removeAt(index);
                                        },
                                      ),
                                      onTap: () {
                                        Get.to(
                                          () => Worddetails(
                                            value: searchItem["word"] ?? "",
                                          ),
                                          transition: Transition.downToUp,
                                          duration: Duration(milliseconds: 300),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
