import 'package:flutter/material.dart';
import 'package:pokedex_mobile_app/widgets/back_red.dart';
import 'package:pokedex_mobile_app/widgets/text_input.dart';

class Home extends StatefulWidget {
  final String title;
  Home({
    Key key, 
    @required this.title,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }  
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();

    return Stack(
      children: <Widget>[
        BackRed(title: widget.title, height: 350),
        Container(
          margin: EdgeInsets.only(top:100),
          child: TextInput(
            controller: _searchController,
            hitText: 'Buscar pokemon...',
            inputType: TextInputType.text,
          ),
        ),
      ],
    );
  }
  
}