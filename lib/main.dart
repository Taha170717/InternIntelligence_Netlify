import 'package:flutter/material.dart';
import 'package:netlify/views/splashscreen.dart';
import 'package:provider/provider.dart';
import 'viewmodels/movie_viewmodel.dart'; // Import the MovieViewModel

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieViewModel(), // Provide MovieViewModel here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netlify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme globally
        primaryColor: Colors.black, // Netflix-style black background
        scaffoldBackgroundColor: Colors.black,
        hintColor: Colors.red, // Red accents for action elements
        appBarTheme: AppBarTheme(
          color: Colors.black, // App bar with dark background
          elevation: 0, // Minimal styling for a clean look
          titleTextStyle: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white), // Icon color in AppBar
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: Colors.white54,
            fontSize: 14,
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red, // Red buttons
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900], // Dark input fields
          hintStyle: TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: SplashScreen(), // Set SplashScreen as the home screen
    );
  }
}