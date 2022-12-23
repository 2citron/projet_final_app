import 'package:flutter/material.dart';
import 'package:cuite_planifie/sqlite.dart';
import 'package:intl/intl.dart';
import 'package:cuite_planifie/models/party.dart';
import 'package:cuite_planifie/replanifie.dart';


class PartyLister extends StatefulWidget {
  @override
  _PartyListerState createState() => _PartyListerState();
}

class _PartyListerState extends State<PartyLister> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
              width: constraints.maxWidth / 2,
              child: Container(
                  child: FutureBuilder<List<Party>>(
                    future: Sqlite.getPartys(),
                    builder: (BuildContext context, AsyncSnapshot<List<Party>> snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            primary: true,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: MediaQuery.of(context).size.width * 3/4,
                                height: MediaQuery.of(context).size.height * 1/6,
                                color: Colors.cyan,
                                  child:
                                  GestureDetector(
                                      onTap: (){
                                        print(snapshot.data?[index].id.toString());
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              children: <Widget>[ Row(
                                                children: [
                                                  Text('${snapshot.data?[index].titre}', style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: MediaQuery.of(context).size.height * 1/40,
                                                      fontFamily: "Nunito"
                                                  ),),
                                                  Spacer(),
                                                  Text( DateFormat.yMMMd().format(snapshot.data![index].date), style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: MediaQuery.of(context).size.height * 1/40,
                                                      fontFamily: "Nunito"
                                                  ),)
                                                ],
                                              ),
                                                Row(
                                                  children: [
                                                    Text("Lifts", style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(context).size.height * 1/40,
                                                        fontFamily: "Nunito"
                                                    ),),
                                                    Spacer(),
                                                    Text('${snapshot.data?[index].lifts}', style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(context).size.height * 1/40,
                                                        fontFamily: "Nunito"
                                                    ),)
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Text("Participants", style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(context).size.height * 1/40,
                                                        fontFamily: "Nunito"
                                                    ),),
                                                    Spacer(),
                                                    Text('${snapshot.data?[index].participants}', style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(context).size.height * 1/40,
                                                        fontFamily: "Nunito"
                                                    ),)
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        print(snapshot.data?[index].toString());
                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Replanifie(party: snapshot.data?[index])));
                                                      },
                                                      child: Icon(
                                                        Icons.border_color,
                                                        color: Colors.white,
                                                        size: 15.0,
                                                      ),
                                                    ),
                                                    Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        print(snapshot.data?[index].id.toString());
                                                        Sqlite.deleteParty(int.parse('${snapshot.data?[index].id}'));
                                                        setState(() {});},
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.white,
                                                        size: 15.0,
                                                      ),
                                                    ),
                                                  ],
                                                )

                                              ]
                                          )
                                      )
                                  )
                              );
                            });
                      }
                      else{
                        return Center(
                            child:Text(
                              'Pas de party :(',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height * 1/40,
                                  fontFamily: "Nunito"
                              ),
                            )
                        );
                      }
                    },
                  )
              ));
        });
  }
}
