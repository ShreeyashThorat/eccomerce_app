import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Search Anything")));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Colors.brown.shade50, Colors.grey.shade100],
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              size: 28,
              color: Colors.black45,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                "Search Products....",
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.comfortaa(
                    fontSize: 17,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
