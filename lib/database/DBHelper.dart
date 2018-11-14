import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:budgetting_app/model/models.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }

  Future<Database>initDb() async {
    io.Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, 'budget.db');

    var theDb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Accounts(id INTEGER PRIMARY KEY, acName TEXT, acBal REAL)');
          print('table 1 created');
          await db.execute(
              'CREATE TABLE Category(id INTEGER PRIMARY KEY, catName TEXT, catType TEXT)');
          print('table 2 created');
        });
    return theDb;
  }

  void saveAccount(AccountData account) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      print('saving account');
      return await txn.rawInsert(
        'INSERT INTO Accounts(acName, acBal) VALUES(' +
          '\'' +
          account.name +
          '\'' +
          ','  +
          '\'' +
          account.balance.toString() +
          '\'' +
          ')');
    });
  }


  Future<List<AccountData>> getAccounts() async {
    var dbClient = await db;
    print('Getting Accounts');
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Accounts');
    List<AccountData> accounts = new List();
    for(int i = 0; i < list.length; i++) {
      accounts.add(new AccountData(list[i]['acName'], list[i]['acBal']));
    }
    print(accounts.length);
    return accounts;
  }

  Future<double> getAccountSum() async {
    var dbClient = await db;
    print('Adding Accounts');
    List<Map> list = await dbClient.rawQuery('SELECT acBal FROM Accounts');
    List<double> balance = new List();
    for(int i = 0; i < list.length; i++) {
      balance.add(list[i]['acBal']);
    }
    print(balance.length);
    double sum = 0;
    for(double e in balance) {
      sum = e + sum;
    }
    return sum;
  }



}