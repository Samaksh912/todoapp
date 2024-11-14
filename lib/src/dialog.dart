import 'package:flutter/material.dart';
import 'package:todo1/src/buttons.dart';
class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  Dialogbox({super.key,
    required this.controller,
    required this.oncancel,
    required this.onsave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pinkAccent,
      content: Container(height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //user input
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),
              hintText: "Add task here"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              //save button
              Mybutton(text: "Save", onPressed: onsave),

              const SizedBox(width: 20,),

              //cancel button
              Mybutton(text: "Cancel", onPressed: oncancel)

            ],
          ),
        ],

        ),
      ),
    );
  }
}
