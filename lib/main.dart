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

    var definitiveDatabase = await openDatabase(
      destinationDatabase,
      version: 1,
      onCreate: (db, dbVersa){
        db.execute("CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, age INTEGER)");
      }
    );

    //print("StatusDB: ${definitiveDatabase.isOpen.toString()} ");

  }

  @override
  Widget build(BuildContext context) {

    _connectDatabase();

    return Container();
  }
}

