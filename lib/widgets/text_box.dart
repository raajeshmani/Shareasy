import 'package:flutter/material.dart';
import '../theme_data.dart';
import '../widgets/message_list.dart';
import '../pages/space_page.dart';

class TextBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = new TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 320,
            child: TextField(
              textInputAction: TextInputAction.send,
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
              onSubmitted: addMessage,
            ),
//          decoration: BoxDecoration(
//            boxShadow: [BoxShadow(blurRadius: 10,color: Colors.grey,)],
//          ),
          ),
          IconButton(
            onPressed: () => addMessage(_textController.text),
            icon: Icon(Ui.sendIcon),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
//          foregroundDecoration: BoxDecoration(
//            backgroundBlendMode: BlendMode.color,
//            gradient: LinearGradient(colors: Ui.gradientColors),
//          ),
            child: FloatingActionButton(
//            color: Colors.white,
              shape: CircleBorder(),
              tooltip: 'Paste',

              backgroundColor: Ui.buttonColor,
              onPressed: () => handlePaste(),
              child: Icon(
                Ui.pasteIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
