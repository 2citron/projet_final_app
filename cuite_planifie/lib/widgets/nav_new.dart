import 'package:flutter/material.dart';

class NavNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator NavNew - FRAME
    return Row(
      children: <Widget>[

        Spacer(),
        Text('Nouvelle cuite planifiée', style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 1/40,
            fontFamily: "Nunito"
        ),),
        Spacer(),

      ],
    );
  }
}
