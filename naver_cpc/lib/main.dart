import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'src/barchart.dart';
import 'src/getx/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ReactiveController());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(onPressed: httpget, child: Text('sql httpget')),
              TextButton(onPressed: sqlread, child: Text('sql read')),
              TextButton(onPressed: sqlupdate, child: Text('sql sqlupdate')),
              ChartApp(),
            ],
          ),
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

Future<void> httpget() async {
  var url = Uri.http('127.0.0.1:3000', '/');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    print('Number of books about http:.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}

Future<void> sqlread() async {
  var url = Uri.http('127.0.0.1:3000', '/cpc');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
    print(jsonResponse);
    // var itemCount = jsonResponse['mall_id'];
    // print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
// Await the http get response, then decode the json-formatted response.

Future<void> sqlupdate() async {
  var url = Uri.http('127.0.0.1:3000', '/cpcupdate');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String>{
      'lengths': '1',
      'mall_id': 'mosadi1',
      'dates': '230222',
      'type': 'p'
    },
  );
  if (response.statusCode == 200) {
    print(response.body);
    print('Number of books about http:.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
