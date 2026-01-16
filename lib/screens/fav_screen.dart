import 'dart:developer';

import 'package:dictonary/controller/getx_controller.dart';
import 'package:dictonary/screens/word_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final Getx getx = Get.find<Getx>();
  TextEditingController searchFav = TextEditingController();

  @override
  void initState() {
    super.initState();
    call();
  }

  Future<void> call() async {
    await getx.finalFavData();
    log(getx.updatedHistory.toString());
    getx.copyHistory.assignAll(getx.updatedHistory);
  }

  String formatDateTime(String dtString) {
    try {
      final dt = DateTime.parse(dtString);
      return DateFormat('hh:mm a, dd MMM yyyy').format(dt);
    } catch (e) {
      return dtString;
    }
  }

  Future<void> seachFavData(String word) async {
    List<Map<String, String>> x = word.isNotEmpty
        ? getx.copyHistory
              .where(
                (element) =>
                    (element["word"] ?? "").toLowerCase().contains(
                      word.toLowerCase(),
                    ) ||
                    (element["definition"] ?? "").toLowerCase().contains(
                      word.toLowerCase(),
                    ),
              )
              .toList()
        : [];

    if (x.isNotEmpty) {
      setState(() {
        getx.updatedHistory.value = x;
      });
    } else {
      getx.updatedHistory.value = word.isNotEmpty ? [] : getx.copyHistory;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF101623)
          : Colors.white,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF101623)
            : Colors.white,
        title: Text("Favourite"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: searchFav,
                  onChanged: (value) {
                    seachFavData(value);
                  },
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: "Search your saved word",
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              child: Obx(() {
                return getx.isFound.value == false
                    ? Center(
                        child: Text(
                          "No favourites yet",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: getx.updatedHistory.length,
                        itemBuilder: (context, index) {
                          final item = getx.updatedHistory[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => Worddetails(value: item["word"] ?? ""),
                                transition: Transition.downToUp,
                                duration: Duration(milliseconds: 300),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                // color: const Color(0xFF1F2838),
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item["word"] ?? "",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            // color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item["definition"] ?? "",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      getx.iconSave(item["word"] ?? "");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
