import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  static const routeName = "/searchScreen";

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _searchController,
                autocorrect: true,
                showCursor: true,
                cursorHeight: 24,
                cursorColor: Colors.blueGrey,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontFamily: GoogleFonts.roboto().fontFamily,
                ),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 20,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.deepOrange,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.indigoAccent,
                      width: 3.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.blueGrey[400]!,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              // Search resutls will be displayed here in a ListTile format
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) => const ListTile(),
                itemCount: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
