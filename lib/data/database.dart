import 'package:hive/hive.dart';

class TodoDatabase{
  List Todolist = [];
  final thebox = Hive.box('mybox');

  //function when opening for first time ever
  void createinitdata(){
    Todolist = [
      ["Use plus button below to add new task",false],
      ["slide left,then tap on bin to delete the task",false],

    ];

  }
  //load data
  void loaddata(){
    Todolist = thebox.get('todolist');

  }

  // update database
  void updatedata(){
    thebox.put('todolist', Todolist);

  }
}