import 'package:flutter/material.dart';
import 'package:video_call/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}
