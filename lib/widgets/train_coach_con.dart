import 'package:flutter/material.dart';

class TrainCoachContainer extends StatelessWidget {
  TrainCoachContainer({
    super.key,
    required this.percentageOfChance,
    required this.coachName,
    required this.ticketPrice,
    required this.numberOfWaitingList,
  });

  final int percentageOfChance;
  final String coachName;
  final int ticketPrice;
  final int numberOfWaitingList;

  void determineColors() {
    if (percentageOfChance > 85) {
      coachColor = Colors.green[50];
      borderColor = Colors.green[100];
      textColor = Colors.green;
    } else if (percentageOfChance > 60) {
      coachColor = Colors.yellow[50];
      borderColor = Colors.yellow[100];
      textColor = Colors.yellow;
    } else {
      coachColor = Colors.red[50];
      borderColor = Colors.red[100];
      textColor = Colors.red;
    }
  }

  Color? coachColor;
  Color? borderColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    determineColors();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 140,
          height: 110,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: coachColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            border: Border.all(
              width: 2,
              color: borderColor ?? Colors.grey, // Fallback color if borderColor is null
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coachName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "\u{20B9}$ticketPrice",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "WL $numberOfWaitingList",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              Text(
                "$percentageOfChance% Chance",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
