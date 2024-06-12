import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController movieController = TextEditingController();
  bool _yearErrorShown = false;

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
                  final currentYear =
                      int.parse(DateFormat('yyyy').format(DateTime.now()));
                  final enteredYear = int.parse(movieController.text);

                  if (movieController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a year'),
                      ),
                    );
                  } else if (enteredYear > currentYear - 1 ||
                      enteredYear < 2001) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter a valid year (last year)'),
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
