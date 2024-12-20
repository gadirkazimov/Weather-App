import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kPropertyTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold
);

var kTextFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: 'Search for city weather',
    hintStyle: TextStyle(color: Colors.grey[500], fontSize: 18),
    icon: Icon(Icons.location_city, color: Colors.white, size: 35,),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
    )
);
