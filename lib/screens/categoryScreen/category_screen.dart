import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/audio_card.dart';

import '../../models/bloc/fetchAudio/fetch_audio_bloc.dart';

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
        toolbarHeight: 70,
        title: Text(
          args["title"],
          style: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontSize: 28,
            // fontWeight: FontWeight.bold,
            letterSpacing: 1,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<FetchAudioBloc, FetchAudioState>(
        builder: (context, state) {
          if (state is FetchAudioInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FetchAudioSuccess) {
            if (state.audioData.audio.isEmpty) {
              return Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    "No audio uploded yet to this category!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AudioCard(
                  channelName: state.audioData.channelName[index],
                  audio: state.audioData.audio[index],
                  url: state.audioData.url[index],
                  profilePictureUrl: state.audioData.url[index]["profilePictureURL"],
                ),
                // itemBuilder: (context, index) => const Text("Audio Card here"),
                itemCount: state.audioData.audio.length,
              );
            }
          } else {
            return const Center(
              child: Text("Error!"),
            );
          }
        },
      ),
    );
  }
}
