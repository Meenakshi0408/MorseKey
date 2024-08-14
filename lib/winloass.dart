import 'package:flutter/material.dart';
import 'package:hack/Home.dart';
import 'package:hack/pks.dart';

class WinLoss extends StatefulWidget {
  const WinLoss({super.key, required this.hey});
  final String hey;

  @override
  State<WinLoss> createState() => _WinLossState();
}

class _WinLossState extends State<WinLoss> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splash(context);
  }

  @override
  Widget build(BuildContext context) {
    bool selected=false;
    return Scaffold(
        body: Center(
      child: AnimatedContainer(
        width:selected?200:100,
        height: selected?100:200,
        color: selected ? Color.fromARGB(255, 192, 127, 127) : Colors.white,
        duration: const Duration( seconds: 2),

      )));
  }

  Future<void> splash(context) async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Home(
        
      );
    }));
  }
}
