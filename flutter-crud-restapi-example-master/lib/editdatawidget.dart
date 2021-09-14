import 'package:flutter/material.dart';
import 'package:flutter_restapi/services/api_service.dart';
import 'models/cases.dart';

enum Gender { male, female }
enum Status { positive, dead, recovered }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void initState() {
    id = widget.cases.id;
    _nameController.text = widget.cases.name;
    _codeController.text = widget.cases.code;
    _addressController.text = widget.cases.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Code'),
                              TextFormField(
                                controller: _codeController,
                                decoration: const InputDecoration(
                                  hintText: 'Code',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter code';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Description'),
                              TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  hintText: 'Descrition',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter description';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    api.updateCases(
                                        id,
                                        Cases(
                                            name: _nameController.text,
                                            code: _codeController.text,
                                            description: _addressController.text,
                                          )
                                        );

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                              )
                              // RaisedButton(
                              //   splashColor: Colors.red,
                              //   onPressed: () {
                              //     if (_addFormKey.currentState.validate()) {
                              //       _addFormKey.currentState.save();
                              //       api.updateCases(
                              //           id,
                              //           Cases(
                              //               name: _nameController.text,
                              //               // gender: gender,
                              //               // age: int.parse(_ageController.text),
                              //               // address: _addressController.text,
                              //               description: _addressController.text,
                              //               // city: _cityController.text,
                              //               // country: _countryController.text,
                              //               // status: status
                              //             )
                              //           );

                              //       Navigator.pop(context);
                              //     }
                              //   },
                              //   child: Text('Save',
                              //       style: TextStyle(color: Colors.white)),
                              //   color: Colors.blue,
                              // )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
