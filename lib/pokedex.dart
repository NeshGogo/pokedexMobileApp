import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/screens/pokemon_details_screen.dart';
import 'Pokemon/Bloc/bloc_pokemon.dart';
import 'Pokemon/ui/screens/home.dart';

class Pokedex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  BlocProvider(
      bloc: BlocPokemon(),
      child: Scaffold(
        endDrawer: Drawer(  
          child:Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(                  
                  color: Colors.red,                  
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(300, 450)
                  )
                ),
                accountName: Text(
                  'Rafael Aguero',
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                accountEmail: Text(
                  'RafaelAguero@hotmail.com',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
                currentAccountPicture: CircleAvatar( 
                  backgroundColor: Colors.blueGrey,
                  child: Text("R.A"),
                ),
              )
            ],
          )
        ),
        body:Home(),
      )
    );
  }

}