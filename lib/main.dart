import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DataBase(),
    ),
  );

}

class DataBase extends StatefulWidget {
  const DataBase({Key? key}) : super(key: key);

  @override
  _DataBaseState createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {

  _connectDatabase() async {

    final roadDatabase = await getDatabasesPath();
    final destinationDatabase = join(roadDatabase, "myApp.db");

    openDatabase(
      destinationDatabase,
      version: 1,
      onCreate: (db, dbVersa){

      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

