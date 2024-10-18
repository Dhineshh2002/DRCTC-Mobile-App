import 'package:flutter/material.dart';

class SearchTrain extends SearchDelegate {
  List<String> trainNames = ['train1', 'train2', 'train3', 'train4'];
  Map<String, String> trains = {
    "KMU": "Kumbakonam",
    "MS": "Chennai Egmore",
    "CCN": "Chennai Central",
    "TBM": "Tambaram",
    "MYD": "Mayiladurai",
    "TNJ": "Thanjavur",
    "TRI": "Trichi",
    "ARI": "Ariyalur",
    "MAM": "Mambalam",
    "GUI": "Guindy",
    "CGP": "Chengalpattu"
  };

  @override
  String? get searchFieldLabel => 'Search trains...';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w300,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    if (query.isNotEmpty) {
      matchQuery.addAll(trains.entries // get map entries
          .map((entry) =>
              '${entry.key} - ${entry.value}') // concatenating key-value
          .toList() // converting into list
          .where((item) => item
              .toLowerCase()
              .contains(query.toLowerCase()))); // matching with query
    } else {
      matchQuery.addAll(trains.entries
          .map((entries) => '${entries.key} - ${entries.value}')
          .toList());
    }

    if (matchQuery.isEmpty) {
      return const ListTile(
        title: Text("No station found"),
      );
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        String result = matchQuery[index];

        return ListTile(
          onTap: () {
            query = result;
            close(context, result);
          },
          title: Text(result),
        );
      },
    );
  }
}
