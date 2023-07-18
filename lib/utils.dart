import 'package:permission_handler/permission_handler.dart';

Future checkPermission() async {
  final permission = await Permission.camera.status;
  final audio = await Permission.microphone.status;

  print("permission camera : $permission");
  print("audio : $audio");

  if (!permission.isGranted) {
    await Permission.camera.request().then((value) async {
      if (!audio.isGranted) {
        await Permission.microphone.request();
      }
    });
  } else {
    if (!audio.isGranted) {
      await Permission.microphone.request();
    }
  }

  return Future.value(true);
}
