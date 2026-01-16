import 'package:dictonary/widgets/privacy_Iteam.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
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

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Privacy Policy"),
      ),
      body: Container(
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Center(
              child: Text(
                "LAST UPDATED: DEC 24, 2025",
                style: GoogleFonts.averiaLibre(
                  fontSize: 12,
                  color: const Color(0xFF748093),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "WordLyric respects your privacy and is committed to protecting your personal information. This Privacy Policy explains what information we collect, how we use it, and your rights.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 141, 150, 160),
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),

            privacy(
              context: context,
              icon: Icons.info,
              title: "Information We Collect",
              content:
                  "We do not require personal information to use the app. We may collect non-personal data such as app usage, crash reports, and analytics to improve the app. Device type, operating system, and app version may be collected anonymously.",
            ),

            privacy(
              context: context,
              icon: Icons.admin_panel_settings_outlined,
              title: "How We Use Your Information",
              content:
                  "We collect data to improve app performance and features, fix bugs and enhance user experience, and understand app usage trends through anonymous analytics.",
            ),

            privacy(
              context: context,
              icon: Icons.share,
              title: "Sharing Your Information",
              content:
                  "We do not sell, trade, or share your personal information with third parties. Anonymous analytics data may be shared with service providers to help improve the app.",
            ),

            privacy(
              context: context,
              icon: Icons.cookie_outlined,
              title: "Third-Party Services",
              content:
                  "Our app may use third-party services (like ads or analytics). These services may collect information separately. We encourage you to review their privacy policies.",
            ),

            privacy(
              context: context,
              icon: Icons.security_outlined,
              title: "Security",
              content:
                  "We take reasonable steps to protect your information. However, no method of electronic storage or transmission is 100% secure.",
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
                    Text("Have more Question?", style: TextStyle(fontSize: 20)),
                    Text(
                      "If you have questions about this Privacy Policy",
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

}