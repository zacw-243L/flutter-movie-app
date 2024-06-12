import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String strYear = '2023';

  // TODO Implement fetchMovies async function that takes in a parameter (year), makes an API request, processes response and returns List<Movie>
  fetchMovies() async {
    String baseURL = '';

    Map<String, String> requestHeaders = {
      'X-RapidAPI-Key': '',
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
    };

    Map<String, String> queryParams = {
      //TODO Add query parameters
      'list': 'top_boxoffice_200',
    };

    //DO NOT EDIT
    String queryString = Uri(queryParameters: queryParams).query;
    final response = await http.get(
      Uri.parse(baseURL + '?' + queryString),
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      // TODO
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(),
      //TODO Implement FloatingActionButton to navigate to SearchScreen

      appBar: AppBar(
        title: const Text('Movies'),
      ),

      body: Container(), //TODO Implement FutureBuilder
    );
  }
}
