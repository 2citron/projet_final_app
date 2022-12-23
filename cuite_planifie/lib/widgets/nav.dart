import 'package:flutter/material.dart';
import 'package:cuite_planifie/ajout_party.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Nav - GROUP
    return Container(
        color: Colors.cyan,
      child: Row(
        children: <Widget>[
          Spacer(),
          Text('Cuite planifiée', style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 1/40,
              fontFamily: "Nunito"
          ),),
          Spacer(),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.height * 1/10, MediaQuery.of(context).size.height * 1/10)),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.white;
                    return null;
                  }
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Colors.white, width: 2)
                  )
              ),
            ),
              onPressed:() {Navigator.push(context, MaterialPageRoute(builder: (context) => AjoutParty()));},
              child: Text('+', style: TextStyle(color: Colors.white,fontFamily: "Nunito",fontSize: MediaQuery.of(context).size.height * 1/15)),
          )
        ],
      ),
    );
  }
}
        