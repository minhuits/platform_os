# Platform OS
<img src="https://github.com/minhuits/platform_os/blob/master/images/image.png?raw=true" width="70%" height="80%" alt=""/>

### Korean
`PlatformOS`는 플랫폼(android, ios, fuchsia, linux, macos, windows, web)에 따라 
`widget`을 정의하는 데 도움을 주는 패키지입니다.

### English
`PlatformOS` is a package that helps define `widget` according to 
the platform (android, ios, fuchsia, linux, macos, windows, web).

## Use A Different Themes Example (서로 다른 테마 사용 예제)
### How to use one time (한 번에 사용하는 방법)
```dart
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
```
or
### How to use with only some changes (일부만 변경하여 사용하는 방법)
```dart
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
```

## Example (예제)
```dart

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
```
