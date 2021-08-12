import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import './screens/onBoardingScreens/onboarding_screen.dart';
import './screens/authenticationScreens/login_screen.dart';
import './screens/authenticationScreens/signup_screen.dart';
import './screens/otpScreen/otp_screen.dart';
import './screens/homeScreen/home_screen.dart';
import './screens/categoryScreen/category_screen.dart';
import './screens/searchScreen/search_screen.dart';
import './screens/subscriptionScreen/subscription_screen.dart';
import './screens/accountScreen/account_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: "Audio Entertainment",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        OtpScreen.routeName: (context) => OtpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        CategoryScreen.routeName: (context) => const CategoryScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
        SubscriptionScreen.routeName: (context) => const SubscriptionScreen(),
        AccountScreen.routeName: (context) => const AccountScreen(),
      },
      home: const AudioApp(),
    );
  }
}

class AudioApp extends StatelessWidget {
  const AudioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AccountScreen(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
