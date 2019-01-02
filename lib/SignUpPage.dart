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
    *Create text field for name-
    *Push user info into DB-

 */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:csi380/entryscreen.dart';
import 'package:flutter/material.dart';

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
                  onPressed:MoveToEntryPage
                )
              )
            )
          ],
        )

    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title:Text ('Create Your Account')),
      body: new Form(
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
                onSaved: (input) => _email = input,
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
                onSaved: (input) => _password = input,
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
                onSaved: (input) => fname = input,
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
                onSaved: (input) => lname = input,
              ),

              RaisedButton(
                onPressed:signUp,
                child: Text('Submit'),
              ),
            ],
          )
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
