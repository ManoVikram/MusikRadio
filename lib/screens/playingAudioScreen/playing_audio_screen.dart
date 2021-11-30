import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import '../../models/audioPlayerManager/audio_player_manager.dart';

class DurationState {
  final Duration current;
  final Duration buffered;
  final Duration total;

  DurationState({
    required this.current,
    required this.buffered,
    required this.total,
  });
}

class PlayingAudioScreen extends StatefulWidget {
  const PlayingAudioScreen({Key? key}) : super(key: key);

  static const String routeName = "/playingAudioScreen";

  @override
  State<PlayingAudioScreen> createState() => _PlayingAudioScreenState();
}

class _PlayingAudioScreenState extends State<PlayingAudioScreen> {
  bool isRepeatOn = false;
  double volumeValue = 100;

  AudioPlayerManager? _audioPlayerManager;

  @override
  void dispose() {
    _audioPlayerManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // "title", "channelName", "audioURL", "thumbnailURL", "profilePictureURL"

    _audioPlayerManager = AudioPlayerManager(url: args["audioURL"]);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    PopupMenuButton(
                      onSelected: (value) {},
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            "Share",
                            style: TextStyle(
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            ),
                          ),
                          value: 1,
                        ),
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            "View Channel",
                            style: TextStyle(
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            ),
                          ),
                          value: 2,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: size.width * 0.7,
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(args["thumbnailURL"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // const Spacer(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  args["title"],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                /* TextButton(
                  onPressed: () {},
                  child: Text(
                    "Channel Name",
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ), */
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(size.width * 0.4, 54),
                    maximumSize: Size(size.width * 0.6, 54),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(args["profilePictureURL"]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          args["channelName"],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Change the slider value according to the audio elapsed
                /* Slider(
                  value: 18,
                  min: 0,
                  max: 100,
                  activeColor: Colors.indigo,
                  thumbColor: Colors.greenAccent[400],
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Change these texts according to the lenght of the audio
                    Text("00:00"),
                    Text("01:00"),
                  ],
                ), */
                /* StreamBuilder<DurationState>(
                  stream: null,
                  builder: (context, snapshot) {
                    return ProgressBar(
                      progress: const Duration(milliseconds: 1000),
                      buffered: const Duration(milliseconds: 2000),
                      total: const Duration(milliseconds: 5000),
                      progressBarColor: Colors.indigo,
                      baseBarColor: Colors.white.withOpacity(0.24),
                      bufferedBarColor: Colors.white.withOpacity(0.24),
                      thumbColor: Colors.greenAccent[400],
                      barHeight: 3.0,
                      thumbRadius: 5.0,
                      onSeek: (duration) {
                        _player.seek(duration);
                      },
                    );
                  },
                ), */
                ValueListenableBuilder<ProgressBarState>(
                  valueListenable: _audioPlayerManager!.progressNotifier,
                  builder: (_, value, __) {
                    return ProgressBar(
                      progress: value.current,
                      buffered: value.buffered,
                      total: value.total,
                      progressBarColor: Colors.indigo,
                      baseBarColor: Colors.white.withOpacity(0.24),
                      bufferedBarColor: Colors.white.withOpacity(0.24),
                      thumbColor: Colors.greenAccent[400],
                      barHeight: 3.0,
                      thumbRadius: 5.0,
                      onSeek: _audioPlayerManager?.seek,
                      /* onSeek: (duration) {
                        _player.seek(duration);
                      }, */
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isRepeatOn = !isRepeatOn;
                          _audioPlayerManager?.toggleRepeat();
                        });
                      },
                      icon: isRepeatOn
                          ? const Icon(Icons.repeat_one)
                          : const Icon(Icons.repeat),
                      padding: const EdgeInsets.all(0),
                      iconSize: 30,
                      color: isRepeatOn
                          ? Colors.greenAccent[400]
                          : Colors.blueGrey[800],
                    ),
                    IconButton(
                      onPressed: _audioPlayerManager?.goBackward5Sec,
                      icon: const Icon(Icons.replay_5),
                      padding: const EdgeInsets.all(0),
                      iconSize: 48,
                      color: Colors.blueGrey[800],
                    ),
                    /* IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: const Text("Volume"),
                            children: [
                              SimpleDialogOption(
                                child: Slider(
                                  value: volumeValue,
                                  min: 0,
                                  max: 100,
                                  onChanged: (newValue) {
                                    setState(() {
                                      volumeValue = newValue;
                                      _audioPlayerManager.volume(volumeValue);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: const Icon(Icons.volume_up_rounded),
                      padding: const EdgeInsets.all(0),
                      iconSize: 48,
                      color: Colors.blueGrey[800],
                    ), */
                    /* IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.skip_previous),
                      padding: const EdgeInsets.all(0),
                      iconSize: 48,
                      color: Colors.blueGrey[800],
                    ), */
                    /* IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pause_circle_filled),
                      padding: const EdgeInsets.all(0),
                      iconSize: 72,
                      color: Colors.blueGrey[800],
                    ), */
                    ValueListenableBuilder<ButtonState>(
                      valueListenable: _audioPlayerManager!.buttonNotifier,
                      builder: (_, value, __) {
                        switch (value) {
                          case ButtonState.loading:
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              width: 62.0,
                              height: 62.0,
                              child: const CircularProgressIndicator(),
                            );
                          case ButtonState.paused:
                            return IconButton(
                              onPressed: _audioPlayerManager?.play,
                              icon: const Icon(Icons.play_circle_filled),
                              padding: const EdgeInsets.all(0),
                              iconSize: 72,
                              color: Colors.blueGrey[800],
                            );
                          case ButtonState.playing:
                            return IconButton(
                              onPressed: _audioPlayerManager?.pause,
                              icon: const Icon(Icons.pause_circle_filled),
                              padding: const EdgeInsets.all(0),
                              iconSize: 72,
                              color: Colors.blueGrey[800],
                            );
                        }
                      },
                    ),
                    IconButton(
                      onPressed: _audioPlayerManager?.goForward5Sec,
                      icon: const Icon(Icons.forward_5),
                      padding: const EdgeInsets.all(0),
                      iconSize: 48,
                      color: Colors.blueGrey[800],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      padding: const EdgeInsets.all(0),
                      iconSize: 30,
                      color: Colors.blueGrey[800],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.5,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod ante vitae orci bibendum, a hendrerit leo pulvinar. Cras rutrum lacus ex, at pellentesque nunc convallis at. Praesent a turpis semper, pulvinar risus sed, tempus odio. Proin cursus, neque maximus imperdiet mollis, quam dui hendrerit diam, quis posuere orci neque id neque. Vivamus finibus euismod egestas. Nunc eu ligula efficitur, pulvinar dui non, rutrum velit. Ut eget justo euismod, posuere magna sed, imperdiet libero. Etiam eu convallis ipsum, quis condimentum tortor. Suspendisse potenti. Vestibulum aliquam velit in arcu accumsan porta. Fusce pretium sapien eu metus venenatis tincidunt. Fusce vestibulum massa vel efficitur efficitur. Vivamus efficitur orci nec mauris posuere, id vehicula massa consectetur. Praesent hendrerit hendrerit vestibulum.",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
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
        ),
      ),
    );
  }
}
