import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Audio Entertainment",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const AudioApp(),
    );
  }
}

class AudioApp extends StatelessWidget {
  const AudioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

void main() {
  runApp(const MyApp());
}
