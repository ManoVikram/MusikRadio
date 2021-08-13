import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAccountDetilsScreen extends StatelessWidget {
  EditAccountDetilsScreen({Key? key}) : super(key: key);

  static const String routeName = "/editAccountDetailsScreen";

  // If the user already have a name and bio, it should be passed to 'text' here
  final TextEditingController _nameController = TextEditingController(text: "");
  final TextEditingController _bioController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.done_rounded),
                      iconSize: 32,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 140,
                        width: 140,
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            // If the user doesn't have any image,
                            // display a default one here
                            image: NetworkImage(""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Name",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextField(
                  controller: _nameController,
                  style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 20,
                  ),
                  maxLength: 50,
                  cursorHeight: 24,
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  "Bio/Description",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                TextField(
                  controller: _bioController,
                  style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontSize: 20,
                  ),
                  minLines: 1,
                  maxLines: 7,
                  maxLength: 200,
                  textInputAction: TextInputAction.unspecified,
                  cursorHeight: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
