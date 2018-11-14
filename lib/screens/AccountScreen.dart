import 'package:budgetting_app/widgets/widgets.dart';
import 'package:budgetting_app/model/models.dart';
import 'package:budgetting_app/database/DBHelper.dart';

import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return new Scaffold(

      appBar: new AppBar(
        title: Text('Account Page'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: FutureTotalBalance(),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 0,
            child: FutureAccountGridBuild(),
          )
        ],
      )
    );
  }





}