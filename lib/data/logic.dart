import 'dart:io';
import 'package:osc/osc.dart';

// Method to get local IP address of the device
Future<String> getLocalIpAddress() async {
  final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4, includeLinkLocal: true);

  try {
    // Try VPN connection first
    NetworkInterface vpnInterface =
        interfaces.firstWhere((element) => element.name == "tun0");
    return vpnInterface.addresses.first.address;
  } on StateError {
    // Try wlan connection next
    try {
      NetworkInterface interface =
          interfaces.firstWhere((element) => element.name == "wlan0");
      return interface.addresses.first.address;
    } catch (ex) {
      // Try any other connection next
      try {
        NetworkInterface interface = interfaces.firstWhere(
            (element) => !(element.name == "tun0" || element.name == "wlan0"));
        return interface.addresses.first.address;
      } catch (ex) {
        return "No IP found";
      }
    }
  }
}

// method to send OSC message to the server
sendOscMessage(int por, String ip, String cmd) async {
  // Define the OSC message parameters
  final host = InternetAddress(ip);
  final address = cmd.split(' ')[0];

  // id the cmd is /startcue 0 0, then the arguments will be [0, 0], also remove the arguments from the cmd
  final arguments = cmd.split(' ').sublist(1).map((e) => int.parse(e)).toList();

  // Create the OSC message
  final message = OSCMessage(address, arguments: arguments);

  // Create a UDP socket
  final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
  try {
    // Send the OSC message
    final bytes = message.toBytes();
    socket.send(bytes, host, por);

    // Close the socket
    socket.close();
  } catch (e) {
    print('Error: $e');
  }
}
