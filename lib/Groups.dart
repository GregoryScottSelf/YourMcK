/*
  TODO
  *Button to join a new group
  *Display all the groups the user is in-
  *Make array contains modular-


 */

import 'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
import'package:csi380/RequestAdmin.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Groups extends StatefulWidget {
  @override
  _Groups createState() => _Groups ();
}
class _Groups extends State<Groups> {

  //irebaseUser user =  FirebaseAuth.getCurrentUser;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.deepPurple,title:Text ('Groups')),
        body: new StreamBuilder(
          stream: Firestore.instance.collection("Group").where("Member",arrayContains: "Jef").snapshots(),
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
                    Text(ds['Title'],
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
                              child: const Text('Open'),
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