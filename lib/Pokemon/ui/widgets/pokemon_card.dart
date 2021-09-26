import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/Pokemon/model/pokemon.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/screens/pokemon_details_screen.dart';
import 'package:pokedex_mobile_app/Pokemon/ui/widgets/pokemon_detail_body.dart';

import 'card_description.dart';
import 'circle_card_image.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final double height;
  final Function onPressedButtom;
  final IconData iconDataButtom;
  PokemonCard({
    Key key,
    @override this.pokemon,
    @override this.height,
    @override this.onPressedButtom,
    @override this.iconDataButtom,
  });
  Widget buildCard(double widthScreen) {
    return Container(
        height: height,
        width: widthScreen - 40,
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 40),
        decoration: BoxDecoration(
          color: Color.fromRGBO(150, 60, 60, 0.9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0, 20),
              blurRadius: 15,
            )
          ],
        ),
        child: Stack(
          alignment: Alignment(0, -1),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleCardImage(
                  imagePath: pokemon.photoUrl,
                  height: height,
                  width: widthScreen / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 15),
                      width: widthScreen - 227,
                      child: Text(
                        pokemon.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CardDescription(
                      height: height - 71,
                      pokemonTypes: pokemon.types,
                      pokemonWeight: pokemon.weight,
                      pokemonHeight: pokemon.height,
                      width: widthScreen - 227,
                    )
                  ],
                )
              ],
            ),
            IconButton(
              color: Colors.white,
              splashColor: Colors.redAccent,
              iconSize: 30,
              icon: Icon(
                iconDataButtom,
              ),
              onPressed: onPressedButtom,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    // TODO: implement build
    return InkWell(
      splashColor: Colors.redAccent,
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PokemonDetailScreen(
                      pokemon: pokemon,
                    )));
      },
      child: buildCard(widthScreen),
    );
  }
}
