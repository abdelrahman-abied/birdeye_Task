import 'dart:io';

Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("connect");
      return true;
    } else {
      print("disconnect");
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
