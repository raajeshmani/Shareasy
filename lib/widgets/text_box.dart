import 'package:flutter/material.dart';
import '../theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../widgets/message_list.dart';
import '../pages/space_page.dart';

class TextBoxWidget extends StatelessWidget {
  TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 320,
            child: TextField(
              // textInputAction: TextInputAction.send,
              controller: _textController,
              minLines: 1,
              style: TextStyle(
                fontSize: 16.0,
              ),
              cursorWidth: 1.0,
              cursorColor: Colors.black,
              maxLines: 3,
              decoration: InputDecoration(
                  hintText: Ui.hintText,
                  hintStyle: Ui.hintStyle,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  focusColor: Ui.dividerColor,
                  enabledBorder: null,
//                  suffixIcon: Icon(Ui.sendIcon),
                  border: OutlineInputBorder(
//                  borderSide: BorderSide(width: 25.0),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
                        right: Radius.circular(30.0)),
                  )),
              onSubmitted: _addMessage,
            ),
//          decoration: BoxDecoration(
//            boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,)],
//          ),
          ),
          IconButton(
            onPressed: () => _addMessage(_textController.text),
            icon: Icon(Ui.sendIcon),
          ),
          Ink(
            decoration: ShapeDecoration(
                shape: StadiumBorder(),
                gradient: LinearGradient(colors: Ui.buttonGradient2)),
            child: FloatingActionButton(
              shape: CircleBorder(),
              tooltip: 'Paste',
              backgroundColor: Colors.transparent,
              onPressed: () => _handlePaste(),
              child: Icon(
                Ui.pasteIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _addMessage(String message) async {
    _textController.clear();
    await Firestore.instance.collection('data').add(<String, dynamic>{
      'message': message,
//    'date': FieldValue.serverTimestamp(),
      'date': DateTime.now(),
    });
    MessageList().callSetState();
  }

  Future<void> _handlePaste() async {
    ClipboardData data = await Clipboard.getData('text/plain');
    _addMessage(data.text);
  }
}
