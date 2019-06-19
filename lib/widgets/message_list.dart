import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../theme_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  callSetState() {
    _MessageListState()._getNewMessages();
  }

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _messages = [];
  bool _loadingMessages = true;
  int _perPage = 20;
  DocumentSnapshot _lastDocument;
  ScrollController _scrollController = ScrollController();
  int counter = 0;
  bool _moreMsgsAvailable = true;
  bool _gettingMessages = false;
  int val;

  _getNewMessages() async {
    // This Function is called, i.e the latest message is fetched but the rebuild of Widget is not Made
    QuerySnapshot newQuerySnapshot = await _firestore
        .collection('data')
        .orderBy('date', descending: true)
        .limit(1)
        .getDocuments();
    _messages.addAll(newQuerySnapshot.documents);
    // print(_messages[_messages.length-1].data['message']);
  }

  _getMessages() async {
    Query q = _firestore
        .collection('data')
        .orderBy('date', descending: true)
        .limit(_perPage);
    setState(() {
      _loadingMessages = true;
    });
    QuerySnapshot querySnapshot = await q.getDocuments();
    _messages = querySnapshot.documents;
    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    setState(() {
      _loadingMessages = false;
    });
  }

  _getMoreMessages() async {
    print('-');
    if (_moreMsgsAvailable == false) {
      //Scroll Reached the end of the list
      print('End reached');
      return;
    }

    if (_gettingMessages == true) {
      //In the Process of Fetching
      print('In process');
      return;
    }
    _gettingMessages = true;
    Query q = _firestore
        .collection('data')
        .orderBy('date', descending: true)
        .startAfterDocument(_lastDocument)
        .limit(_perPage);
    counter += 1;
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Yea $counter');
    QuerySnapshot querySnapshot = await q.getDocuments();
    if (querySnapshot.documents.length == 0) {
      _moreMsgsAvailable = false;
    }
    if (_moreMsgsAvailable == false) {
      //Scroll Reached the end of the list
      print('End reached');
      return;
    }
    _lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    _messages.addAll(querySnapshot.documents);
    setState(() {
      _loadingMessages = false;
    });
    _gettingMessages = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMessages();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;
      // print('$maxScroll $currentScroll $delta');
      if (maxScroll - currentScroll <= delta) {
        _getMoreMessages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _loadingMessages == true
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            controller: _scrollController,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(width: 0.1))),
                child: ListTile(
                  title: Text(_messages[index].data['message'] ??
                      "You've come to a void, Start inhabiting !! "),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  subtitle: Text(
                    timeago.format(_messages[index].data['date'].toDate()),
                    style: subtitleTheme,
                    textAlign: TextAlign.right,
                  ),
                  onTap: () =>
                      messageOnTap(_messages[index].data['message'], context),
                ),
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
      duration: Duration(milliseconds: 100),
      backgroundColor: Colors.white,
    ));
    Clipboard.setData(new ClipboardData(text: messageOnTap));
  }
}

// return StreamBuilder<QuerySnapshot>(
//       stream: messages.orderBy('date', descending: false).snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();
//         final int messageCount = snapshot.data.documents.length;
//         return ListView.builder(
//           itemCount: messageCount,
//           itemBuilder: (_, int index) {
//             final DocumentSnapshot document =
//                 snapshot.data.documents[messageCount - index - 1];
// //            DateTime dateAndTime =
// //                DateTime.parse(document['date'].toDate().toIso8601String());
//             return ListTile(
//               title: Text(
//                 document['message'] ?? '<No message retrieved>',
//                 style: Theme.of(context).textTheme.title,
//               ),
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//               subtitle: Text(
//                 timeago.format(document['date'].toDate()),
//                 style: subtitleTheme,
//                 textAlign: TextAlign.right,
//               ),
//               onTap: () => messageOnTap(document, context),
//             );
//           },
//         );
//       },
//     );
