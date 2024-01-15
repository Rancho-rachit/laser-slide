import 'package:flutter/material.dart';
import 'package:widgets/data/logic.dart';
import 'package:widgets/pages/configure_screen.dart';
import 'package:widgets/pages/home_screen.dart';

class buttonn extends StatefulWidget {
  final Color color;
  final String title;
  final String cmd;
  const buttonn({
    super.key,
    required this.color,
    required this.title,
    required this.cmd,
  });

  @override
  State<buttonn> createState() => _buttonState();
}

class _buttonState extends State<buttonn> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _isPressed ? Colors.grey[300] : Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (!editMode) {
            if (ip.isEmpty || port.isEmpty || !isValidIp(ip)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('IP or Port is empty or invalid'),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConfigurePage()),
              );
              return;
            }
            sendOscMessage(int.parse(port), ip, widget.cmd);
          } else {
            // if edit mode is enabled, then show a dialog to confirm the deletion
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Delete Button'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          const Text('Are you sure you want to delete?'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          // delete the button
                          buttons.remove(widget);
                          // update the buttons in the home screen
                          setState(() {});
                          // close the dialog
                          Navigator.of(context).pop();
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                });
          }
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(widget.title),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: [
                        Text('Command: ${widget.cmd}'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              });
        },
        child: Text(
          widget.title,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          // use the color passed to the button
          backgroundColor: widget.color,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}

bool isValidIp(String ip) {
  // split the ip address into 4 parts
  List<String> parts = ip.split('.');
  // check if the length is 4
  if (parts.length != 4) {
    return false;
  }
  // check if each part is a number between 0 and 255
  for (var part in parts) {
    int num = int.parse(part);
    if (num < 0 || num > 255) {
      return false;
    }
  }
  return true;
}
