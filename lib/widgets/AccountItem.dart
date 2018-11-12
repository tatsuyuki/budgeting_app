import 'package:flutter/material.dart';

import 'package:budgetting_app/model/AccountData.dart';

class AccountItem extends StatelessWidget {
  final AccountData account;

  AccountItem({Key key, @required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              child: Text(account.name),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              child: Text(account.type),
            )
          ],
        ),
      ),
    );
  }
}