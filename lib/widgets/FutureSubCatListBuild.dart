import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/models.dart';

import 'package:flutter/material.dart';


class FutureSubCatListBuild extends StatefulWidget {
  final String catName;

  FutureSubCatListBuild({Key key, this.catName}) : super(key: key);

  @override
  FutureSubCatListState createState() => new FutureSubCatListState();
}

class FutureSubCatListState extends State<FutureSubCatListBuild> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('${widget.catName}');
    return FutureBuilder<List<SubCategoryData>>(
        future: fetchSubCatfromDb(widget.catName),
        builder: (context, snapshot) {
          //print('subcat snapshot${snapshot.toString()}');
          //print('subcat length ${snapshot.data.length}');
          //print(snapshot.hasData);
          if(snapshot.hasData) {
            return new ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return new ListTile(
                      title: Text(snapshot.data[index].name),
                    );
                });
          } else {
            return new Container(
              width: 0.0,
              height: 0.0,
            );
          }

        });
  }

}



Future<List<SubCategoryData>> fetchSubCatfromDb(String catName) async {
  var dbHelper = DBHelper();
  Future<List<SubCategoryData>> subCat = dbHelper.getSubCategory(catName);
  return subCat;
}