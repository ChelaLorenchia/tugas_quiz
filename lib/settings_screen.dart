import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: themeProvider
              .font, // Gunakan font yang dipilih untuk judul AppBar
        ),
        backgroundColor: themeProvider
            .theme.primaryColor, // Sesuaikan warna navbar dengan tema
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Theme:',
              style: themeProvider.font.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold), // Gunakan font yang dipilih
            ),
            const SizedBox(height: 10),
            // Pilih Tema
            ...List.generate(themeProvider.themes.length, (index) {
              return RadioListTile<int>(
                value: index,
                groupValue: themeProvider.themes.indexOf(themeProvider.theme),
                onChanged: (value) {
                  themeProvider.changeTheme(value!);
                },
                title: Text(
                  'Theme ${String.fromCharCode(65 + index)}',
                  style: themeProvider.font, // Gunakan font yang dipilih
                ),
              );
            }),
            const Divider(),
            Text(
              'Select Font:',
              style: themeProvider.font.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold), // Gunakan font yang dipilih
            ),
            const SizedBox(height: 10),
            // Pilih Font
            ...List.generate(themeProvider.fonts.length, (index) {
              return RadioListTile<int>(
                value: index,
                groupValue: themeProvider.fonts.indexOf(themeProvider.font),
                onChanged: (value) {
                  themeProvider.changeFont(value!);
                },
                title: Text(
                  'Font ${index + 1}',
                  style:
                      themeProvider.fonts[index], // Tampilkan font yang dipilih
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
