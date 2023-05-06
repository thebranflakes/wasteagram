import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/character.dart';
import 'dart:convert';

class RemoteDataScreen extends StatefulWidget {
  static final url = Uri.parse('https://swapi.dev/api/people/1');

  const RemoteDataScreen({super.key});

  @override
  State<RemoteDataScreen> createState() => RemoteDataScreenState();
}

class RemoteDataScreenState extends State<RemoteDataScreen> {
  Future<http.Response> apiResponse = http.get(RemoteDataScreen.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiResponse,
        builder: (context, snapshot) {
          Widget child;
          if (snapshot.hasData) {
            Character character =
                Character.fromJSON(jsonDecode(snapshot.data!.body));
                child = Text('${character.name}', style: Theme.of(context).textTheme.headline4);
          } else {
            child = CircularProgressIndicator();
          }
          return Center(child: child);
        });
  }
}
