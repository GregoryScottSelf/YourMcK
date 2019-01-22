/*
  SignUpPage
  Todo:
    *Pass user info to fb-done
    *Send verification email-done
    *Navigate back to 'EntryPage'-done
    *Modal message stating email was sent-done
    *Display modal for improper formatting-done
    *Password length must be at least 6 chars-done
    *Proper formatted email-done
    *Create text field for name-done
    *Push user info into DB-done

 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csi380/entryscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:firebase_database/firebase_database.dart';
import'dart:async';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password,fname,lname;
  
//creating dialog box for email verification
  Future<Null> userinput()async{
    await showDialog(
        context:context,
        child:new SimpleDialog(
          title: new Text("Thank you signing up! Please verify your email address."),
          children: <Widget>[
            new SimpleDialogOption(


              child:Center(child: new RaisedButton(
              child:new Text(
                "Ok",
                textAlign: TextAlign.center,
                  ),
                  //TODO CHANGE PATH
                  onPressed:MoveToEntryPage
                )
              )
            )
          ],
        )

    );
  }
  //TODO Send user input to FS and then navigate to 'EntryPage'-done
  //http://tphangout.com/flutter-firestore-crud-reading-and-writing-data/
void SendItBrother() {
  Firestore.instance.collection('User').document().setData({'email':this._email,'First Name':this.fname,'Last Name':this.lname,'sk':this.fname[0]});
  //Map<String, dynamic> data() =>{
    //'email': this._email,
 // };
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title:Text ('Create Your Account')),
      body:
      new Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },

                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                //onSaved: (input) => _email = input,
                onSaved: (input){this._email=input;},

              ),
              TextFormField(
                validator: (input) {
                  if(input.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input) {this._password = input;},
                obscureText: true,
              ),
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Your Frist Name';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'First Name'
                ),
                onSaved: (input) {this.fname = input;},
              ),
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide Your Last Name';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Last Name'
                ),
                onSaved: (input){this.lname=input;},
              ),

              RaisedButton(
                onPressed:signUp,
                child: Text('Submit'),
              ),

            ],

          ),


      ),


    );
  }
//going back to 'EntryPage'
  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        //send email verification
        final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
        FirebaseUser user= await _firebaseAuth.currentUser();
        user.sendEmailVerification();
        SendItBrother();
        userinput();
        //now that the user has created an account they are sent back to the 'EntryPage'
          //userinput();
        //Navigator.of(context).pop();
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EntryPage()));

      }catch(e){
        /*
          user input errors for
           *Bad Formatting
           *Duplicate Accounts
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
                          onPressed:ErrorMoveToSignUpPage
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
  void ErrorMoveToSignUpPage(){
    //pop dialog off stack
    Navigator.of(context).pop();
  }
  void MoveToEntryPage() {
    //pop dialog off stack
    Navigator.of(context).pop();
    //pop 'SignUpPage' off stack, move to 'EntryPage'
    Navigator.of(context).pop();

  }
}
