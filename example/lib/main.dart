import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_os/platform_os.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';

    return PlatformOS(
      iOS: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(title: '$title iOS'),
      ),
      android: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: const MyHomePage(title: '$title Android'),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Demo';

    return MaterialApp(
      theme: PlatformOS.themeData(
        iOS: ThemeData(primarySwatch: Colors.blue),
        android: ThemeData(primarySwatch: Colors.green),
      ),
      home: const PlatformOS(
        iOS: MyHomePage(title: '$title iOS'),
        android: MyHomePage(title: '$title Android'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _value = false;

  void _incrementCounter() => setState(() => _counter++);

  void onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const PlatformOS(
              iOS: Text('iOS Platform Test: '),
              android: Text('Android Platform Test: '),
            ),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            PlatformOS(
              iOS: CupertinoSwitch(value: _value, onChanged: onChanged),
              android: Switch(value: _value, onChanged: onChanged),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const PlatformOS(
          iOS: Icon(Icons.add_home),
          android: Icon(Icons.add),
        ),
      ),
    );
  }
}
