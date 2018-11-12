import 'package:flutter/material.dart';

import 'package:budgetting_app/model/AccountData.dart';
import 'package:budgetting_app/widgets/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final AccountData account = new AccountData('Salary', 'Income');
  final AccountData account2 = new AccountData('Entertainment', 'Expenses');





  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      title: 'Budgetting App Test',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dummy Budgetting Test'),
        ),
        drawer: AppDrawer()
      ),
    );

  }




}

