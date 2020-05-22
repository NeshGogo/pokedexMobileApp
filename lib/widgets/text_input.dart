import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget {
  final String hitText;
  final TextInputType inputType;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  int maxlines;

  TextInput({
    Key key,
    @required this.hitText,
    @required this.inputType,
    @required this.controller,
    @required this.onEditingComplete,
    this.maxlines = 1
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left:20, right:20),
      child: TextField(
        onEditingComplete:onEditingComplete ,
        controller: this.controller,
        keyboardType: inputType,
        maxLines: maxlines,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey
        ),
        decoration: InputDecoration(
          hintText: hitText,
          fillColor: Colors.white,
          border: InputBorder.none,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white,),
            borderRadius: BorderRadius.all(Radius.circular(9))
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlue),
            borderRadius: BorderRadius.all(Radius.circular(9))
          )
        ),
      ),
    );
  }
  
}