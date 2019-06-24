import 'package:flutter/material.dart';
import 'package:shareasy/theme_data.dart';

class _newBdy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Press me'),
        onPressed: () => showModalBottomSheet<void>(
            context: context,
            shape: Ui.borderDefined,
            builder: (BuildContext context) {
              return Padding(
                //Important as This auto adjusts with the keyboard view
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12.0, left: 20.0, right: 20.0),
                      child: TextField(
                        minLines: 1,
                        maxLines: 12,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: Ui.hintText,
                          hintStyle: Ui.hintStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('Paste',style: Ui.buttonTextStyle,),
                          onPressed: () => {},
                        ),
                        FlatButton(
                          child: Text('Send',style: Ui.buttonTextStyle),
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Voila'),
        ),
        body: _newBdy(),
      ),
    );
  }
}
