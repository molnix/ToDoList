import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simpletodo/models/note_model.dart';

class UpdateTextButton extends StatefulWidget {
  const UpdateTextButton({Key? key}) : super(key: key);

  @override
  State<UpdateTextButton> createState() => _UpdateTextButtonState();
}

class _UpdateTextButtonState extends State<UpdateTextButton> {
  Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");

  TextEditingController NoteTextController = new TextEditingController();

  void updateNote(){
    
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _dialogBuilder(context),
      icon: Icon(Icons.text_snippet),
    );
  }

  Future<void> _dialogBuilder(BuildContext context){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Обновить содержимое"),
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
                TextButton(onPressed: (){updateNote();}, child: Text("Сохранить")),
              ],
            ),
          ],
        );
      },
    );
  }
}