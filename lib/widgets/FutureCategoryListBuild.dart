import 'package:budgeting_app/database/DBHelper.dart';
import 'package:budgeting_app/model/models.dart';
import 'package:budgeting_app/widgets/widgets.dart';
import 'package:budgeting_app/screens/SubCategoryScreen.dart';
import 'package:flutter/material.dart';

class FutureCategoryListBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FutureBuilder<List<CategoryData>>(
        future: fetchCategoryListFromDb(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return new ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                print('snapshot index: ${snapshot.data[index].name}');
                return new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Expanded(
                          child: ListTile(
                            title: Text(snapshot.data[index].name),
                            onLongPress: () {
                              final snackBar = SnackBar(
                                content: Text('Hi'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(builder: (context) => SubCategoryScreen(catName: snapshot.data[index].name)),
                              );
                            }
                          ),
                      ),
                    ],
                  );
              }
            );
          } else {
            return new Container(
              width: 0.0,
              height: 0.0,
            );
          }
        });
  }

}


Future<List<CategoryData>> fetchCategoryListFromDb() async {
  var dbHelper = DBHelper();
  Future<List<CategoryData>> categories = dbHelper.getCategoryList();
  return categories;
}


