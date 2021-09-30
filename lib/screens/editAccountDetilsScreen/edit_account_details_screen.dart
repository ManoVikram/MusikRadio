import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/provider/user_data.dart';

class EditAccountDetilsScreen extends StatefulWidget {
  const EditAccountDetilsScreen({Key? key}) : super(key: key);

  static const String routeName = "/editAccountDetailsScreen";

  @override
  State<EditAccountDetilsScreen> createState() =>
      _EditAccountDetilsScreenState();
}

class _EditAccountDetilsScreenState extends State<EditAccountDetilsScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();

  final _imagePicker = ImagePicker();

  XFile? _selectedProfilePicture;

  @override
  Widget build(BuildContext context) {
    final CurrentUser currentUserData =
        context.watch<CurrentUserData>().currnetUser;

    _nameController.text = currentUserData.name ?? "";
    _bioController.text = currentUserData.description ?? "";

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
                        // Icons.arrow_back_ios_new,
                        Icons.close,
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
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                            image: _selectedProfilePicture == null
                                ? (currentUserData.profilePictureURL == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/DefaultProfilePicture.jpg"),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image: NetworkImage(""),
                                        fit: BoxFit.cover,
                                      ))
                                : DecorationImage(
                                    image: FileImage(
                                      File(_selectedProfilePicture!.path),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () async {
                            final XFile? pickedImage = await _imagePicker
                                .pickImage(source: ImageSource.gallery);

                            setState(() {
                              _selectedProfilePicture = pickedImage;
                            });
                          },
                          child: Container(
                            height: 36,
                            width: 36,
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
