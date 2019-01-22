import 'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
import'package:csi380/RequestAdmin.dart';
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
            onPressed: (){},
          ),
          ]
        )
       )
      );

  }

}