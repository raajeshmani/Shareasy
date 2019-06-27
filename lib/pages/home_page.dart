import 'package:flutter/material.dart';
import '../tools/space_data.dart';
import '../theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatelessWidget {
//  CollectionReference get data => Firestore.instance.collection('data');
  TextEditingController _coordinatesController = new TextEditingController();

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
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 100.0),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: TextField(
                                  style: TextStyle(),
                                  controller: _coordinatesController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Provide your Space Coordinates',
                                    // labelStyle: Ui.labelStyle,
                                    hintText: 'Destination Unknown . . . ',
                                    // icon: Icon(Icons.link),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                SpaceData.coordinates =
                                    _coordinatesController.text;
                                _onTravelPressed(context);
                              },
                              icon: Icon(
                                Ui.sendIcon,
                                color: Ui.purpleButtonColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton.icon(
                          onPressed: () async {
                            String scanResult =
                                await FlutterBarcodeScanner.scanBarcode(
                                    '#5BB974', Ui.cancelText, false);
                            SpaceData.coordinates = scanResult;
                            _onTravelPressed(context);
                          },
                          label: Text('Scan QR', style: Ui.buttonTextStyle),
                          icon: Icon(
                                Ui.qrIcon,
                                color: Ui.purpleButtonColor,
                              ),
                          // child: Row(
                          //   children: <Widget>[
                          //     Icon(
                          //       Ui.qrIcon,
                          //       color: Ui.purpleButtonColor,
                          //     ),
                          //     Text('Scan QR', style: Ui.buttonTextStyle,),
                          //   ],
                          // ),
                        ),
                        SizedBox(height: 60.0),
                      ],
                    ),
                    elevation: Ui.cardElevation,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 500.0),
                child: Center(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
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
                        SizedBox(
                          height: 50,
                        ),
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

  void _onTravelPressed(BuildContext context) {
    DocumentReference documentReference =
        Firestore.instance.collection('data').document(SpaceData.coordinates);
    _coordinatesController.clear();
    Navigator.pushNamed(context, '/SpacePage');
    // StreamSubscription<DocumentSnapshot> subscription =
    //     documentReference.snapshots().listen((datasnapshot) {
    //   if (datasnapshot.exists) {
    //     print('Exists');
    //     _coordinatesController.clear();
    //     Navigator.pushNamed(context, '/SpacePage');
    //   } else {
    //     print('Not');
    //     _coordinatesController.clear();
    //     documentReference.collection('planets').add(<String, dynamic>{
    //       'message': Ui.welcomeDocumentMessage,
    //       'date': DateTime.now(),
    //     });
    //     Navigator.pushNamed(context, '/SpacePage');
    //   }
    // });
  }
}
