import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  // Default theme dan font
  ThemeData _currentTheme = ThemeData.dark();
  TextStyle _currentFont = GoogleFonts.roboto();

  // Getter untuk theme dan font
  ThemeData get theme => _currentTheme;
  TextStyle get font => _currentFont;

  // List tema yang tersedia
  final List<ThemeData> themes = [
    ThemeData.light().copyWith(
        primaryColor: Colors.blue, scaffoldBackgroundColor: Colors.white),
    ThemeData.dark().copyWith(
        primaryColor: Colors.teal, scaffoldBackgroundColor: Colors.black),
    ThemeData(
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.yellow[100],
    ),
  ];

  // List font yang tersedia
  final List<TextStyle> fonts = [
    GoogleFonts.roboto(),
    GoogleFonts.lato(),
    GoogleFonts.pacifico(),
  ];

  // Fungsi untuk mengganti theme
  void changeTheme(int index) {
    _currentTheme = themes[index];
    notifyListeners(); // Memberitahu bahwa perubahan telah terjadi
  }

  // Fungsi untuk mengganti font
  void changeFont(int index) {
    _currentFont = fonts[index];
    notifyListeners(); // Memberitahu bahwa perubahan telah terjadi
  }
}
