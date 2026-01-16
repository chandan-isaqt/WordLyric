import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget privacy({
  required IconData icon,
  required String title,
  required String content,
  required BuildContext context,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? Color(0xFF1F2838)
          : const Color.fromARGB(255, 255, 255, 255),
      // borderRadius: BorderRadius.circular(5),
      borderRadius: BorderRadius.circular(12),
    ),
    child: ExpansionTile(
      shape: Border.fromBorderSide(BorderSide.none),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color.fromARGB(255, 28, 52, 95)
            : const Color.fromARGB(255, 191, 213, 250),
        child: Icon(icon, color: Color(0xFF145BEC)),
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
                  ? Color.fromARGB(255, 141, 150, 160)
                  : Color.fromARGB(255, 141, 150, 160),
              height: 1.5,
            ),
          ),
        ),
      ],
    ),
  );
}
