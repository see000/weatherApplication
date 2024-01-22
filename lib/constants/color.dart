// Light Theme
import 'package:flutter/material.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    // Define your text styles for the light theme
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    // Add more text styles as needed
  ),
  // Define other properties for the light theme
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.grey[900],
  textTheme: const TextTheme(
    // Define your text styles for the dark theme
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    // Add more text styles as needed
  ),
  // Define other properties for the dark theme
);