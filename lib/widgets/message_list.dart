import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../theme_data.dart';
import 'package:timeago/timeago.dart' as timeago;

final Firestore firestore = Firestore.instance;

CollectionReference get messages => firestore.collection('data');

class MessageList extends StatefulWidget {
  
  MessageList({Key key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('date', descending: false).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        final int messageCount = snapshot.data.documents.length;
        return ListView.builder(
          itemCount: messageCount,
          itemBuilder: (_, int index) {
            final DocumentSnapshot document =
                snapshot.data.documents[messageCount - index - 1];
//            DateTime dateAndTime =
//                DateTime.parse(document['date'].toDate().toIso8601String());
            return ListTile(
              title: Text(
                document['message'] ?? '<No message retrieved>',
                style: Theme.of(context).textTheme.title,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              subtitle: Text(
                timeago.format(document['date'].toDate()),
                style: subtitleTheme,
                textAlign: TextAlign.right,
              ),
              onTap: () => messageOnTap(document, context),
            );
          },
        );
      },
    );
  }

  Future<void> messageOnTap(document, context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        'Message Copied to Clipboard',
        style: TextStyle(color: Ui.snackBarColor),
      ),
      duration: Duration(milliseconds: 100),
      backgroundColor: Colors.white,
    ));
    Clipboard.setData(new ClipboardData(text: document['message']));
  }
}

Future addMessage(String message) async {
  await messages.add(<String, dynamic>{
    'message': message,
//    'date': FieldValue.serverTimestamp(),
    'date': DateTime.now(),
  });
}

Future<void> handlePaste() async {
  ClipboardData data = await Clipboard.getData('text/plain');
  addMessage(data.text);
}
