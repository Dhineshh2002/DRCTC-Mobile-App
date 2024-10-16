import 'package:drctc/screens/seach_trains.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String sourceTrain = 'Select Source Train';
  String destinationTrain = 'Select Destination Train';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final String? selectedTrain = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchTrains(),
                  ),
                );
                if (selectedTrain != null) {
                  setState(() {
                    sourceTrain = selectedTrain;
                  });
                }
              },
              child: Text(sourceTrain),
            ),
            ElevatedButton(
              onPressed: () async {
                final String? selectedTrain = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchTrains(),
                  ),
                );
                if (selectedTrain != null) {
                  setState(() {
                    destinationTrain = selectedTrain;
                  });
                }
              },
              child: Text(destinationTrain),
            ),
          ],
        ),
      ),
    );
  }
}
