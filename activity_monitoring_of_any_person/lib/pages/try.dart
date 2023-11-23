import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URL Launcher Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> urls = [
    'https://www.google.com',
    'https://www.example.com',
    'https://www.flutter.dev',
    // Add more URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('URL Launcher Example'),
      ),
      body: ListView.builder(
        itemCount: urls.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () async {
              if (await canLaunch(urls[index])) {
                await launch(urls[index]);
              } else {
                throw 'Could not launch ${urls[index]}';
              }
            },
            child: Text('Open URL ${index + 1}'),
          );
        },
      ),
    );
  }
}
