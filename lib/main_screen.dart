import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Variabel untuk menyimpan teks yang diketik oleh user
  String _userInput = '';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Screen',
          style: themeProvider.font, // Gunakan font yang dipilih untuk AppBar
        ),
        backgroundColor: themeProvider
            .theme.primaryColor, // Sesuaikan warna navbar dengan tema
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Teks yang diketik oleh pengguna dengan font yang dipilih
              Text(
                'Your input will appear here:',
                style: themeProvider.font.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 10),
              // TextField untuk input teks pengguna
              TextField(
                onChanged: (text) {
                  setState(() {
                    _userInput = text;
                  });
                },
                style: themeProvider.font
                    .copyWith(fontSize: 20), // Terapkan font pada TextField
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Type something...',
                  hintText: 'chela',
                  labelStyle: themeProvider.font, // Terapkan font pada label
                  hintStyle: themeProvider.font, // Terapkan font pada hint
                ),
              ),
              const SizedBox(height: 20),
              // Menampilkan teks yang sudah diketik
              Text(
                _userInput,
                style: themeProvider.font.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Tombol untuk pergi ke Settings
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
                child: Text(
                  'Go to Settings',
                  style: themeProvider.font, // Terapkan font pada teks tombol
                ),
                style: ElevatedButton.styleFrom(
                  textStyle:
                      themeProvider.font, // Terapkan font pada teks tombol
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
