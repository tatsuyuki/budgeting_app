import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

import 'package:budgeting_app/model/models.dart';

class DBHelper {
  static Database _db;
  final _lock = new Lock();


  Future<Database>initDb() async {
    io.Directory docsDirectory = await getApplicationDocumentsDirectory();
    String path = join(docsDirectory.path, 'budget.db');

    var theDb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Accounts(id INTEGER PRIMARY KEY, acName TEXT, acBal REAL)');
          print('table 1 created');
          await db.execute(
              'CREATE TABLE Category(id INTEGER PRIMARY KEY, catName TEXT)');
          print('table 2 created');
          await db.execute(
              'CREATE TABLE Entries(id INTEGER PRIMARY KEY, DATE INT, acName TEXT, catName TEXT, subCatName TEXT, desc TEXT, amount REAL)');
          print('table 3 created');
        });
    print('db Loaded');
    return theDb;
  }

  Future<Database> getDb() async {
    if (_db == null) {
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await initDb();
        } else {
          return _db;
        }
      });
    }
    return _db;
    }




  void saveAccount(AccountData account) async {
    var dbClient = await getDb();
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

  void saveCategory (CategoryData category) async {
    var dbClient = await getDb();
    await dbClient.transaction((txn) async {
      print('saving category');
      return await txn.rawInsert(
        'INSERT INTO Category(catName) VALUES(' +
          '\'' +
          category.name +
          '\'' +
          ')');
    });
  }

  void saveSubCategory (SubCategoryData subCategory) async {
    var dbClient = await getDb();
    String tableName = subCategory.catName;
    await createTable(tableName);
    await dbClient.transaction((txn) async {
      //print('saving subCategory');
      return await txn.rawInsert(
        'INSERT INTO $tableName(sub$tableName) VALUES(' +
          '\'' +
          subCategory.name +
          '\'' +
          ')');
    });
  }

  void saveEntries (EntriesData entry) async {
    var dbClient = await getDb();
    await dbClient.transaction((txn) async {
      print('saving entry');
      return await txn.rawInsert(
        'INSERT INTO Entries(DATE, acName, catName, subCatName, desc, amount) VALUES(' +
        '\'' +
        entry.msSinceEpoch.toString() +
        '\'' +
        ','  +
        '\'' +
        entry.acName +
        '\'' +
        ','  +
        '\'' +
        entry.catName +
        '\'' +
        ','  +
        '\'' +
        entry.subCatName +
        '\'' +
        ','  +
        '\'' +
        entry.desc +
        '\'' +
        ','  +
        '\'' +
        entry.amount.toString() +
        '\'' +
        ')');
    });
  }

  Future createTable (String tableName) async {
    var dbClient = await getDb();
    var obj = await dbClient.rawQuery('SELECT name FROM sqlite_master WHERE type=' + '\'' + 'table' + '\'' + 'AND name=' + '\'' + tableName + '\'');
    //print(obj.toString());
    if(obj.isEmpty) {
      //print('creating table');
      await dbClient.execute('CREATE TABLE $tableName(id INTEGER PRIMARY KEY, sub$tableName TEXT)');
      //print('table $tableName created');
    } else {
      //print('table already exist, $tableName');
    }
  }


  Future<List<AccountData>> getAccounts() async {
    var dbClient = await getDb();
    //print('Getting Accounts');
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Accounts');
    List<AccountData> accounts = new List();
    for(int i = 0; i < list.length; i++) {
      accounts.add(new AccountData(list[i]['acName'], list[i]['acBal']));
    }
    print(accounts.length);
    return accounts;
  }

  Future<double> getAccountSum() async {
    var dbClient = await getDb();
    //print('Adding Accounts sum');
    List<Map> list = await dbClient.rawQuery('SELECT acBal FROM Accounts');
    List<double> balance = new List();
    for(int i = 0; i < list.length; i++) {
      balance.add(list[i]['acBal']);
    }
    //print(balance.length);
    double sum = 0;
    for(double e in balance) {
      sum = e + sum;
    }
    return sum;
  }

  Future<List<CategoryData>> getCategoryList() async {
    var dbClient = await getDb();
    //print('Getting Category List');
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Category');
    List<CategoryData> categories = new List();
    for(int i = 0; i < list.length; i++) {
      categories.add(new CategoryData(list[i]['catName']));
    }
    return categories;
  }

  Future<List<SubCategoryData>> getSubCategory(String catName) async {
    var dbClient = await getDb();
    //print('Getting Sub Category');
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $catName');
    List<SubCategoryData> subCategory = new List();
    for(int i = 0; i < list.length; i++) {
      subCategory.add(new SubCategoryData(catName, list[i]['sub$catName']));
    }
    //print('getSub:list length ${subCategory.length}');
    return subCategory;

  }



}