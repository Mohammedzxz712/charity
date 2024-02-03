import 'package:hive/hive.dart';

import 'package:path_provider/path_provider.dart';

class HiveCache {
  static late Box myBox;
  static openHive() async {
    if (!Hive.isBoxOpen('localDB')) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    myBox = await Hive.openBox('localDB');
  }

  static Future<void> saveData(
      {required String key, required dynamic value}) async {
    myBox.put(key, value);
  }

  static dynamic getData({required String key}) {
    return myBox.get(key, defaultValue: false);
  }
}
