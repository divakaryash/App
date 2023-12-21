import 'package:aaaaa/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget{
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter Learn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.dmSans().fontFamily
      ),
      home: const HomeView(),
    );
  }
}