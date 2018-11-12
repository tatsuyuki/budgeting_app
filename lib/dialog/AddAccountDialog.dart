import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'package:budgetting_app/model/AccountData.dart';




class AddAccountDialog extends StatefulWidget {

  @override
  AddAccountDialogState createState() => new AddAccountDialogState();

}

class AddAccountDialogState extends State<AddAccountDialog> {
  String accountName;
  String accountType;
  TextEditingController _nameController;
  TextEditingController _typeController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('New Account'),
        actions: <Widget>[
          new FlatButton(
              onPressed: () {

              },
              child: new Text('SAVE',
                style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.white))),
        ],
      ),
      body: Center(
        child: new Text('Hello world'),
      ),
    );
  }
}