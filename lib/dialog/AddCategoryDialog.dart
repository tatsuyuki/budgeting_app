import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/models.dart';




class AddCategoryDialog extends StatefulWidget {

  @override
  AddCategoryDialogState createState() => new AddCategoryDialogState();

}

class AddCategoryDialogState extends State<AddCategoryDialog> {
  String catName;

  TextEditingController _catNameController;
  String _catName;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('New Category'),
          actions: <Widget>[
            new FlatButton(
                onPressed: () {
                  Navigator
                      .of(context)
                      .pop(_save());
                },
                child: new Text('SAVE',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Colors.white))),
          ],
        ),
        body: new Column(
          children: <Widget>[
            new ListTile(
              leading: Text('Category Name: '),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: 'Input Category Name',
                ),
                controller: _catNameController,
                onChanged: (value) => _catName = value,
              ),
            ),
          ],
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _catNameController = new TextEditingController();
  }

  void _save() {
    var category = CategoryData(_catName);
    var dbHelper = DBHelper();
    dbHelper.saveCategory(category);
  }
}