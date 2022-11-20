import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:simpletodo/models/note_model.dart';

import '../main.dart';

class NotesList extends StatefulWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  Box<NoteModel> notesBox = Hive.box<NoteModel>("notes");

  DateTime scheduleNotificationDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notesBox.listenable(),
      builder: (context, Box<NoteModel> box, _){
        if(box.values.isEmpty){
          return Center(
            child: Text("Пусто"),
          );
        }
        return SafeArea(
          child: ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index){
              NoteModel res = box.getAt(index) as NoteModel;
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction){
                  notesBox.deleteAt(index);
                },
                background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_left),
                      Icon(Icons.delete_forever),
                      Icon(Icons.arrow_right),
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                  child: ListTile(
                    title: Text(res.text),
                    trailing: IconButton(
                      icon: Icon(Icons.alarm_add),
                      onPressed: (){_dialogBuilder(context, index);},
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _dialogBuilder(BuildContext context, int index){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Напомнить"),
          content: Container(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  scheduleNotificationDateTime = newDateTime;
                },
                use24hFormat: true,
                minuteInterval: 1,
              ),
            ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Закрыть")),
                TextButton(onPressed: (){
                  NoteModel box = notesBox.getAt(index) as NoteModel;
                  String body = box.text;
                  scheduleAlarm(scheduleNotificationDateTime, index, body);
                  Navigator.of(context).pop();
                }, 
                child: Text("Установить")),
              ],
            ),
          ],
        );
      },
    );
  }
}