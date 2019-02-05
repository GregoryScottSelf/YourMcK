import'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:csi380/HomePage.dart';


class CreateAGroup extends StatefulWidget
{

  @override
  _CreateAGroup createState()=> _CreateAGroup();
}
class  _CreateAGroup extends State<CreateAGroup> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _description;

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
          title: new Text("Thank you for creating a group! You will be notified after your request is review."),
          children: <Widget>[
            new SimpleDialogOption(


                child:Center(child: new RaisedButton(
                    child:new Text(
                      "Ok",
                      textAlign: TextAlign.center,
                    ),
                    //TODO CHANGE PATH
                    onPressed:(){Navigator.push(context,MaterialPageRoute(
                       builder: (BuildContext context) => new HomePage()));}
                )
                )
            )
          ],
        )

    );
  }
  void SendItBrother() async {
    Firestore.instance.collection('RequestGroup').document().setData({'GrpName':this._name,'Description':this._description,'Username':user.uid});
    //Map<String, dynamic> data() =>{
    //'email': this._email,
    // };
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Form'),

      ),
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
              RaisedButton(
                onPressed: Submit,
                child: Text('Submit'),
              ),
              RaisedButton(
                onPressed: Cancel,
                child: Text('Cancel'),
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