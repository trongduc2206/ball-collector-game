import 'package:hive_ce_flutter/hive_flutter.dart';

class LevelService {
  final storage = Hive.box("storage");
  final totalLevels = 3;
  get completedLevels => storage.containsKey('levels') ? [...storage.get('levels')].toSet() : Set();
  void completeLevel(int newLevel) {
    final newCompletedLevels = completedLevels..add(newLevel);
    storage.put('levels', newCompletedLevels); 
  }
  var currentLevel = 0;
}