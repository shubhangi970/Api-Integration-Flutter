import 'package:flutter/material.dart';
import 'package:http/http.dart' as http             ;
import 'dart:convert';

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String stringResponse = "";
  late Map<String, dynamic> mapResponse = {};
  late Map<String, dynamic> dataResponse = {};// Initialize as empty map
  late List<dynamic> ListResponse = [];

  Future apicall() async{
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(response.statusCode == 200){
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(response.body);
        // dataResponse = mapResponse['data']; // This line
        ListResponse = mapResponse['data'];
      });

    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(ListResponse.isEmpty ? "data is loading": "hello"+ ListResponse[2].toString()),
      ),
    );
  }
}

  