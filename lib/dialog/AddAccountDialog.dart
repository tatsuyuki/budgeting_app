import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/AccountData.dart';




class AddAccountDialog extends StatefulWidget {

  @override
  AddAccountDialogState createState() => new AddAccountDialogState();

}

class AddAccountDialogState extends State<AddAccountDialog> {
  String accountName;
  String accountType;
  TextEditingController _acNameController;
  TextEditingController _acTypeController;
  String _acName;
  double _acType;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: const Text('New Account'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
            save();
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Account Created')));
            _acNameController.clear();
            _acTypeController.clear();
            },
            child: new Text('SAVE',
            style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white)))
        ],
      ),
      body: new Column(
        children: <Widget>[
          new ListTile(
            leading: Text('Account Name: '),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Input Account Name',
              ),
              controller: _acNameController,
              onChanged: (value) => _acName = value,
            ),
          ),
          new ListTile(
            leading: Text('Account Balance: '),
            title: new TextField(
              decoration: new InputDecoration(
                hintText: 'Input Account Starting Balance',
              ),
              controller: _acTypeController,
              onChanged: (value) => _acType = double.parse(value),
            )
          )
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _acNameController = new TextEditingController();
    _acTypeController = new TextEditingController();
  }

  void save() {
    var account = AccountData(_acName, _acType);
    var dbHelper = DBHelper();
    dbHelper.saveAccount(account);
  }

}

