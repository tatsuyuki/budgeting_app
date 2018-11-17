import 'package:flutter/material.dart';

import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/models.dart';


class FutureAccountGridBuild extends StatelessWidget {

  final List<Color> colorListGreen = [
    Colors.green[800],
    Colors.green[700],
    Colors.green[600],
    Colors.green[400],
  ];
  final List<Color> colorListRed = [
    Colors.red[800],
    Colors.red[700],
    Colors.red[600],
    Colors.red[400],
  ];

  @override
  Widget build(BuildContext context) {

    List<Color> colorList = new List<Color>();
    // TODO: implement build
    return new FutureBuilder<List<AccountData>>(
        future: fetchAccountListFromDb(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            print('3. loading data');
            print('ItemCount ${snapshot.data.length}');
            return new GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              padding: const EdgeInsets.all(1.0),
              itemBuilder: (BuildContext context, int index) {
                if(snapshot.data[index].balance >= 0) {
                  colorList = colorListGreen;
                } else {
                  colorList = colorListRed;
                }
                return new Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 0.5, 0.7, 0.9],
                          colors: colorList),
                    ),
                    child: new ListTile(
                      title: Text(
                          '${snapshot.data[index].name}: ${snapshot.data[index]
                              .balance}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),),
                      onLongPress: () {
                        final snackBar = SnackBar(
                          content: Text('Hi'),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                    ),
                  );

              }
            );
            } else {
            print('3. No Data');
            return new Container(
              width: 0.0,
              height: 0.0,
            );
          }
        });
  }

}



Future<List<AccountData>> fetchAccountListFromDb() async {
  var dbHelper = DBHelper();
  Future<List<AccountData>> accounts = dbHelper.getAccounts();
  return accounts;
}

