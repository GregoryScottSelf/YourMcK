import'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'dart:async';

class Friends extends StatefulWidget {
  @override
  _Friends createState() => _Friends ();

}
class _Friends extends State<Friends> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        body: new StreamBuilder(
          stream: Firestore.instance.collection("User").where("First Name").snapshots(),
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
                    Text(ds['First Name'],
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