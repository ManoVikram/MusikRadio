import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/category_button.dart';
import '../../widgets/audio_card.dart';
import '../../screens/categoryScreen/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Subscriptions",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.redAccent,
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 36,
                      ),
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24.0,
                ),
                child: Text(
                  "Explore",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    height: 0,
                  ),
                ),
              ),
              SingleChildScrollView(
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
                        text: "Informative",
                        emoji: "🧠",
                        onTapped: () {
                          Navigator.of(context).pushNamed(
                            CategoryScreen.routeName,
                            arguments: {
                              "title": "🧠 Informative",
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
                    fontSize: 28,
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
                  return const AudioCard();
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
