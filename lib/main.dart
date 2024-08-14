import 'package:flutter/material.dart';
import 'package:hack/Home.dart';
import 'package:hack/initial.dart';
import 'package:hack/morse.dart';
import 'package:hack/pks.dart';

void main() {
  runApp(const Hoi());
}

class Hoi extends StatelessWidget {
  const Hoi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: jomon(),
    );
  }
}
