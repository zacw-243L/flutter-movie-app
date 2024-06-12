import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String strYear = '2023';

  // TODO Implement fetchMovies async function that takes in a parameter (year), makes an API request, processes response and returns List<Movie>
  Future<List<Movie>> fetchMovies(String strYear) async {
    const baseURL = "https://moviesdatabase.p.rapidapi.com/titles";

    Map<String, String> requestHeaders = {
      'X-RapidAPI-Key': '',
      'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com'
    };

    Map<String, String> queryParams = {
      //TODO Add query parameters
      'list': 'top_boxoffice_200',
      "year": "2023"
    };

    //DO NOT EDIT
    String queryString = Uri(queryParameters: queryParams).query;
    final response = await http.get(
      Uri.parse(baseURL + '?' + queryString),
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      // TODO
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> jsonList = jsonData['results'] as List<dynamic>;
      print(jsonList);
      List<Movie> movies =
          jsonList.map((json) => Movie.fromJson(json)).toList();
      return movies;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO Implement FloatingActionButton to navigate to SearchScreen
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final typedName = await Navigator.pushNamed(context, '/search');
        },
        child: const Icon(Icons.search, size: 30.0, color: Colors.black),
      ),
      appBar: AppBar(
        title: const Text('Movies'),
      ),

      //TODO Implement FutureBuilder
      body: SafeArea(
        child: FutureBuilder<List<Movie>>(
          future: fetchMovies(strYear),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Movie movie = snapshot.data![index];
                  return ListTile(
                    leading: Image.network(movie.url),
                    title: Text(movie.title),
                    subtitle: Text(
                      movie.caption,
                      textAlign: TextAlign.justify, // Justify the subtitle
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
