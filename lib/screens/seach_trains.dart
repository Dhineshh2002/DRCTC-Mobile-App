import 'package:flutter/material.dart';

class SearchTrains extends StatefulWidget {
  const SearchTrains({super.key});

  @override
  State<SearchTrains> createState() => _SearchTrainsState();
}

class _SearchTrainsState extends State<SearchTrains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              hintText: 'Search trains',
              onTap: () {
                controller.openView();
              },
              onSubmitted: (text) {
                // Close the search and return the submitted text
                Navigator.pop(context, text);
              },
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(10, (int index) {
              final String item = 'Train $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  Navigator.pop(context, item);
                },
              );
            });
          },
        ),
      ),
    );
  }
}
