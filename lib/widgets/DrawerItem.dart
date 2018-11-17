import 'package:flutter/material.dart';
import 'package:budgeting_app/screens/Screens.dart';
import 'package:budgeting_app/dialog/Dialogs.dart';

class DrawerItem extends StatelessWidget {
  final String accountHeading = 'Accounts';
  final String categoryHeading = 'Category';
  final String subCategoryHeading = 'Subcategory';

  final List<Color> colorList = new List();




  void addColor() {
    colorList.add(Colors.lightBlue);
    colorList.add(Colors.blue);
  }

  Widget _buildExpansionTiles(BuildContext context) {
    addColor();
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Budgeting App'),
          decoration: BoxDecoration(
              gradient: SweepGradient(colors: colorList)
          ),
        ),
        ExpansionTile(
          title: Text(accountHeading),
          children: <Widget>[
            ListTile(
              title: Text('Create Account'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAccountDialog(),
                    fullscreenDialog: true),

                );
              },
            ),
            ListTile(
              title: Text('List Accounts'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                );
                
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text(categoryHeading),
          children: <Widget>[
            ListTile(
              title: Text('Create Category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddCategoryDialog(),
                fullscreenDialog: true),
                );
              },
            ),
            ListTile(
              title: Text('List Category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryScreen()),
                );
              },
            )
          ],
        ),
        ExpansionTile(
          title: Text(subCategoryHeading),
          children: <Widget>[
            ListTile(
              title: Text('Create Sub Category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddSubCategoryDialog(),
                    fullscreenDialog: true),
                );
              },
            ),
            ListTile(
              title: Text('Sub Cat List'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubCategoryScreen(catName: 'fuel' )),
                );
              },
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildExpansionTiles(context);
  }
}