import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF101623),
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: const Color(0xFF101623),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("About us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 10, 109, 190),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          offset: const Offset(2, 2),
                          blurRadius: 10,
                          spreadRadius: 0.1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/applogo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF1E293B)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 10, color: Colors.green),
                      Text(
                        " V2.01",
                        style: GoogleFonts.poppins(color: Color(0xFF91A0B5)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "About the app",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.aBeeZee(
                      color: Color(0xFF93A1B6),
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF1D2333)
                        : Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.8,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.transparent
                          : Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.flag, color: Colors.blueAccent),
                            Text(
                              " Mission",
                              style: GoogleFonts.averiaLibre(
                                fontSize: 20,
                                // color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Mission is to make word meanings clear and easy to understand. I aim to help users improve their vocabulary every day by providing accurate definitions and reliable language tools. I strive to support learning for everyone, anytime, anywhere, making the process of discovering new words simple and enjoyable.",
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey
                                : const Color.fromARGB(255, 75, 117, 138),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  // height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Color(0xFF1D2333)
                        : Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 0.8,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.transparent
                          : Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_pin_circle_sharp,
                              color: Colors.blueAccent,
                            ),
                            Text(
                              " About the Developer",
                              style: GoogleFonts.averiaLibre(
                                fontSize: 20,
                                // color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "A passionate language enthusiast and developer, dedicated to creating a reliable and user-friendly dictionary app. I work to provide accurate definitions, helpful tools, and an enjoyable learning experience for every user. My goal is to make learning new words simple, clear, and fun for everyone.",
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey
                                : const Color.fromARGB(255, 75, 117, 138),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      "© 2025 || Devloped by Chandan.",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color(0xFF93A1B6)
                            : const Color.fromARGB(255, 101, 101, 101),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
