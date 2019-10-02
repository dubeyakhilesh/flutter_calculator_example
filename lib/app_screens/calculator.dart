import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Calculator();
  }
}

class Calculator extends State<Calculate> {
  var _formKey = GlobalKey<FormState>();
  var minimumpadding = 5.0;
  TextEditingController tecFirst = TextEditingController();
  TextEditingController tecSecond = TextEditingController();
  var currencies = ['Rupee', 'Dollor', 'Other'];
  var selectedCurrency = 'Rupee';
  var result = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(minimumpadding * 2),
            child: ListView(
              children: <Widget>[
                getImage(),
                Padding(
                  padding: EdgeInsets.only(
                      top: minimumpadding, bottom: minimumpadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: tecFirst,
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Field can not be empty';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Enter First Number",
                        hintText: "Number in integer",
                        labelStyle: textStyle,
                        hintStyle: textStyle,
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(minimumpadding))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: minimumpadding, bottom: minimumpadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: tecSecond,
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Field can not be empty';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Enter Second Number",
                        labelStyle: textStyle,
                        hintStyle: textStyle,
                        hintText: "Number in integer",
                        errorStyle:
                            TextStyle(color: Colors.red, fontSize: 18.0),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(minimumpadding))),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Currency: ",
                      style: textStyle,
                    )),
                    Container(
                      width: minimumpadding,
                    ),
                    Expanded(
                        child: DropdownButton(
                      items: currencies.map((String dropDownItem) {
                        return DropdownMenuItem(
                          value: dropDownItem,
                          child: Text(
                            dropDownItem,
                            style: textStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (String item) {
                        setState(() {
                          this.selectedCurrency = item;
                        });
                      },
                      value: this.selectedCurrency,
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        elevation: 6.0,
                        child: Text(
                          "+",
                          style: textStyle,
                        ),
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate())
                              this.result = getResult(0);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: minimumpadding,
                    ),
                    Expanded(
                      child: RaisedButton(
                        elevation: 6.0,
                        child: Text(
                          "-",
                          style: textStyle,
                        ),
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.result = getResult(1);
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text(
                          "*",
                          style: textStyle,
                        ),
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.result = getResult(2);
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      width: minimumpadding,
                    ),
                    Expanded(
                        child: RaisedButton(
                      child: Text(
                        "/",
                        style: textStyle,
                      ),
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState.validate()) {
                            this.result = getResult(3);
                          }
                        });
                      },
                    ))
                  ],
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: minimumpadding),
                    child: Text(
                      result,
                      style: textStyle,
                    ))
              ],
            ),
          ),
        ));
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/cal.jpg');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(minimumpadding),
    );
  }

  String getResult(int n) {
    String res = '';
    int first = int.parse(tecFirst.text.toString().trim());
    int second = int.parse(tecSecond.text.toString().trim());

    switch (n) {
      case 0:
        return 'Addition result is: ' +
            (first + second).toString() +
            ' ' +
            selectedCurrency;
      case 1:
        return 'Substraction result is: ' +
            (first - second).toString() +
            ' ' +
            selectedCurrency;
      case 2:
        return 'Multiplication result is: ' +
            (first * second).toString() +
            ' ' +
            selectedCurrency;
      case 3:
        return 'Division result is: ' +
            (first / second).toString() +
            ' ' +
            selectedCurrency;
      default:
        return res;
    }
  }
}
