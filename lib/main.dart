import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Возвращение значения'),
        ),
        body: HomePage(),
      ),
      routes: {
        '/page2': (context) => SecondPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _returnSecondPage(context);
        },
        child: const Text("Приступить к выбору..."),
      ),
    );
  }

  void _returnSecondPage(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/page2');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result.toString()),
        duration: const Duration(seconds: 1),        
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Выберите любой вариант'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Да!');
                },
                child: Text("Да!"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Нет.');
                },
                child: Text("Нет."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
