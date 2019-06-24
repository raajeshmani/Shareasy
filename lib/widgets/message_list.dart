import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../theme_data.dart';
import '../tools/space_data.dart';

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String coordinates = SpaceData.coordinates;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('data')
          .document(SpaceData.coordinates)
          .collection('planets')
          .orderBy('date', descending: true)
          .limit(10)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        final int messageCount = snapshot.data.documents.length;
        return ListView.builder(
          // controller: _scrollController,
          itemCount: messageCount,
          physics: BouncingScrollPhysics(),
          reverse: true,
          itemBuilder: (context, int index) {
            final DocumentSnapshot document = snapshot.data.documents[index];
            return ListTile(
              title: Text(
                document['message'] ?? '<No message retrieved>',
                style: Theme.of(context).textTheme.title,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              onTap: () => messageOnTap(document, context),
            );
          },
        );
      },
    );
  }

  Future<void> messageOnTap(messageOnTap, context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        'Message Copied to Clipboard',
        style: TextStyle(color: Ui.snackBarColor),
      ),
      duration: Duration(milliseconds: 620),
      backgroundColor: Ui.darkBacgroundColor,
    ));
    Clipboard.setData(ClipboardData(text: messageOnTap['message']));
  }
}
