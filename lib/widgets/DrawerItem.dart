import 'package:flutter/material.dart';
import 'package:budgetting_app/screens/AccountScreen.dart';
import 'package:budgetting_app/Dialog/AddAccountDialog.dart';

class DrawerItem extends StatelessWidget {
  final String accountHeading = 'Accounts';
  final String categoryHeading = 'Category';

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
          child: Text('Budgetting App'),
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

              },
            ),
            ListTile(
              title: Text('List Category'),
              onTap: () {

              },
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildExpansionTiles(context);
  }
}