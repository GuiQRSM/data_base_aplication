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
    return definitiveDatabase;

    //print("StatusDB: ${definitiveDatabase.isOpen.toString()} ");

  }

  _saveDatabase() async {

    Database receiverConnector = await _connectDatabase();

    Map<String, dynamic> valuesTable = {
      "name":"Renata Abrantes",
      "age": 24
    };

    int showId = await receiverConnector.insert("users", valuesTable);

    //print("Save DataBase Status: ${showId.toString()}");

  }

  _listRecordsDatabase() async {

    Database receiverConnector = await _connectDatabase();

    String selectRecordsFromdb = "SELECT * FROM users";
    List listRecords = await receiverConnector.rawQuery(selectRecordsFromdb);

    for(var showUser in listRecords){
      print("item: ${showUser['id']}\n"
            "name: ${showUser['name']}\n"
            "age: ${showUser['age']}"
      );
    }

  }

  _listIdOfaRecordDb(int id) async {

    Database receiverConnector = await _connectDatabase();

    List userId = await receiverConnector.query(
      "users",
      columns: ["id", "name", "age"],
      where: "id = ?",
      whereArgs: [id],
    );

    for(var runnerQ in userId){
      print(
              "item: ${runnerQ['id']}\n"
              "name: ${runnerQ['name']}\n"
              "age: ${runnerQ['age']}"
      );
    }

  }

  _deleteRecordsDatabase(int id) async {

    Database receiverConnector = await _connectDatabase();

   int recordRemoved = await receiverConnector.delete(
      "users",
      where: "id = ?",
      whereArgs: [id],
    );

   print("Record Reomoved: ${recordRemoved.toString()}");

  }

  _updateRecordsDatabase(int id) async {

    Database receiverConnector = await _connectDatabase();

    receiverConnector.update(
      "users",
    );

  }

  @override
  Widget build(BuildContext context) {

    //_connectDatabase();
    //_saveDatabase();
    //_listRecordsDatabase();
    //_listIdOfaRecordDb();
    //_deleteRecordsDatabase(18);

    return Container();
  }
}

