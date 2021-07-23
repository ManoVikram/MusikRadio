import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> _images = [
    "assets/images/onBoardingScreen/OnBoarding Screen 1.png",
    "assets/images/onBoardingScreen/OnBoarding Screen 2.png",
    "assets/images/onBoardingScreen/OnBoarding Screen 3.png",
  ];

  AnimatedContainer _buildDots(int screenNumber, int index) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: screenNumber == index ? 20 : 7,
      decoration: BoxDecoration(
        color: screenNumber == index ? Colors.cyanAccent : Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      _images[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (index == 2)
              Positioned(
                bottom: 80,
                // left: size.width / 2 - 80,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 7,
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26.0,
                      vertical: 12.0,
                    ),
                  ),
                  child: const Text("Take Me In"),
                ),
              ),
              Positioned(
                bottom: 30,
                // left: size.width / 2 - 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      _images.length,
                      (bulletIndex) => _buildDots(index, bulletIndex),
                    ),
                  ],
                ),
              ),
            ],
          ),
          itemCount: _images.length,
        ),
      ),
    );
  }
}
