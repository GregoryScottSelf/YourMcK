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
import 'package:csi380/CreateAPost.dart';
import'package:csi380/JoinAGroup.dart';
class Groups extends StatefulWidget {
  @override
  _Groups createState() => _Groups ();
}
DocumentSnapshot Testifwork;
class _Groups extends State<Groups> {
  FirebaseUser user;
 Future<Null> fun() async{
    user = await FirebaseAuth.instance.currentUser();
    return user;
  }

/*
  //irebaseUser user =  FirebaseAuth.getCurrentUser;
  FirebaseUser user;
  void SendItBrother() async {
    //Firestore.instance.collection('RequestGroup').document().setData({'GrpName':this._name,'Description':this._description,'Username':user.uid});
    //acquired user names email
    //now performing logic for admin
    Firestore.instance.collection("Group").where("Member",arrayContains: user.email).snapshots();
    SnapshotMetadata snap;
    print(user.email);




    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
//get user email and send to fb
  void getinfo()async{


    user = await FirebaseAuth.instance.currentUser();

    // print(user);
    //user2=user;

    SendItBrother();

  }
  */
  @override

  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: new AppBar(backgroundColor: Colors.deepPurple,title:Text ('Groups'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.group_add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => JoinAGroup(), fullscreenDialog: true));
            },
          ),
        ],


        ),
        body: new StreamBuilder(

          //pull Members array from FB, display groups to this specific user
          stream: Firestore.instance.collection("Group").where("Member",arrayContains: u.email).snapshots(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return new Text("Rendering...");


            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  Testifwork=snapshot.data.documents[index];
                  return buildResultCard(Testifwork,context);
                }

            );

          },
        )

    );

  }


}

Widget buildResultCard(ds,context) {

  FirebaseUser user2;
 var stuff;


FirebaseUser user;

  void ConfirmAdmin() async {
    //Firestore.instance.collection('RequestGroup').document().setData({'GrpName':this._name,'Description':this._description,'Username':user.uid});
    //acquired user names email
    //now performing logic for admin

var s;

   Firestore.instance.collection("Group").where("Admin",arrayContains: user.email).snapshots();
   // print(user.email);
   // print(ds["Admin"][0]);

    /*for(int i=0;i<ds["Admin"];i++)
      {
        print(ds["Admin"][i]);
      }
      */
    s=ds["Admin"];
    //TODO FIX LENGTH
    for(int i=0;i<ds["Admin"][i].length;i++)
      {
        print(ds["Admin"][i]);
        if(ds["Admin"][i]==user.email)
          {
            print("hello");
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAPost(), fullscreenDialog: true));

          }
      }

    if(user.email==ds["Admin"])
      {
        print(ds["Admin"]);
        print(ds["Admin"]);
        print("hello");
      }
 //print(stuff.toString());



    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
//get user email and send to fb
  void getinfo()async{


    user = await FirebaseAuth.instance.currentUser();
    //print(user.email);
   // print(user);
    //user2=user;
    stuff=user.email;
   // print(stuff.toString());

    ConfirmAdmin();

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
                              child: const Text('View Members'),
                              //show users
                              onPressed:(){ShowUsers(ds, context);},
),
                            FlatButton(
                              child: const Text('Create A Post'),
                              onPressed:(){getinfo();},
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
Widget ShowUsers(ds,context){
FirebaseUser user;
Future<Null> fun() async{
  user = await FirebaseAuth.instance.currentUser();
  return user;
}

  //TODO FIX SCROLL
  Future<Null> Show()async{
    await showDialog(
        context:context,
        child:new SimpleDialog(
          title: new Text(

             ds["Member"].toString()//+ds["Member"][1]

          ),
          children: <Widget>[
            new SimpleDialogOption(

                child:Center(child: new RaisedButton(
                    child:new Text(
                      "Ok",
                      textAlign: TextAlign.center,
                    ),
                    onPressed:(){  Navigator.of(context).pop();
                    }
                )
                )
            )
          ],
        )

    );


  }
 Show();
}