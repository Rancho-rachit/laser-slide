import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _ConfigurePageState();
}

class _ConfigurePageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerSection(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: // dark shade of blue
            const Color.fromARGB(255, 82, 109, 130),
        title: Text('About us',
            style: GoogleFonts.darkerGrotesque(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 221, 230, 237),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                //
                //
                const SizedBox(
                  height: 50,
                ),
                //
                //
                Image.asset(
                  'assets/logo.jpg',
                  width: 200,
                  height: 200,
                ),
                //
                //
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Liquid Galaxy',
                  style: GoogleFonts.darkerGrotesque(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                //
                //
                const SizedBox(
                  height: 50,
                ),
                //
                //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "Welcome to Liquid Galaxy, where immersive experiences meet limitless exploration! At Liquid Galaxy, we are dedicated to pushing the boundaries of spatial computing and transforming the way people engage with the world. Our cutting-edge technology combines panoramic displays, interactive interfaces, and geospatial data to create awe-inspiring environments that transport users to places they've only dreamed of. Whether you're navigating the wonders of Earth or venturing into the cosmos, Liquid Galaxy is your gateway to a new dimension of discovery. Join us on a journey beyond the ordinary, where curiosity knows no bounds and the possibilities are as vast as the universe itself. Elevate your perspective with Liquid Galaxy, where innovation meets imagination.",
                        style: GoogleFonts.darkerGrotesque(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
