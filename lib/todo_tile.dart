import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class ToDoTile extends StatelessWidget{
  final String TaskName;
  final bool TaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) ? deletetask;
  ToDoTile({super.key,
  required this.TaskName,
  required this.TaskCompleted,
  required this.onChanged, required this.deletetask
  });
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: deletetask,
                icon: MdiIcons.trashCanOutline,
                backgroundColor: Colors.redAccent,
                borderRadius: BorderRadius.circular(15),
              )
            ]),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              //check box
              Checkbox(value: TaskCompleted, onChanged: onChanged,activeColor: Colors.pink[900],),
              Flexible(child: Text(TaskName, overflow: TextOverflow.ellipsis, // This ensures long text is truncated with an ellipsis.
                maxLines: 1, // Limits the text to one line.
                style: TextStyle(decoration: TaskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
              )),
            ],
          ),
          decoration: BoxDecoration(color: Colors.pink,
          borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}