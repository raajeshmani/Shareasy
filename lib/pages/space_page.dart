import 'package:flutter/material.dart';
import '../widgets/message_list.dart';
import '../widgets/text_box.dart';
import '../theme_data.dart';

class SpacePage extends StatefulWidget {
  @override
  _SpacePageState createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore',style: Ui.titleStyle,),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Ui.appBarBackgroundColor,
      ),
      body: _spacePageBody(),
    );
  }
}

class _spacePageBody extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              child: MessageList(),
            ),
          ),
          TextBoxWidget(),
        ],
      ),
    );
  }

}