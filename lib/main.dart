import 'package:flutter/material.dart';
import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/AccountData.dart';
import 'package:budgeting_app/widgets/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //DBHelper().getDb();

    // TODO: implement build
    return MaterialApp(
      title: 'Budgeting App Test',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dummy Budgeting Test'),
        ),
        drawer: AppDrawer()
      ),
    );

  }




}

