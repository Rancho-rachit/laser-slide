import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/widgets/button.dart';
import 'package:widgets/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool editMode = false;

// list of buttons
List<buttonn> buttons = [
  buttonn(
    color: Colors.green,
    title: 'Button',
    cmd: '/default',
  ),
];

class _HomePageState extends State<HomePage> {
  Color pickerColor = const Color.fromARGB(255, 82, 109, 130);
  void onColorChanged(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

  final textController = TextEditingController();
  final cmdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: editMode ? Colors.black : Colors.grey[900],
      drawer: const DrawerSection(),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                editMode = !editMode;
                if (editMode)
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit mode enabled'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                else
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit mode disabled'),
                      duration: Duration(seconds: 1),
                    ),
                  );
              });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 82, 109, 130),
        title: Text('Home',
            style: GoogleFonts.darkerGrotesque(
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 221, 230, 237),
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
      //
      //
      // add new function
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: pickerColor,
                title: Text(
                  'Create a new button',
                  style: GoogleFonts.darkerGrotesque(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 221, 230, 237),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        style: GoogleFonts.darkerGrotesque(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 221, 230, 237),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        controller: textController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Button Name',
                          hintStyle: GoogleFonts.darkerGrotesque(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 221, 230, 237),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      const SizedBox(height: 20),
                      //
                      //
                      TextField(
                        style: GoogleFonts.darkerGrotesque(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 221, 230, 237),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        controller: cmdController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'OSC Command',
                          hintStyle: GoogleFonts.darkerGrotesque(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 221, 230, 237),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      const SizedBox(height: 20),
                      //
                      //
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Pick a color!',
                                  style: GoogleFonts.darkerGrotesque(
                                    textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 221, 230, 237),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    color: pickerColor,
                                    enableShadesSelection: false,
                                    onColorChanged: onColorChanged,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Got it'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Pick a color'),
                      ),
                    ],
                  ),
                ),
                //
                //
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      textController.clear();
                      cmdController.clear();
                    },
                    child: const Text('Cancel'),
                  ),
                  //
                  //
                  TextButton(
                    onPressed: () {
                      if (textController.text.isEmpty ||
                          cmdController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Please enter the details.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      //
                      //
                      else if (!isValidOsc(cmdController.text)) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'Please enter a valid OSC command.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        Navigator.pop(context);

                        setState(() {
                          buttons.add(
                            buttonn(
                              color: pickerColor,
                              title: textController.text,
                              cmd: cmdController.text,
                            ),
                          );
                        });
                        textController.clear();
                        cmdController.clear();
                      }
                    },
                    child: const Text('Create'),
                  ),
                ],
              );
            },
          );
        },
        //
        //
        child: const Icon(Icons.add),
        //
        //
      ),
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisCount: MediaQuery.of(context).size.width > 1000
              ? 8
              : MediaQuery.of(context).size.width > 600
                  ? 6
                  : MediaQuery.of(context).size.width > 400
                      ? 4
                      : 2,
          children: List.generate(
            buttons.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: buttons[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
