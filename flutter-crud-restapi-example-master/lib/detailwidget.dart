import 'package:flutter/material.dart';
import 'editdatawidget.dart';
import 'services/api_service.dart';
// import 'editdatawidget.dart';
import 'models/cases.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.cases);

  final Cases cases;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Card(
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(
                    children: <Widget>[
                      _getContainer("Name", widget.cases.name),
                      _getContainer("Code", widget.cases.code),
                      _getContainer("Description", widget.cases.description),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          children: <Widget>[
                            Text("Bottones Cancel/Edit"),
                            ElevatedButton(
                              onPressed: () => {
                                _navigateToEditScreen(context, widget.cases)
                              },
                              child: Text('Edit',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            ElevatedButton(
                                onPressed: () => {_confirmDialog()},
                                child: Text('Delete',
                                    style: TextStyle(color: Colors.white))),
                            // RaisedButton(
                            //   splashColor: Colors.red,
                            //   onPressed: () {
                            //     _navigateToEditScreen(context, widget.cases);
                            //   },
                            //   child: Text('Edit', style: TextStyle(color: Colors.white)),
                            //   color: Colors.blue,
                            // ),
                            // RaisedButton(
                            //   splashColor: Colors.red,
                            //   onPressed: () {
                            //     _confirmDialog();
                            //   },
                            //   child: Text('Delete', style: TextStyle(color: Colors.white)),
                            //   color: Colors.blue,
                            // )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  Container _getContainer(String title, String subtitle) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Column(
        children: <Widget>[
          Text('$title:',
              style: TextStyle(color: Colors.black.withOpacity(0.8))),
          Text(subtitle, style: Theme.of(context).textTheme.subtitle1)
        ],
      ),
    );
  }

  _navigateToEditScreen(BuildContext context, Cases cases) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(cases)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            Text("Btn yes/no"),
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                api.deleteCase(widget.cases.id);
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            // FlatButton(
            //   child: Text('Yes'),
            //   onPressed: () {
            //     api.deleteCase(widget.cases.id);
            //     Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            //   },
            // ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
            // FlatButton(
            //   child: const Text('No'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
          ],
        );
      },
    );
  }
}
