import 'package:flutter/material.dart';

class Item {
  String name;
  String description;
  MaterialColor color;
  IconData icon;
  Item(this.name, this.description, this.color, this.icon);
}

List<Item> items = [
  Item('Q1. ', "When is this happening?", Colors.amber, Icons.ac_unit),
  Item('A1. ', "Its happening on 14th and 15th March 2020 which is on Saturday and Sunday.", Colors.cyan, Icons.add_photo_alternate),
  Item('C', "This might be OK", Colors.indigo, Icons.airplay),
  Item('D', "Totally awesome", Colors.green, Icons.crop),
  Item('E', "Rockin out", Colors.pink, Icons.album),
  Item('F', "Take a look", Colors.blue, Icons.adb),
  Item('A', "Something cool", Colors.amber, Icons.ac_unit),
  Item('B', "Hey, why not?", Colors.cyan, Icons.add_photo_alternate),
  Item('C', "This might be OK", Colors.indigo, Icons.airplay),
  Item('D', "Totally awesome", Colors.green, Icons.crop),
  Item('E', "Rockin out", Colors.pink, Icons.album),
  Item('F', "Take a look", Colors.blue, Icons.adb),
  Item('F', "Take a look", Colors.blue, Icons.adb),
  Item('A', "Something cool", Colors.amber, Icons.ac_unit),
  Item('B', "Hey, why not?", Colors.cyan, Icons.add_photo_alternate),
  Item('C', "This might be OK", Colors.indigo, Icons.airplay),
  Item('D', "Totally awesome", Colors.green, Icons.crop),
  Item('E', "Rockin out", Colors.pink, Icons.album),
  Item('F', "Take a look", Colors.blue, Icons.adb),
  Item('A', "Something cool", Colors.amber, Icons.ac_unit),
  Item('B', "Hey, why not?", Colors.cyan, Icons.add_photo_alternate),
  Item('C', "This might be OK", Colors.indigo, Icons.airplay),
  Item('D', "Totally awesome", Colors.green, Icons.crop),
  Item('E', "Rockin out", Colors.pink, Icons.album),
  Item('F', "Take a look", Colors.blue, Icons.adb),
  Item('F', "Take a look", Colors.blue, Icons.adb)
];
