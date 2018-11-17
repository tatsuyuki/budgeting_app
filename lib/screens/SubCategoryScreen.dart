import 'package:flutter/material.dart';
import 'package:budgeting_app/widgets/widgets.dart';
import 'package:budgeting_app/model/models.dart';




class SubCategoryScreen extends StatelessWidget {
  final String catName;

  SubCategoryScreen({Key key, @required this.catName}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('$catName'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureSubCatListBuild(key: key, catName: catName),
          )
        ],
      ),
    );
  }

}