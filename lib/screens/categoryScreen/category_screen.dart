import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/audio_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  static const routeName = "/categoryScreen";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        title: Text(
          args["title"],
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 30,
            // fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        // itemBuilder: (context, index) => const AudioCard(),
        itemBuilder: (context, index) => const Text("Audio Card here"),
        itemCount: 3,
      ),
    );
  }
}
