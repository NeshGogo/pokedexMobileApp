import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/User/bloc/bloc_user.dart';
import 'package:pokedex_mobile_app/pokedex.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';

class LoginScreen extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreen();
  }
  
}

class _LoginScreen extends State<LoginScreen>{
  BlocUser _blocUser; 

  @override
  Widget build(BuildContext context) {
    _blocUser = BlocProvider.of<BlocUser>(context);

    return _handlerLogin();
  }

  Widget _handlerLogin(){
    return StreamBuilder(
      stream: _blocUser.authState,
      builder: (context, AsyncSnapshot snapshot){
        if(snapshot.hasError || !snapshot.hasData) return _loginUi();
        
        return Pokedex();
      },
    );
  }

  Widget _loginUi (){
    return Scaffold(
      body:Stack(
        children: <Widget>[
          BackRed(),
          Container(
            margin: EdgeInsets.only(top:50),
            alignment: Alignment.topCenter,
            child: Text(
              'Pokedex', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 60,
                fontFamily: 'FredokaOne',
                decoration: TextDecoration.underline
              ),
            ),
          ),
          Container(    
            margin: EdgeInsets.only(left:30, right:30),      
            alignment: Alignment.center,
            child: Text(
              'Select your login option', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'FredokaOne'
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(          
            margin: EdgeInsets.only(top:200),
            alignment: Alignment.center,
            child: RaisedButton(
              padding: EdgeInsets.all(0),
              onPressed: ()=>_blocUser.signInWithGoogle(),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:Container(     
                padding: EdgeInsets.all(10),         
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,                    
                      Colors.greenAccent,
                      Colors.green, 
                    ],
                  )
                ),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20
                  ),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}