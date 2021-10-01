import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/ModelProvider.dart';

class AudioCard extends StatelessWidget {
  final String channelName;
  final Audio audio;
  final Map<String, String> url;
  String? profilePictureUrl;

  AudioCard({
    Key? key,
    required this.channelName,
    required this.audio,
    required this.url,
    this.profilePictureUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {},
      child: Container(
        // height: 280,
        height: size.height * 0.35,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      url["thumbnailURL"]!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: profilePictureUrl == null
                            ? const DecorationImage(
                                image: AssetImage(
                                    "assets/images/DefaultProfilePicture.jpg"),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: NetworkImage(profilePictureUrl!),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            audio.title,
                            style: TextStyle(
                              fontFamily: GoogleFonts.roboto().fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                          // const Spacer(),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            channelName,
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
