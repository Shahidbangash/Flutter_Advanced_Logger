import 'package:flutter/material.dart';
import 'package:flutter_advanced_logger/utils/advanced_logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.d('Building MyApp', tag: 'APP_LIFECYCLE');
    return MaterialApp(
      title: 'Advanced Logger Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Advanced Logger Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key) {
    Log.d('MyHomePage constructed', tag: 'WIDGET_LIFECYCLE');
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      Log.d('Counter incremented to $_counter', tag: 'USER_ACTION');
    });
  }

  @override
  void initState() {
    super.initState();
    Log.d('MyHomePage initialized', tag: 'WIDGET_LIFECYCLE');
  }

  @override
  Widget build(BuildContext context) {
    Log.d('Building MyHomePage', tag: 'WIDGET_LIFECYCLE');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Log.d('Attempting a simulated error', tag: 'ERROR_DEMO');
                try {
                  throw Exception('This is a simulated error');
                } catch (e, stackTrace) {
                  Log.d(
                    'Caught a simulated error',
                    tag: 'ERROR_DEMO',
                    error: e,
                    stackTrace: stackTrace,
                  );
                }
              },
              child: Text('Simulate Error'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    Log.d('MyHomePage disposed', tag: 'WIDGET_LIFECYCLE');
    super.dispose();
  }
}
