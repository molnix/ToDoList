import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simpletodo/models/note_model.dart';

class HeaderAddTaskButton extends StatefulWidget {
  const HeaderAddTaskButton({Key? key}) : super(key: key);

  @override
  State<HeaderAddTaskButton> createState() => _HeaderAddTaskButtonState();
}

class _HeaderAddTaskButtonState extends State<HeaderAddTaskButton> {
  Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");

  TextEditingController NoteTextController = new TextEditingController();

  void addNote(String text){
    notesBox.add(new NoteModel(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.teal[100],
          shape: CircleBorder(),
          padding: EdgeInsets.all(40),
        ),
        onPressed: () {_dialogBuilder(context);},
        child: const Icon(Icons.plus_one, color: Color.fromARGB(255, 87, 10, 134), size: 32),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Добавить новую запись"),
          content: TextField(
            controller: NoteTextController,
            maxLines: 5,
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Закрыть")),
                TextButton(onPressed: (){addNote(NoteTextController.text);NoteTextController.text = " ";}, child: Text("Добавить")),
              ],
            ),
          ],
        );
      },
    );
  }
}