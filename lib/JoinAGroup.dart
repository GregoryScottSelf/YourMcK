import 'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
import'package:csi380/RequestAdmin.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csi380/CreateAPost.dart';
import'package:csi380/Groups.dart';
import'package:csi380/entryscreen.dart';
class JoinAGroup extends StatefulWidget {
  @override
  _JoinAGroup createState() => _JoinAGroup ();
}

class _JoinAGroup extends State<JoinAGroup> {

  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.deepPurple),
        body: new StreamBuilder(

          //pull Members array from FB, display groups to this specific user
          stream: Firestore.instance.collection("Group").where("sk",arrayContains: "A").snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return new Text("Rendering...");


            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  DocumentSnapshot ds=snapshot.data.documents[index];
                  return buildResultCard(ds,context);
                }

            );

          },
        )

    );
    }
  }
Widget buildResultCard(ds,context) {

  void Update() async {
    if(ds['Title']=="UPE") {
      Firestore.instance.collection('Group').document(
          "CncH8Am4jmkvnyCGXFdi"
      ).updateData({"Member": FieldValue.arrayUnion([us.email])});
      Firestore.instance.collection('Group').document(
          "CncH8Am4jmkvnyCGXFdi"
      ).updateData({"NameList": FieldValue.arrayUnion([us.email])});
      //acquired user names email
      //now performing logic for admin
    }
    else if(ds['Title']=="AEC")
      {
        Firestore.instance.collection('Group').document(
            "X1Y7IfS12iBDuCR1GeXO"
        ).updateData({"Member": FieldValue.arrayUnion([us.email])});
        Firestore.instance.collection('Group').document(
            "X1Y7IfS12iBDuCR1GeXO"
        ).updateData({"NameList": FieldValue.arrayUnion([us.email])});
      }
    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
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
                              child: const Text('Join Group'),
                              //update query to group
                              //show users
                              onPressed:(){
                                Update();
                                },
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


