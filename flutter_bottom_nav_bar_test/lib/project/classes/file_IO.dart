import 'dart:io';

import 'package:path_provider/path_provider.dart';

//Here creating a class for saving the notifications to a file
class NotificationStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notification.txt');
  }

  Future<DateTime> readNotificationFile() async {
    try {
      final file = await _localFile;

      final content = await file.readAsString();

      return DateTime.parse(content);
    } catch (e) {
      return DateTime(1970, 1, 1);
    }
  }

  Future<File> writeNotification(DateTime dt) async {
    final file = await _localFile;

    return file.writeAsString(dt.toString());
  }
}
