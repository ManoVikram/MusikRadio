import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categoryScreen/category_screen.dart';
import '../accountScreen/account_screen.dart';
import '../audioUploadScreen/audio_upload_screen.dart';
import '../searchScreen/search_screen.dart';
import '../subscriptionScreen/subscription_screen.dart';
import '../playingAudioScreen/playing_audio_screen.dart';

import '../../widgets/category_button.dart';
import '../../widgets/audio_card.dart';

import '../../models/ModelProvider.dart';

import '../../models/provider/user_data.dart';

import '../../models/bloc/featchAudioThumbnailURL/fetch_audio_thumbnail_url_bloc.dart';
import '../../models/bloc/uploadAudio/upload_audio_bloc.dart';
import '../../models/bloc/fetchCategories/fetch_categories_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _children = [
    const HomeScreenUI(),
    SearchScreen(),
    const SubscriptionScreen(),
    const AccountScreen(),
  ];

  /* void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } */

  @override
  Widget build(BuildContext context) {
    final CurrentUserData currentUserDataProvider =
        context.watch<CurrentUserData>();

    final FetchAudioThumbnailUrlBloc fetchUrlBloc =
        context.watch<FetchAudioThumbnailUrlBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(PlayingAudioScreen.routeName);
        },
        elevation: 7,
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.headphones_rounded),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // onTap: _onTapped,
        onTap: (index) async {
          if (index == 3 &&
              currentUserDataProvider.currentUser != null &&
              currentUserDataProvider.currentUser.isCreator) {
            List<Audio> uploadedAudio = await Amplify.DataStore.query(
              Audio.classType,
              where:
                  Audio.USERID.eq(currentUserDataProvider.currentUser.userID),
            );

            print(uploadedAudio);

            currentUserDataProvider.setAudioList = uploadedAudio;

            fetchUrlBloc.add(FetchCurrentCreatorContentURL(
              uploadedAudio: currentUserDataProvider.currentUser.audioUploads,
            ));
          }

          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.redAccent,
      ),
      body: _children[_selectedIndex],
    );
  }
}

class HomeScreenUI extends StatelessWidget {
  const HomeScreenUI({
    Key? key,
  }) : super(key: key);

  Future<List<AudioCategory>> _getUserAndCategoryData(
      BuildContext context) async {
    final CurrentUserData currentUserDataProvider =
        context.read<CurrentUserData>();

    AuthUser currentUser = await Amplify.Auth.getCurrentUser();
    User currentUserData = (await Amplify.DataStore.query(User.classType,
        where: User.EMAIL.eq(currentUser.username)))[0];

    if (currentUserData.profilePictureKey != null) {
      GetUrlResult profilePictureURL =
          await Amplify.Storage.getUrl(key: currentUserData.profilePictureKey!);

      currentUserDataProvider.setCurrentUserData = CurrentUser(
        email: currentUser.username,
        userID: currentUserData.id,
        profilePictureURL: profilePictureURL.url,
        isCreator: currentUserData.isCreator,
        name: currentUserData.name,
        description: currentUserData.description,
        followers: currentUserData.followers ?? [],
      );
    } else {
      currentUserDataProvider.setCurrentUserData = CurrentUser(
        email: currentUser.username,
        userID: currentUserData.id,
        isCreator: currentUserData.isCreator,
        name: currentUserData.name,
        description: currentUserData.description,
        followers: currentUserData.followers ?? [],
      );
    }

    print(currentUserDataProvider.currentUser.isCreator);

    List<AudioCategory> allCategories =
        await Amplify.DataStore.query(AudioCategory.classType);

    return allCategories;
  }

  @override
  Widget build(BuildContext context) {
    final currentUserProvider = context.watch<CurrentUserData>();

    final fetchAllCategoriesBloc = context.watch<FetchCategoriesBloc>();

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<AudioCategory>>(
          future: _getUserAndCategoryData(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 20,
                            bottom: 24,
                          ),
                          child: Text(
                            "Hi User 👋,",
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        // Should be shown only to creators
                        if (currentUserProvider.currentUser?.isCreator)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                fetchAllCategoriesBloc
                                    .add(const FetchCategories());

                                Navigator.of(context)
                                    .pushNamed(AudioUploadScreen.routeName);
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 32,
                              ),
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 20.0,
                      ),
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          height: 0,
                        ),
                      ),
                    ),
                    /* SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            CategoryButton(
                                text: "Music",
                                emoji: "🎵",
                                onTapped: () {
                                  Navigator.of(context).pushNamed(
                                    CategoryScreen.routeName,
                                    arguments: {
                                      "title": "🎵 Music",
                                    },
                                  );
                                }),
                            CategoryButton(
                              text: "Stories",
                              emoji: "📖",
                              onTapped: () {
                                Navigator.of(context).pushNamed(
                                  CategoryScreen.routeName,
                                  arguments: {
                                    "title": "📖 Stories",
                                  },
                                );
                              },
                            ),
                            CategoryButton(
                              text: "Knowledge",
                              emoji: "🧠",
                              onTapped: () {
                                Navigator.of(context).pushNamed(
                                  CategoryScreen.routeName,
                                  arguments: {
                                    "title": "🧠 Knowledge",
                                  },
                                );
                              },
                            ),
                            CategoryButton(
                              text: "Entertainment",
                              emoji: "😂",
                              onTapped: () {
                                Navigator.of(context).pushNamed(
                                  CategoryScreen.routeName,
                                  arguments: {
                                    "title": "😂 Entertainment",
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ), */
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.055,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: index == 0
                                ? const EdgeInsets.only(
                                    left: 16.0,
                                    top: 2.5,
                                    bottom: 2.5,
                                  )
                                : (index == snapshot.data!.length - 1
                                    ? const EdgeInsets.only(
                                        right: 16.0,
                                        top: 2.5,
                                        bottom: 2.5,
                                      )
                                    : const EdgeInsets.symmetric(
                                        vertical: 2.5)),
                            child: CategoryButton(
                              text: snapshot.data![index].title.substring(2),
                              emoji:
                                  snapshot.data![index].title.substring(0, 2),
                              onTapped: () {
                                Navigator.of(context).pushNamed(
                                  CategoryScreen.routeName,
                                  arguments: {
                                    "title": snapshot.data![index].title,
                                  },
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10,
                      ),
                      child: Text(
                        "For You...",
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      // physics: const BouncingScrollPhysics(),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        // return const AudioCard();
                        return const Text("Audio Card here");
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text("ERROR!"),
              );
            }
          },
        ),
      ),
    );
  }
}
