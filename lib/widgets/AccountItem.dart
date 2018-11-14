import 'package:flutter/material.dart';

import 'package:budgetting_app/model/AccountData.dart';

class AccountItem extends StatelessWidget {
  final AccountData account;

  AccountItem({Key key, @required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Account: ${account.name}, Balance: ${account.balance.toString()}'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                //button press implementation
              },
            )
          ],
        ),
      ),
      margin: new EdgeInsets.all(5.0),

    );
  }
}