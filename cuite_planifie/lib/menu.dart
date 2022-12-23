import 'package:flutter/material.dart';
import 'widgets/party_lister.dart';
import 'widgets/nav.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Group1Widget - GROUP

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body:Container(
          child: Column(
              children: <Widget>[Nav(), Spacer(), Container(
              width: MediaQuery.of(context).size.width * 10/12,
              height: MediaQuery.of(context).size.height * 10/12,
              color: Colors.cyan,
              child:PartyLister(),),

                Spacer()
              ],
        ),
      )
    );
  }
}
