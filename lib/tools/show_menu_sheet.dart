import 'package:flutter/material.dart';
import '../theme_data.dart';

void showMenuSheet(context) {
  showModalBottomSheet<void>(
      context: context,
      shape: Ui.borderDefined,
      builder: (BuildContext context) {
        return new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          new ListTile(
            leading: new Icon(Icons.menu),
            title: new Text('Menu'),
            onTap: () => {},          
          ),
          Divider(),
          new ListTile(
            leading: new Icon(Icons.photo_album),
            title: new Text('Chumma'),
            onTap: () => {},          
          ),
          new ListTile(
            leading: new Icon(Icons.videocam),
            title: new Text('Lululai Ku'),
            onTap: () => {},          
          ),
        ],
      );
      });
}
