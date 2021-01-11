import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<BoxShadow> ShadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];

class Item {
  const Item(this.name);
  final String name;
}
