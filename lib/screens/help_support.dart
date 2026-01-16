import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final Uri _url = Uri(scheme: 'mailto', path: 'chandandas20314@gmail.com');

  Future<void> emailLauncher() async {
    try {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw Exception("not found");
    }
  }

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
        title: Text("Help & Support"),
      ),
      body: Container(
        decoration: BoxDecoration(
          // color: Color(0xFF101623),
          border: Border(
            top: BorderSide(
              width: 1,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF1e273a)
                  : const Color.fromARGB(255, 193, 193, 193),
            ),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF1C2D4D)
                  : const Color.fromARGB(255, 191, 213, 250),
              child: Icon(Icons.help, color: Color(0xFF145BEC)),
            ),
            SizedBox(height: 10),
            Text(
              "How can we help?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Welcome! Find simple answers to get started with your new dictionary.",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 141, 150, 160),
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 16),

            _privacy(
              icon: Icons.search,
              iconColor: Color(0xFF145BEC),
              avatarBackground: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF1C2D4D)
                  : Color.fromARGB(255, 201, 218, 249),
              title: "How do i find a word?",
              content:
                  "Tap the search bar, type the word, and then press the \"Look Up\"button at the bottom to find it.View its meaning, pronunciation, examples, and synonyms instantly.",
            ),

            _privacy(
              icon: Icons.volume_up,
              title: "How to Hear a word?",
              iconColor: Color(0xFFC084FC),
              avatarBackground: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF2E204C)
                  : Color.fromARGB(255, 232, 221, 255),
              content:
                  "To hear the pronunciation of a word, tap the speaker icon next to it. You can listen as many times as you like to learn the correct pronunciation.",
            ),
            _privacy(
              icon: Icons.translate_rounded,
              title: "How to use translator?",
              iconColor: Color.fromARGB(255, 2, 151, 25),
              avatarBackground: Theme.of(context).brightness == Brightness.dark
                  ? Color.fromARGB(77, 61, 120, 88)
                  : Color.fromARGB(77, 154, 213, 182),
              content:
                  "To use the translator, select a source and target language, enter the text in the input field, and tap the button at the bottom to see the translation or search results. This makes translating quick and easy.",
            ),
            _privacy(
              icon: Icons.bookmark,
              iconColor: Color(0xFFFBBF24),
              avatarBackground: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF372828)
                  : Color.fromARGB(255, 255, 237, 237),
              title: "Can I Save a Favourite Word?",
              content:
                  "You can save any word to your favourites by tapping the bookmark icon next to the word. All your saved words will be available in the Favourites section for quick access later.",
            ),

            _privacy(
              icon: Icons.wifi,
              iconColor: Color(0xFFF97084),
              avatarBackground: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF3C1D34)
                  : Color.fromARGB(255, 255, 214, 245),
              title: "doesn’t work offline",
              content:
                  "The dictionary requires an internet connection to look up words and fetch their meanings.Please make sure you are online to use all features.",
            ),

            SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Color(0xFF101B30)
                    : const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 0.5,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.transparent
                      : Color.fromARGB(255, 203, 203, 203),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                          ? Color(0xFF1C2D4D)
                          : const Color.fromARGB(255, 191, 213, 250),
                      child: Icon(Icons.email, color: Color(0xFF145BEC)),
                    ),
                    Text(
                      "Still have Question?",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "For any related questions, contact us.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF8998AC), fontSize: 15),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          emailLauncher();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "chandandas20314@gmail.com",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF145BEC),
                                fontSize: 15,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            Icon(Icons.arrow_outward, color: Color(0xFF145BEC)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _privacy({
    required IconData icon,
    required String title,
    required String content,
    required Color iconColor,
    required Color avatarBackground,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Color(0xFF1F2838)
            : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        shape: Border.fromBorderSide(BorderSide.none),
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: avatarBackground,
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            // color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[400]
                    : const Color.fromARGB(255, 95, 95, 95),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
