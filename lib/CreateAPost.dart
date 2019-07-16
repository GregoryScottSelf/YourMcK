import'package:flutter/material.dart';
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:csi380/Groups.dart';

class CreateAPost extends StatefulWidget {
  @override
  _CreateAPost createState() => _CreateAPost ();

}
class _CreateAPost extends State<CreateAPost>
{


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _description,_time,_place;

  var username=FirebaseAuth.instance.currentUser().toString();
  FirebaseUser user;
  //user
//send to db
  void getUserName()async{
    //username=FirebaseAuth.instance.currentUser();
    // print(username.toString());
    // FirebaseUser user = await FirebaseAuth.instance.currentUser;
    //user = FirebaseAuth.instance.currentUser;
    user = await FirebaseAuth.instance.currentUser();
    SendItBrother();

  }
  Future<Null> userinput()async{
    await showDialog(
        context:context,
        child:new SimpleDialog(

          title: new Text("Thank you for creating a post! It can be view on the home page."),
          children: <Widget>[
            new SimpleDialogOption(


                child:Center(child: new RaisedButton(
                    child:new Text(
                      "Ok",
                      textAlign: TextAlign.center,
                    ),
                    //TODO CHANGE PATH
                    onPressed:() {
                      //Navigator.push(context,MaterialPageRoute(
                      // builder: (BuildContext context) => new HomePage()));}
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                )
                )
            )
          ],
        )

    );
  }
  void SendItBrother() async {

    Firestore.instance.collection('Event').document().setData({'GroupName':this._name,'EventTitle':this._description,'Username':user.uid,'Time':this._time,'Where':this._place,'Member':Testifwork['Member']});


    //TODO perform a DS and send to event collection based on this.name(group name)---this will need to be appended to the file
    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: new AppBar(backgroundColor: Colors.deepPurple),


      body: Form(

          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Enter Group Name';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Group Name'
                ),
                onSaved: (input){this._name =input;},
              ),
              TextFormField(
                maxLength: 50,
                validator: (input) {
                  if(input.isEmpty){
                    return 'Enter Description';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Description'
                ),
                onSaved: (input){this._description =input;},
              ),
              TextFormField(
                maxLength: 50,
                validator: (input) {
                  if(input.isEmpty){
                    return 'Enter Time';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Time'
                ),
                onSaved: (input){this._time =input;},
              ),
              TextFormField(
                maxLength: 50,
                validator: (input) {
                  if(input.isEmpty){
                    return 'Enter Where';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Location'
                ),
                onSaved: (input){this._place =input;},
              ),

              RaisedButton(
                onPressed: Submit,
                child: Text('Submit'),
              ),


            ],
          )
      ),
    );

  }
  void Cancel(){
    Navigator.of(context).pop();
  }
  void Cancell(){
    getUserName();
  }
  void Submit() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{

        getUserName();
        //SendItBrother();
        userinput();
        //now that the user has created an account they are sent back to the 'EntryPage'
        //userinput();
        //Navigator.of(context).pop();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EntryPage()));

      }catch(e){
        /*
          user input errors for
           *Bad Formatting
           *No Entry
         */

        Future<Null> errormsg()async{
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
                          onPressed:(){ Navigator.of(context).pop();}
                      )
                      )
                  )
                ],
              )

          );


        }
        errormsg();
        // print(e.message);

      }
    }
  }
}