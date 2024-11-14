import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo1/data/database.dart';
import 'package:todo1/src/dialog.dart';
import 'package:todo1/todo_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
 class HomePage extends StatefulWidget{
   const HomePage({super.key});



   State<HomePage> createState() => _HomePageState();
 }
 class _HomePageState extends State<HomePage>{

   final thebox = Hive.box('mybox');
   // text controller
   final control = TextEditingController();
   // list for todolist
   TodoDatabase db = TodoDatabase();
   @override
   void initState(){
     //when 1st time ever app open
     if(thebox.get('todolist') == null){

       db.createinitdata();

     }
     else{
       //there is data
       db.loaddata();
     }
     super.initState();
   }
   void checkBoxChanged(bool? value,int index){
     setState((){
       db.Todolist[index][1] = !db.Todolist[index][1];
       db.updatedata();
     });
   }
   // save task
   void savenewtask(){
     setState(() {
       db.Todolist.add([control.text,false]);
       control.clear();
       db.updatedata();
     });
     //cancel

     Navigator.of(context).pop();


   }
   //new task maker
   void createnewtask(){
     showDialog(context: context, builder: (context){
       return Dialogbox(
         controller: control ,
         onsave: savenewtask,
         oncancel: () => Navigator.of(context).pop(),
       );


     },);
   }
   //delete task
   void delete(int index){
     setState(() {
       db.Todolist.removeAt(index);
       db.updatedata();
     });
   }
   @override
   Widget build(BuildContext context){
     return Scaffold(
       backgroundColor: Colors.pink[200],
       appBar: AppBar(
         backgroundColor: Colors.pink[400],
         title: Center(child: Text('TO DO')),
         elevation: 0,
       ),
       floatingActionButton: FloatingActionButton(onPressed: createnewtask,
         child: Icon(MdiIcons.plus),
       ),
       body: ListView.builder(
         itemCount: db.Todolist.length,
         itemBuilder: (context, index){
           return ToDoTile(TaskName: db.Todolist[index][0], TaskCompleted: db.Todolist[index][1], onChanged:(value) => checkBoxChanged(value,index),
             deletetask: (context) => delete(index),
           );
         },
       ),
     );



   }
 }
