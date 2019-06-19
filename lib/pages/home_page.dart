import 'package:flutter/material.dart';
import './space_page.dart';
import '../theme_data.dart';

class HomePage extends StatelessWidget {
//  CollectionReference get data => Firestore.instance.collection('data');
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: Ui.gradientColors),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.lerp(
                            Radius.circular(10.0), Radius.circular(12.0), 30.0),
                        bottomRight: Radius.lerp(Radius.circular(10.0),
                            Radius.circular(12.0), 30.0))),
              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height * 0.13,
//                left: MediaQuery.of(context).size.width * 0.35,
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0,top: 100.0),
              // Container(
              //   alignment: Alignment(-0.2,0.0),
              //   margin: EdgeInsets.all(32.0),
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        ListTile(
                          title: Text(
                            Ui.title,
                            style: Ui.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                            Ui.welcomeMessage,
                            style: Ui.welcomeMessageStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 50.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 270,
                              child: TextField(
                                style: TextStyle(),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'Your Space ',
                                  hintText: 'Destination Unknown . . . ',
                                  icon: Icon(Icons.link),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/SpacePage'),
                              icon: Icon(Ui.sendIcon),
                            ),
                          ],
                        ),
                        SizedBox(height: 100.0),
                      ],
                    ),
                    elevation: Ui.cardElevation,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0,top: 500.0),
                child: Center(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50,),
                        ListTile(
                          title: Text(
                            'Hash',
                            style: Ui.titleStyle,
                            textAlign: TextAlign.center,
                          ),
                          subtitle: Text(
                                'This Feature is under Development',
                                style: Ui.welcomeMessageStyle,
                                textAlign: TextAlign.center,
                              ),
                        ),
                        SizedBox(height: 50,),
                      ],
                    ),
                    elevation: Ui.cardElevation,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
