import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/models.dart';




class AddSubCategoryDialog extends StatefulWidget {

  @override
  AddSubCategoryDialogState createState() => new AddSubCategoryDialogState();

}

class AddSubCategoryDialogState extends State<AddSubCategoryDialog> {
  String catName;
  String subCatName;

  TextEditingController _catNameController;
  TextEditingController _subCatNameController;
  String _catName;
  String _subCatName;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: const Text('New Sub Category'),
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
            new ListTile(
              leading: Text('Sub Category Name: '),
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: 'Input Sub Category Name',
                ),
                controller: _subCatNameController,
                onChanged: (value) => _subCatName = value,
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
    _subCatNameController = new TextEditingController();
  }

  void _save() {
    var subCategory = SubCategoryData(_catName, _subCatName);
    var dbHelper = DBHelper();
    //dbHelper.createTable(_catName);
    dbHelper.saveSubCategory(subCategory);
  }
}