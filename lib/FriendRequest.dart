import'package:flutter/material.dart';
import'package:csi380/FirstContext.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:csi380/entryscreen.dart';
DocumentSnapshot ns;
class FriendRequest extends StatefulWidget {
  @override
  _FriendRequest createState() => _FriendRequest ();

}
class _FriendRequest extends State<FriendRequest> {

  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.deepPurple,title:Text ('Friend Requests')),
        body: new StreamBuilder(

          //pull Members array from FB, display groups to this specific user
          stream: Firestore.instance.collection("FriendRequest").where("Email",isEqualTo: us.email).snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return new Text("Rendering...");


            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  ns=snapshot.data.documents[index];
                  return buildResultCard(ns,context);
                }

            );

          },
        )

    );
  }

}
Widget buildResultCard(ds,context) {

  void AddFriend() async{
    Firestore.instance.collection('Friend').document().setData({"List": ds['RQN'],"Email":us.email,"RQE":ds["RQE"]});

  }
  return Center(
      child: Card(

          child: Container(
              child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Text(ds['RQE'],
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
                              child: const Text('Decline'),
                              //show users
                              onPressed:(){},//ShowUsers(ds, context);},
                            ),
                            FlatButton(
                              child: const Text('Add Friend'),
                              onPressed:(){AddFriend();},
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