import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/pages/configure_screen.dart';
import 'package:widgets/pages/home_screen.dart';
import 'package:widgets/pages/about_us_screen.dart';

class DrawerSection extends StatelessWidget {
  const DrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 123, 173),
      child: SizedBox(
        width: screenWidth < 600 ? screenWidth : 600,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 209, 125),
              ),
              child: Text(
                'Laser Slide',
                style: GoogleFonts.darkerGrotesque(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              iconColor: Colors.black,
              title: Text(
                'Home',
                style: GoogleFonts.darkerGrotesque(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            //
            //
            const Divider(
              color: Colors.black,
              indent: 10,
              endIndent: 20,
            ),
            //
            //
            ListTile(
              leading: const Icon(Icons.settings),
              iconColor: Colors.black,
              title: Text(
                'Configure',
                style: GoogleFonts.darkerGrotesque(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConfigurePage()),
                );
              },
            ),
            //
            //
            const Divider(
              color: Colors.black,
              indent: 10,
              endIndent: 20,
            ),
            //
            //
            ListTile(
              leading: const Icon(Icons.info),
              iconColor: Colors.black,
              title: Text(
                'About us',
                style: GoogleFonts.darkerGrotesque(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// method to check if the osc command is valid
bool isValidOsc(String cmd) {
  // split the command into parts
  List<String> parts = cmd.split(' ');

  // check if the first part starts with /
  if (!parts[0].startsWith('/')) {
    return false;
  }

  return true;
}
