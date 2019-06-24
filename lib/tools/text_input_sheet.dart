import 'package:flutter/material.dart';
import '../theme_data.dart';
import 'package:flutter/services.dart';
import '../tools/space_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

TextEditingController _textController = new TextEditingController();

void textInputSheet(context) {
  showModalBottomSheet<void>(
      context: context,
      shape: Ui.borderDefined,
      builder: (BuildContext context) {
        return Padding(
          //Important as This auto adjusts with the keyboard view
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 20.0, right: 20.0),
                child: TextField(
                  controller: _textController,
                  minLines: 1,
                  maxLines: 12,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: Ui.hintText,
                    hintStyle: Ui.hintStyle,
                    border: InputBorder.none,
                  ),
                  onSubmitted: _addMessage,
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Paste',
                      style: Ui.pastebuttonTextStyle,
                    ),
                    onPressed: () async {
                      ClipboardData data =
                          await Clipboard.getData('text/plain');
                      _textController.text = data.text ;
                    },
                  ),
                  FlatButton(
                      child: Text('Send', style: Ui.buttonTextStyle),
                      onPressed: () {
                        _addMessage(_textController.text);
                        Navigator.pop(context);
                      }),
                ],
              ),
            ],
          ),
        );
      });
}

Future _addMessage(String message) async {
  _textController.clear();
  await Firestore.instance
      .collection('data')
      .document(SpaceData.coordinates)
      .collection('planets')
      .add(<String, dynamic>{
    'message': message,
//    'date': FieldValue.serverTimestamp(),
    'date': DateTime.now(),
  });
}

Future<void> handlePaste() async {
  ClipboardData data = await Clipboard.getData('text/plain');
  _addMessage(data.text);
}
