import 'package:flutter/material.dart';
import 'package:budgeting_app/widgets/widgets.dart';




class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Category Page'),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: FutureCategoryListBuild(),
          )
        ],

      ),
    );
  }

}