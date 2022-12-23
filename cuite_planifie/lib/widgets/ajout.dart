import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cuite_planifie/sqlite.dart';

class Ajout extends StatefulWidget {
  @override
  _AjoutState createState() => _AjoutState();
}

class _AjoutState extends State<Ajout> {
  final titreController = TextEditingController();
  final dateController = TextEditingController();
  final litfsController = TextEditingController();
  final participantsController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Container(
            child: Column(
                children: <Widget>[
                  Row(
                  children: [
                    Text('Titre', style: TextStyle(
                        color: Colors.cyan,
                        fontSize: MediaQuery.of(context).size.height * 1/40,
                        fontFamily: "Nunito"
                    ),),
                    Expanded(
                      child: TextField(
                        controller: titreController,cursorColor: Colors.cyan,
                        cursorHeight: 30,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                        style: TextStyle(
                            color: Colors.cyan,
                            fontFamily: "Nunito"
                        ),
                      ),
                    ),
                  ],
                ),
                  Row(
                    children: [
                      Text('Date', style: TextStyle(
                          color: Colors.cyan,
                          fontSize: MediaQuery.of(context).size.height * 1/40,
                          fontFamily: "Nunito"
                      ),),
                      Expanded(
                        child: TextField(
                          controller: dateController,cursorColor: Colors.cyan,
                          //editing controller of this TextField
                           decoration: InputDecoration(
                             icon: Icon(Icons.calendar_today), //icon of text field
                              labelText: "Entrer la date du party" //label text of field
                               ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                            if (pickedDate != null) {
                            print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.00
                            setState(() {
                            dateController.text =
                                pickedDate.toString(); //set output date to TextField value.
                            });
                        } else {}}
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Lifts", style: TextStyle(
                          color: Colors.cyan,
                          fontSize: MediaQuery.of(context).size.height * 1/40,
                          fontFamily: "Nunito"
                      ),),
                      Expanded(
                        child: TextField(
                          controller: litfsController,cursorColor: Colors.cyan,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.cyan,
                              fontFamily: "Nunito"
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Participants", style: TextStyle(
                          color: Colors.cyan,
                          fontSize: MediaQuery.of(context).size.height * 1/40,
                          fontFamily: "Nunito"
                      ),),
                      Expanded(
                        child: TextField(
                          controller: participantsController,cursorColor: Colors.cyan,
                          cursorHeight: 30,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.cyan,
                              fontFamily: "Nunito"
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  TextButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width * (1/3) , 80)),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed))
                              return Colors.cyan;
                            return null;
                          }
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(color: Colors.cyan, width: 2)
                          )
                      ),
                    ),
                    onPressed: () async {
                      await Sqlite.createParty(titreController.text, litfsController.text, participantsController.text, dateController.text);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Crée un nouveau party',
                      style: TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.cyan,
                          fontSize: MediaQuery.of(context).size.height * 1/40
                      ),
                    ),
                  ),
                  Spacer(),
                ]
            )
        ),
    );
  }
}
