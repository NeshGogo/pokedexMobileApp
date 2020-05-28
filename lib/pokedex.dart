import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/screens/pokemon_details_screen.dart';
import 'package:pokedex_mobile_app/User/bloc/bloc_user.dart';
import 'package:pokedex_mobile_app/User/model/user.dart';
import 'Pokemon/Bloc/bloc_pokemon.dart';
import 'Pokemon/ui/screens/home.dart';

class Pokedex extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final BlocUser _blocUser = BlocProvider.of<BlocUser>(context);
    
    return  BlocProvider(
      bloc: BlocPokemon(),
      child: Scaffold(
        endDrawer: Drawer(  
          child:ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              FutureBuilder(
                future: _blocUser.currentUser,
                builder: (context, AsyncSnapshot<User> snapshot){
                  if(!snapshot.hasData || snapshot.hasError) return Container();
                  
                  return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(                  
                      color: Colors.red,                  
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(300, 450)
                      )
                    ),
                    accountName: Text(
                      snapshot.data.name,
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    accountEmail: Text(
                      snapshot.data.email,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    currentAccountPicture: CircleAvatar( 
                      backgroundColor: Colors.blueGrey,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data.photoUrl)                            
                          )
                        ),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile', 
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16
                  ),
                ),
              ),
              ListTile(
                onTap: () => _blocUser.signOutWithGoogle(),
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Sign Out', 
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16
                  ),
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