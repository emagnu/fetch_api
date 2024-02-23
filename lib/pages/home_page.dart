//   ///
//  Import LIBRARIES ILES
import 'package:flutter/material.dart';
//  Import FILES
//  PARTS
//  PROVIDERS
//  //  //   ///

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  TOP PAGE TEXT
            const Text('This is the Main Page.',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10.0),
            const Text('Please, press a button.',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
            const SizedBox(height: 30.0),

            //  GOTO LIVE GAME BUTTON
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white70),
                onPressed: () {
                  Navigator.pushNamed(context, '/live_game');
                },
                child: const Text(
                  'Goto Live Game',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
            const SizedBox(height: 10.0),

            //   BUTTON
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white70),
                onPressed: () {},
                child: const Text(
                  'Do Something Else',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
            const SizedBox(height: 10.0),

            //   BUTTON
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.white70),
                onPressed: () {},
                child: const Text(
                  'Do Something Else',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
            const SizedBox(height: 10.0),

            //  BUTTON
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white70),
                onPressed: () {},
                child: const Text(
                  'Do Something Else',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
          ],
        ),
      ),
    );
  }
}
