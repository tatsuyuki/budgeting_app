import 'package:budgetting_app/database/DBHelper.dart';

import 'package:flutter/material.dart';


class FutureTotalBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder(
        future: fetchAccountBalanceSum(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return new Text('Total Bal: ${snapshot.data}',
                textScaleFactor: 3.0);
          } else {
            return new Text('Total Bal: 0',
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