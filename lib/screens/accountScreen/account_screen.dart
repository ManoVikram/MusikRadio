import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../editAccountDetilsScreen/edit_account_details_screen.dart';

import '../../widgets/audio_card.dart';

import '../../models/provider/user_data.dart';

import '../../models/bloc/featchAudioThumbnailURL/fetch_audio_thumbnail_url_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static const String routeName = "/accountScreen";

  @override
  Widget build(BuildContext context) {
    final CurrentUser currentUserData =
        context.watch<CurrentUserData>().currnetUser;

    return Scaffold(
      appBar: AppBar(
        // Show this back button only while viewing others' account
        // and not while viewing our own account
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
            color: Colors.black,
          ),
          // Show this edit button only while viewing our account
          // and not while viewing others' account
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditAccountDetilsScreen.routeName);
            },
            icon: const Icon(
              Icons.edit,
            ),
            color: Colors.black,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          // If the user haven't set any image, show a default image here
                          // Use eitther the AssetImage or NetworkImage for the default one
                          image: NetworkImage(""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Bio Data/Description",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Change the text and color of the button based on whether the user
                    // follows or unfollows
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.redAccent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          // minimumSize: const Size(200, 40),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: Colors.black,
                          ),
                          children: const [
                            // Check this to convert number to human readable format:
                            // https://stackoverflow.com/questions/54690790/convert-a-number-to-human-readable-format-e-g-1-5k-5m-1b-in-dart/54691084
                            TextSpan(
                              text: "1234\n",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "Followers",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
              ),
              // If the user haven't uploaded any content display this
              if (currentUserData.audioUploads == null)
                Text(
                  "You haven't uploaded any content yet!",
                  style: TextStyle(
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: Colors.grey,
                  ),
                ),
              // Else display this
              if (currentUserData.audioUploads != null)
                BlocBuilder<FetchAudioThumbnailUrlBloc, FetchURLState>(
                  builder: (context, state) {
                    return state is FetchURLInProgress
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: (state as FetchURLSuccess)
                                .uploadedContentUrl
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              return AudioCard(
                                audio: currentUserData.audioUploads![index],
                                url: state.uploadedContentUrl[index],
                              );
                            },
                          );
                  },
                ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
