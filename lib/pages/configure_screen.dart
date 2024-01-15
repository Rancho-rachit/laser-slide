import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/data/logic.dart';
import 'package:widgets/widgets/drawer.dart';

class ConfigurePage extends StatefulWidget {
  const ConfigurePage({super.key});

  @override
  State<ConfigurePage> createState() => _ConfigurePageState();
}

var ip = '';
var port = '';

class _ConfigurePageState extends State<ConfigurePage> {
  final ipController = TextEditingController();
  final portController = TextEditingController();

  // how to use the above variables in the button.dart file?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerSection(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 82, 109, 130),
        title: Text('Configure',
            style: GoogleFonts.darkerGrotesque(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 221, 230, 237),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              FutureBuilder<String>(
                future: getLocalIpAddress(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      'Local IP Address: ${snapshot.data}',
                      style: GoogleFonts.darkerGrotesque(
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 221, 230, 237),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: ipController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'IP Address',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: portController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Port Number',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ip = ipController.text;
                    port = portController.text;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('IP address and port number saved'),
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  // use the color passed to the button
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
