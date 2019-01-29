import 'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
import'package:csi380/RequestAdmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csi380/entryscreen.dart';
class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings ();
}
class _Settings extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.deepPurple,title:Text ('User Settings')),
      body:new Center(
          child: new Column(
            //center button
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          new RaisedButton(

          splashColor: Colors.yellow,
            color: Colors.deepPurple,
            child: new Text("Request Admin Access to a Group",style: new TextStyle(fontSize: 20.0,color: Colors.black),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RequestAdmin(), fullscreenDialog: true));
            }
            //Navigator.pushReplacement(context,MaterialPageRoute(
            //    builder: (BuildContext context) => RequestAdmin()));},
          ),
          new RaisedButton(

            splashColor: Colors.yellow,
            color: Colors.deepPurple,
            child: new Text("Manage Notifications",style: new TextStyle(fontSize: 20.0,color: Colors.black),),
            onPressed: (){},
          ),
          new RaisedButton(

            splashColor: Colors.yellow,
            color: Colors.deepPurple,
            child: new Text("Delete Account",style: new TextStyle(fontSize: 20.0,color: Colors.black),),
            onPressed: (){
              Future<Null> DelUser()async{
                await showDialog(
                    context:context,
                    child:new SimpleDialog(
                      title: new Text("Are you sure you want to delete your account?"),
                      children: <Widget>[
                        new SimpleDialogOption(
                            child:Center(child: new RaisedButton(
                                child:new Text(
                                  "No",
                                  textAlign: TextAlign.center,
                                ),
                                //TODO CHANGE PATH
                                onPressed:(){ Navigator.of(context).pop();}
                            )
                            )
                        ),
                        new SimpleDialogOption(

                        child:Center(child: new RaisedButton(
                           child:new Text(
                            "Yes",
                             textAlign: TextAlign.center,
                         ),
                /*TODO
                    Modal confirm acc deleted
                    Log out user

                 */
                onPressed:(){
                  remove()async{
                    FirebaseUser user =await FirebaseAuth.instance.currentUser();
                    user.delete();
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context) => EntryPage()));

                    }).catchError((e) {
                      //modal for logout error
                      Future<Null> LogOutError() async {
                        await showDialog(
                            context: context,
                            child: new SimpleDialog(
                              title: new Text(e.message),
                              children: <Widget>[
                                new SimpleDialogOption(

                                    child: Center(child: new RaisedButton(
                                        child: new Text(
                                          "Ok",
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }
                                    )
                                    )
                                )
                              ],
                            )

                        );
                      }
                      LogOutError();
                      print(e);
                    });

                  }
                  remove();

                }
                )

                        )
                        )
                      ],
                    )

                );
              }
              DelUser();
            },
          ),
          ]
        )
       )
      );

  }

}