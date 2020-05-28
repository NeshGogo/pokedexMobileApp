import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/Bloc/bloc_pokemon.dart';
import 'package:pokedex_mobile_app/User/Ui/screens/login_screen.dart';
import 'package:pokedex_mobile_app/User/bloc/bloc_user.dart';
import 'package:pokedex_mobile_app/pokedex.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {    

    return BlocProvider(
      bloc: BlocPokemon(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        home: BlocProvider(
          bloc: BlocUser(),
          child: LoginScreen(),
        )
      ),
    );
  }
}