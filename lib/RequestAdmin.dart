import 'package:flutter/material.dart';
import'package:csi380/HomePage.dart';
class RequestAdmin extends StatefulWidget {
  @override
  _RequestAdmin createState() => _RequestAdmin ();
}
class _RequestAdmin extends State<RequestAdmin>
{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: Colors.deepPurple,title:Text ("")),
        body:new Center(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            new RaisedButton(

              splashColor: Colors.yellow,
              color: Colors.deepPurple,
              child: new Text("Create A New Group",style: new TextStyle(fontSize: 20.0,color: Colors.black),),
              onPressed: (){
              //Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(
              builder: (BuildContext context) => new HomePage()));},
    ),

            new RaisedButton(

              splashColor: Colors.yellow,
              color: Colors.deepPurple,
              child: new Text("Chose An Existing Group",style: new TextStyle(fontSize: 20.0,color: Colors.black),),
              onPressed: (){
              //Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(
              builder: (BuildContext context) => new HomePage()));},
      ),


           ],
          ),
        ),
    );
  }

}