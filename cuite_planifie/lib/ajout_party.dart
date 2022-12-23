import 'package:flutter/material.dart';
import 'widgets/ajout.dart';
import 'widgets/nav_new.dart';

class AjoutParty extends StatefulWidget {
  @override
  _AjoutPartyState createState() => _AjoutPartyState();
}

class _AjoutPartyState extends State<AjoutParty> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: NavNew()),
      body: Center(
        child: Container(
          child: Ajout(),
        ),
      ),
    );
  }
}