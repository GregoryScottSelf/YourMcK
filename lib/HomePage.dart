/*
  TODO
   *Hamburger menu top appbar-done
   *Icons bottom appbar-done
   *Logout button working-done
   *Logout button moved to correct location-done
   *Navigation for bottom app bar-
   *Display account info in hamburger menu


 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:csi380/entryscreen.dart';
import'package:csi380/Groups.dart';
import'package:csi380/SettingsPage.dart';
import 'package:csi380/Calendar.dart';



abstract class BaseAuth {

  Future<void> signOut(){
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.signOut();
  }

}


class HomePage extends StatefulWidget  {

  @override
  _HomePage createState()=> _HomePage();

  }

class _HomePage extends State<HomePage> {
/*
  _HomePage({this.auth, this.onSignOut});

  final BaseAuth auth;
  final VoidCallback onSignOut;

*/
/*
  void _signOut() async {
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e);
    }
  }
*/
/*
  TODO:
  *make hamburger menu on top appbar and icons on bottom appbar-
  *make both bottom and top appbar on every page-


 */

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.deepPurple,iconTheme: new IconThemeData(color: Colors.yellow),),

      drawer: new Drawer(

          child: new ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("AccoutName"),
                  accountEmail: Text("AccountEmail"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Colors.white,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                new ListTile(
                    title: new Text("Groups"),
                    trailing:new Icon(Icons.group),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Groups()));
                    }
                ),
                new Divider(),
                new ListTile(
                    title: new Text("Settings"),

                    trailing: new Icon(Icons.settings),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Settings()));
                    }

                ),
                new Divider(),
                new ListTile(
                    title: new Text("Logout"),
                    trailing: new Icon(Icons.power_settings_new),
                    onTap: () {

                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EntryPage()));
                      }).catchError((e) {
                        //modal for logout error
                        Future<Null> LogOutError()async{
                          await showDialog(
                              context:context,
                              child:new SimpleDialog(
                                title: new Text(e.message),
                                children: <Widget>[
                                  new SimpleDialogOption(

                                      child:Center(child: new RaisedButton(
                                          child:new Text(
                                            "Ok",
                                            textAlign: TextAlign.center,
                                          ),
                                          onPressed:(){Navigator.of(context).pop();}
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
                ),
                new Divider(),
                new ListTile(
                    title: new Text("Cancel"),
                    trailing: new Icon(Icons.cancel),
                    onTap: () {
                      Navigator.of(context).pop();

                    }

                )


              ]
          ),
        ),

       bottomNavigationBar: BottomAppBar(

         shape: CircularNotchedRectangle(),
         notchMargin: 4.0,
         child: new Row(

           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             IconButton(
               icon: Icon(Icons.calendar_today),
               onPressed: () {Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context) => MyApp()));},
             ),
             IconButton(
               icon: Icon(Icons.search),
               onPressed: () {},
             ),
             IconButton(
               icon: Icon(Icons.person_outline),
               onPressed: () {},
             ),
             IconButton(
               icon: Icon(Icons.notifications_active),
               onPressed: () {},
             )
           ],
         ),
       ),


    );
  }
}


