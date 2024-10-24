import 'package:flutter/material.dart';

class AvailableTrainContainer extends StatelessWidget {
  const AvailableTrainContainer({
    super.key,
    required this.trainNumber,
    required this.trainName,
    required this.boardingTime,
    required this.arrivalTime,
    required this.journeyTime,
    required this.boardStationCode,
    required this.destStationCode,
  });

  final int trainNumber;
  final String trainName;
  final String boardingTime;
  final String arrivalTime;
  final String journeyTime;
  final String boardStationCode;
  final String destStationCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text("$trainNumber - $trainName"),
              Text("$boardingTime $boardStationCode - "
                  "$journeyTime - $arrivalTime $destStationCode"),
            ],
          ),
        ),
      ),
    );
  }
}
