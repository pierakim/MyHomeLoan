import 'package:flutter/material.dart';
import 'package:my_home_loan/Database/DatabaseHelper.dart';

class MyCollectionComponent extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: downloadData(), // function where you call your api
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          // AsyncSnapshot<Your object type>
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else
              return Center(
                  child: new Text(
                      '${snapshot.data}')); // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        });

    // return Scaffold(
    //   body: GridView.count(
    //       childAspectRatio: 10.0,
    //       crossAxisCount: 1,
    //       children: List.generate(100, (index) {
    //         return Text(
    //           'Item $index',
    //         );
    //       })),
    // );

    //     Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       ElevatedButton(
    //         child: Text(
    //           'insert',
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         onPressed: () {
    //           _insert();
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text(
    //           'query',
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         onPressed: () {
    //           _query();
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text(
    //           'update',
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         onPressed: () {
    //           _update();
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text(
    //           'delete',
    //           style: TextStyle(fontSize: 20),
    //         ),
    //         onPressed: () {
    //           _delete();
    //         },
    //       ),
    //     ],
    //   ),
    // ),
    // );
  }

  Future<String> downloadData() async {
    final allRows = await dbHelper.queryAllRows();
    //   var response =  await http.get('https://getProjectList');
    return Future.value("Data download successfully"); // return your response
  }

  // Button onPressed methods

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnValue01: 10,
      DatabaseHelper.columnValue02: 10
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnValue01: 20,
      DatabaseHelper.columnValue02: 20
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
