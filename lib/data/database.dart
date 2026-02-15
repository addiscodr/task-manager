import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List<List<dynamic>> todoList = [];
  // reference the box
  final _myBox = Hive.box("myBox");
  static const String todoKey = "TODOLIST";

  // run this method if this is the first time ever opening this app
  void createInitialData() {
    todoList = [
      ["Do some coding", false],
      ["Go shoping", false],
    ];

    updateDatabase();
  }

  // load data from the database
  void loadData() {
    final data = _myBox.get(todoKey);

    if (data != null) {
      todoList = List<List<dynamic>>.from(
        data.map((item) => List<dynamic>.from(item)),
      );
    }
  }

  // update the database
  void updateDatabase() {
    _myBox.put(todoKey, todoList);
  }
}
