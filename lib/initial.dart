import 'package:flutter/material.dart';
import 'package:hack/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Morse extends StatelessWidget {
  const Morse({super.key});

  // Method to save selected button value
  Future<void> _saveUserType(String userType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_type', userType);
  }

  @override
  Widget build(BuildContext context) {
    Future<void> next(String userType) async {
      await _saveUserType(userType);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: Text('Test Page')),
            body: Center(child: Text('Home Page')),
          ),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 50, right: 50),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextButton(
                  onPressed: () async {
                    await next('1');
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/images/pngegg.png'),
                          width: 84,
                          height: 84,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'Blind',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextButton(
                  onPressed: () async {
                    await next('2');
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/images/file.png'),
                          width: 84,
                          height: 84,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'Deaf',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 135, 53, 53),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: TextButton(
                  onPressed: () async {
                    await next('3');
                  },
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(
                          image: AssetImage('assets/images/normal.png'),
                          width: 84,
                          height: 84,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          'Normal',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
