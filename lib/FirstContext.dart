import'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FirstContext extends StatefulWidget {
  @override
  _FirstContext createState() => _FirstContext ();

}
class _FirstContext extends State<FirstContext> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

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
        ),


    );

  }



}
Widget buildResultCard(ds) {
  FirebaseUser user;
  void SendItBrotherGoing() async {
    Firestore.instance.collection('Event').document(
        "Hz0ZQnK8Nb65a6mY6BYD").updateData({"Going": FieldValue.arrayUnion([user.uid])});
    //acquired user names email
    //now performing logic for admin

    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
  void SendItBrotherSkip() async {
    Firestore.instance.collection('Event').document(
        "Hz0ZQnK8Nb65a6mY6BYD").updateData({"Skip": FieldValue.arrayUnion([user.uid])});
    //acquired user names email
    //now performing logic for admin

    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }
  void SendItBrotherMaybe() async {
    Firestore.instance.collection('Event').document(
        "Hz0ZQnK8Nb65a6mY6BYD").updateData({"Maybe": FieldValue.arrayUnion([user.uid])});
    //acquired user names email
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