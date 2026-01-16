import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget partofspech({
  required String title,
  required List items,
  required BuildContext context,
}) {
  if (items.isEmpty) return SizedBox.shrink();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color(0xFF0F2D49)
                  : Color.fromARGB(255, 224, 233, 253),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(4),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Color(0xFF1273D5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Expanded(child: Divider(thickness: 0.5, color: Colors.grey)),
        ],
      ),

      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}.",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        // color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item.definition,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          height: 1.5,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                if (item.example.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(width: 2, color: Colors.blue),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Example: ",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 33, 99, 181),
                              ),
                            ),
                            TextSpan(
                              text: "${item.example}",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Color(0xFF8898AB),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),

      SizedBox(height: 20),
    ],
  );
}
