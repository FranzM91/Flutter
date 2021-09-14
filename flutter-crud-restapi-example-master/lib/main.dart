import 'package:flutter/material.dart';
import 'package:flutter_restapi/adddatawidget.dart';
import 'dart:async';
import 'package:flutter_restapi/models/cases.dart';
import 'package:flutter_restapi/services/api_service.dart';
import 'package:flutter_restapi/caseslist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  List<Cases> casesList;

  Future loadList() {
    Future<List<Cases>> futureCases = api.getCases();
    futureCases.then((casesList) {
      setState(() {
        this.casesList = casesList;
      });
    });
    return futureCases;
  }

  @override
  Widget build(BuildContext context) {
    if (casesList == null) {
      casesList = [];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: new Center(
            child: new FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return casesList.length > 0
                ? new CasesList(cases: casesList)
                : new Center(
                    child: new Text('No data found, tap plus button to add!',
                        style: Theme.of(context).textTheme.subtitle1));
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _navigateToAddScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataWidget()),
    );
  }
}
