/*
  Entry page
  Todo:
    *Login to fb-done
    *Signup to fb-done
    *Navigation between signup-signin && signin-singup-done
    *Navigate to 'HomePage'-done
    *Modal for error handling incorrect user email/pass-done



 */
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:csi380/HomePage.dart';
import'package:csi380/SignUpPage.dart';
class EntryPage extends StatefulWidget
{

  @override
  _EntryPage createState()=> _EntryPage();
}
class  _EntryPage extends State<EntryPage>
{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
        title: Text('YourMCK'),

    ),
      body: Form(
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
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign in'),
              ),
              RaisedButton(
                onPressed: signUp,
                child: Text('Sign Up'),
              ),
            ],
          )
      ),
    );

  }
  /*
    *Sends and compare input with user data on fb
    * Moves to 'HomePage'
    * User is now logged-in
   */
  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        /*
            *User will either be approved or denied access to account
            * .pushReplacement Does not allow the user to naviagate back to the 'EntryScreen' page

         */
        print(user.email);
      //TODO work on user var

        Navigator.pushReplacementNamed(context,'/HomePage');

        /*
        Navigator.of(context).push(MaterialPageRoute(
            settings:RouteSettings(name:HomePage()),
            builder: (context)=>HomePage()));
            */
      }catch(e){
        Future<Null> SingInError()async{
          await showDialog(
              context:context,
              child:new SimpleDialog(
                title: new Text('Incorrect Password or Email, please try again.'),
                children: <Widget>[
                  new SimpleDialogOption(

                      child:Center(child: new RaisedButton(
                          child:new Text(
                            "Ok",
                            textAlign: TextAlign.center,
                          ),
                          onPressed:(){  Navigator.of(context).pop();
                        }
                      )
                      )
                  )
                ],
              )

          );


        }
        SingInError();
        print(e.message);
      }
    }
  }

  //User wants to create a new acc, moving to 'SignUpPage'
  void signUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}