import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';


// find a better way to do this

class PersistanceController {
  
  // write to the file
  static void storeState(String appStateJson) async {
    // get path
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    
    // get file
    final file = File('$path/app_state.json');
    file.writeAsString(appStateJson, mode: FileMode.writeOnly);
    print('\n***wrote to file***\n');
  }

  // load data
  static Future<String> readState() async {
    try {
      // get path
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;

      // get file
      final file = File('$path/app_state.json');

      final contents = await file.readAsString();

      print('\n***read from file***\n');

      return contents;
    } catch (e) {
      // If encountering an error
      return 'failed to read state data';
    }
  }
}