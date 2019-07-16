import'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:csi380/entryscreen.dart';
import'package:csi380/HomePage.dart';
import'package:firebase_messaging/firebase_messaging.dart';


class FirstContext extends StatefulWidget {
  @override
  _FirstContext createState() => _FirstContext ();

}

var s;
class _FirstContext extends State<FirstContext> {

  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
  }


  @override

  Widget build(BuildContext context) {
    return new Scaffold(

        body: new StreamBuilder(
          //change query?
          stream:Firestore.instance.collection("Event").where("Member",arrayContains: us.email).snapshots(),

          builder: (context,snapshot){
            if(!snapshot.hasData) {
              return new Text("Rendering...");
            }
            return new ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context,index){
                  DocumentSnapshot ds=snapshot.data.documents[index];
                  return buildResultCard(ds);
                }
            );
          },
        ),


    );

  }
//Firestore.instance.collection("Event").where("GroupName",isEqualTo:"UPE").snapshots(),


}
Widget buildResultCard(ds) {
  FirebaseUser user;
  void SendItBrotherGoing() async {
    Firestore.instance.collection('Event').document("xHgNyAwh7EKbqUav8OQw"
        ).updateData({"Going": FieldValue.arrayUnion([user.uid+" "+ds['GroupName']+" "+ds['Where']])});
    //acquired user names email
    //now performing logic for admin

    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
  void SendItBrotherSkip() async {
    Firestore.instance.collection('Event').document("xHgNyAwh7EKbqUav8OQw"
        ).updateData({"Skip": FieldValue.arrayUnion([user.uid+" "+ds['GroupName']+" "+ds['Where']])});
    //acquired user names email
    //now performing logic for admin

    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
  void SendItBrotherMaybe() async {
    Firestore.instance.collection('Event').document("xHgNyAwh7EKbqUav8OQw"
    ).updateData({"Maybe": FieldValue.arrayUnion([user.uid+" "+ds['GroupName']+" "+ds['Where']])});
    //now performing logic for admin

    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
  void getinfo()async{


    user = await FirebaseAuth.instance.currentUser();


    // print(user);
    //user2=user;

    SendItBrotherGoing();

  }
  void getinfo1()async{


    user = await FirebaseAuth.instance.currentUser();


    // print(user);
    //user2=user;

    SendItBrotherMaybe();

  }
  void getinfo2()async{


    user = await FirebaseAuth.instance.currentUser();


    // print(user);
    //user2=user;

    SendItBrotherSkip();

  }
  return Center(
      child: Card(

          child: Container(
              child:Column(
                 mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Text(ds['GroupName']+" just posted!"+"\n"+ds['EventTitle']+"\n"+ds['Where']+" @ "+ds['Time'],
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,

                      ),
                    ),
                    ButtonTheme.bar(

                        child:ButtonBar(
                            mainAxisSize: MainAxisSize.max,
                          alignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FlatButton(

                              child: const Text('Maybe'),

                              onPressed:(){getinfo1();},

                            ),
                            Icon(
                                Icons.not_listed_location,


                            ),
                            FlatButton(

                              child: const Text("Skip"),
                              onPressed:(){getinfo2();},
                            ),
                            Icon(Icons.clear),

                            FlatButton(
                              child:  Text("Going"),
                              onPressed: (){getinfo();},
                            ),
                            Icon(Icons.check_box),


                          ],
                        )
                    )
                  ]
              )
          )
      )
  );

}