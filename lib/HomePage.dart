/*
  TODO
   *Hamburger menu top appbar-done
   *Icons bottom appbar-done
   *Logout button working-done
   *Logout button moved to correct location-done
   *Navigation for bottom tab bar-done
   *Display account info in hamburger menu


 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:csi380/entryscreen.dart';
import'package:csi380/Groups.dart';
import'package:csi380/SettingsPage.dart';
import 'package:csi380/Calendar.dart';
import 'package:csi380/RequestAdmin.dart';
import'package:csi380/Search.dart';
import'package:csi380/Friends.dart';
import'package:csi380/Notifications.dart';
import'package:csi380/FirstContext.dart';

/*
abstract class BaseAuth {

  Future<void> signOut(){
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    return _firebaseAuth.signOut();
  }

}
*/
some() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  print(user.email);
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
      return new MaterialApp(
        home:
        DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: new AppBar(backgroundColor: Colors.blue,
                iconTheme: new IconThemeData(color: Colors.black),
                ),

            drawer: new Drawer(

              child: new ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text('Name'),
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
                        trailing: new Icon(Icons.group),
                        onTap: () {
                          //Navigator.of(context).pop();
                          // Navigator.pushReplacementNamed(context,'/Groups');
                          //Navigator.pop(context);
                          // Navigator.pushReplacement(context,   MaterialPageRoute(builder: (context) =>Groups()));
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Groups(),
                              fullscreenDialog: true));


                          //  Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => new Groups()));
                          //  Navigator.pushReplacement(context,
                          //   MaterialPageRoute(builder: (context) =>  Groups()));
                        }
                    ),
                    new Divider(),
                    new ListTile(
                        title: new Text("Settings"),

                        trailing: new Icon(Icons.settings),
                        onTap: () {
                          // Navigator.of(context).pop();
                          // Navigator.pushReplacement(context,
                          // MaterialPageRoute(builder: (context) => Settings()));
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Settings(),
                              fullscreenDialog: true));
                        }

                    ),
                    new Divider(),
                    new ListTile(
                        title: new Text("Logout"),
                        trailing: new Icon(Icons.power_settings_new),
                        onTap: () {
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
                    ),

                /*
                new Divider(),
                new ListTile(
                    title: new Text("Cancel"),
                    trailing: new Icon(Icons.cancel),
                    onTap: (){Navigator.of(context).pop();Navigator.of(context).pop();}
                    //  Navigator.of(context).popUntil(ModalRoute.withName('/HomePage'));
                    //  Navigator.pushReplacement(context,new MaterialPageRoute(
                         // builder: (BuildContext context) => new HomePage()));
                      //Navigator.pop(context);



                )
            */

                  ]
              ),
            ),
           body: new TabBarView(
              children:<Widget> [

                new FirstContext(),
                new MyApp(),
                new Search(),
                new Friends(),
                new Notifications(),
              ],
            ),



           /*
              TODO imp in app bar
            body: new FutureBuilder<FirebaseUser>(
              future: FirebaseAuth.instance.currentUser(),
              builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print(snapshot.data.email);
                  return new Text(snapshot.data.uid);

                }
                else {
                  return new Text('Loading...');
                }
              },
            ),
            */
            bottomNavigationBar: new TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.home),
                ),
                Tab(
                  icon: new Icon(Icons.calendar_today),
                ),
                Tab(
                  icon: new Icon(Icons.search),
                ),
                Tab(
                  icon: new Icon(Icons.person_outline),
                ),
                Tab(
                  icon: new Icon(Icons.notifications_active),
                )

              ],

              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.red,


              // backgroundColor: Colors.black,

            ),
            backgroundColor: Colors.deepPurple,

          ),
        ),

      );

    }

}




//OLD IMP OF BottomAppBar
/*
         shape: CircularNotchedRectangle(),
         notchMargin: 4.0,
         child: new Row(

           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             IconButton(
               icon: Icon(Icons.home),
               onPressed: () { Navigator.push(context,MaterialPageRoute(
                   builder: (BuildContext context) => new HomePage()));},
             ),
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
             ),

           ],
         ),

*/