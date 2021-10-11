import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../models/bloc/uploadAudio/upload_audio_bloc.dart';

class AudioUploadScreen extends StatefulWidget {
  const AudioUploadScreen({Key? key}) : super(key: key);

  static const routeName = "/audioUploadScreen";

  @override
  State<AudioUploadScreen> createState() => _AudioUploadScreenState();
}

class _AudioUploadScreenState extends State<AudioUploadScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();

  FilePickerResult? audioResult;
  XFile? thumbnailResult;

  String? categorySelected = "🧠 Knowledge";
  String? audioFileName = "Select Audio";
  bool thumbnailSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final UploadAudioBloc uploadAudioBloc = context.watch<UploadAudioBloc>();

    return BlocConsumer<UploadAudioBloc, UploadAudioState>(
      listener: (context, state) {
        if (state is UploadAudioSuccess) {
          print("1. Audio Uploaded Successfully");
        } else if (state is UploadAudioFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? "Oops!! ERROR Uploading Audio!"),
              backgroundColor: Theme.of(context).errorColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UploadAudioInProgress) {
          return Scaffold(
            body: SafeArea(
              child: AudioUploadingScreen(size: size),
            ),
          );
        } else if (state is UploadAudioSuccess) {
          print("2. Audio Uploaded Successfully");
          return Scaffold(
            body: SafeArea(
              child: AudioUploadedSuccessfullyScreen(size: size),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close),
                      iconSize: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Show this at first, prompting the user to upload audio
                    Center(
                      child: InkWell(
                        onTap: () async {
                          audioResult = await FilePicker.platform
                              .pickFiles(type: FileType.audio);

                          if (audioResult != null) {
                            setState(() {
                              audioFileName = audioResult?.names.single;
                            });
                          }
                        },
                        child: SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 68,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(14),
                                      bottomLeft: Radius.circular(14),
                                    ),
                                    // color: Color(0xFF1DB950),
                                    color: Color(0xFF1DB950),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.cloud_upload_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  height: 68,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(14),
                                      bottomRight: Radius.circular(14),
                                    ),
                                    color: Colors.greenAccent[700],
                                  ),
                                  child: Center(
                                    child: Text(
                                      audioFileName!,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Show this only when the audio is uploading
                    /* Center(
                      child: CircularPercentIndicator(
                        radius: 120,
                        lineWidth: 12.0,
                        animation: true,
                        percent: 0.3,
                        center: Text(
                          // Change the percent based on the amount of audio size uploaded currently
                          // Maybe display 'Done' when upload complete
                          "30%",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.greenAccent[700],
                      ),
                    ), */
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        thumbnailResult = await imagePicker.pickImage(
                            source: ImageSource.gallery);

                        if (thumbnailResult != null) {
                          setState(() {
                            thumbnailSelected = true;
                          });
                        }
                      },
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        padding: thumbnailSelected
                            ? EdgeInsets.zero
                            : const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 20,
                              ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          border: Border.all(
                            width: 2,
                            color: Colors.blueGrey,
                          ),
                        ),
                        child: thumbnailSelected
                            ? ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Image.file(
                                  File(thumbnailResult!.path),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                        "assets/images/UploadThumbnail.png"),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Upload Thumbnail",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Note: If No Thumbnail Is Uploaded, Default One Will Be Used",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 0.7,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: DropdownButton<String>(
                        value: categorySelected,
                        onChanged: (String? category) {
                          setState(() {
                            categorySelected = category!;
                          });
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 36,
                        borderRadius: BorderRadius.circular(10),
                        isExpanded: true,
                        underline: Container(),
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        items: const [
                          "🧠 Knowledge",
                          "🎵 Music",
                          "📖 Stories",
                          "😂 Entertainment",
                        ].map((String categoryValue) {
                          return DropdownMenuItem(
                            value: categoryValue,
                            child: Text(categoryValue),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _titleController,
                      maxLength: 100,
                      autocorrect: true,
                      // autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _descriptionController,
                      maxLength: 500,
                      maxLines: 10,
                      autocorrect: true,
                      // autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // I don't find any use for this 'Cancel' button
                        // Maybe I might use it later
                        /* Expanded(
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.redAccent,
                                        onPrimary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12),
                                      ),
                                      icon: const Icon(Icons.close),
                                      label: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ), */
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (audioResult == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        const Text("Choose an audio file!"),
                                    backgroundColor:
                                        Theme.of(context).errorColor,
                                  ),
                                );
                              } else if (_titleController.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Enter audio title!"),
                                    backgroundColor:
                                        Theme.of(context).errorColor,
                                  ),
                                );
                              } else if (thumbnailResult == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text("Choose a thumbnail!"),
                                    backgroundColor:
                                        Theme.of(context).errorColor,
                                  ),
                                );
                              } else {
                                uploadAudioBloc.add(UploadAudio(
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                  category: categorySelected!,
                                  audioResult: audioResult!,
                                  thumbnailResult: thumbnailResult!,
                                ));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            icon: const Icon(Icons.done),
                            label: Text(
                              "Publish",
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          );
        }
      },
    );
  }
}

class AudioUploadedSuccessfullyScreen extends StatelessWidget {
  const AudioUploadedSuccessfullyScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Audio Uploaded Successfully!!🥳",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: size.width * 0.4,
            child: Image.asset(
              "assets/icons/SuccessTick.png",
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              fixedSize: Size(size.width * 0.5, size.width * 0.16),
            ),
            child: Text(
              "Done",
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AudioUploadingScreen extends StatelessWidget {
  const AudioUploadingScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Your Audio Is Uploading...⏳",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: size.width * 0.3,
            width: size.width * 0.3,
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
            ),
          ),
        ],
      ),
    );
  }
}
