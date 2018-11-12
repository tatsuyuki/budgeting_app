import 'package:budgetting_app/widgets/widgets.dart';

import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Account Page'),
      ),
      drawer: AppDrawer(),
      body: new Container(
        child: Text('Hello'),


      ),



    );
  }
}