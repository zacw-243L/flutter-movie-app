import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController movieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Parameters'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: movieController,
              decoration: InputDecoration(
                labelText: 'Enter Year:',
              ),
            ),
            Container(
              width: double.infinity, // Make the button as wide as the screen
              child: ElevatedButton(
                onPressed: () {
                  if (movieController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a year'),
                      ),
                    );
                  } else {
                    Navigator.pop(context, movieController.text);
                  }
                },
                child: Text('search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
