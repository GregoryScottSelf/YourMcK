
import 'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
import'package:csi380/RequestAdmin.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Notifications extends StatefulWidget {
  @override
  _Notifications createState() => _Notifications ();
}
class _Notifications extends State<Notifications> {

  //irebaseUser user =  FirebaseAuth.getCurrentUser;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.deepPurple,title:new Center(child: new Text ('Notifications',textAlign: TextAlign.center))),
        body: new StreamBuilder(
            stream: Firestore.instance.collection("Event").where("GroupName",isEqualTo:"UPE").snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return new Text("Rendering...");
            return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,index){
                DocumentSnapshot ds=snapshot.data.documents[index];
                return buildResultCard(ds);
                }
            );
          },
        )
    );

  }


}

Widget buildResultCard(ds) {

  return Center(
      child: Card(

          child: Container(
              child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Text(ds['GroupName']+" just posted @ "+ds['Time'],
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,

                      ),
                    ),
                    ButtonTheme.bar(
                        child:ButtonBar(

                          children: <Widget>[
                            FlatButton(
                              child: const Text(''),
                              onPressed:(){},
                            ),

                          ],
                        )
                    )
                  ]
              )
          )
      )
  );

}