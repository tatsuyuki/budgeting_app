import 'package:budgeting_app/database/DBHelper.dart';

import 'package:flutter/material.dart';


class FutureTotalBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(
        future: fetchAccountBalanceSum(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return new Text('${snapshot.data}',
                textScaleFactor: 3.0);
          } else {
            return new Text('0',
                textScaleFactor: 3.0);
          }
        });
  }



  Future<double> fetchAccountBalanceSum() async {
    var dbHelper = DBHelper();
    Future<double> sum = dbHelper.getAccountSum();
    return sum;
  }

}