import 'package:drctc/screens/seach_trains.dart';
import 'package:drctc/widgets/train_coach_con.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String sourceStation = 'Enter From';
  String destinationStation = 'Enter To';
  String selectedDate = 'Select date of travel';
  DateTime travelDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    selectedDate = DateFormat('EEE, dd yyyy').format(travelDate);
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton.icon(
                        // clipBehavior: ,
                        onPressed: () async {
                          String result = await showSearch(
                            context: context,
                            delegate: SearchTrain(),
                          );
                          setState(() {
                            sourceStation = result;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment
                              .centerLeft, // Align the text to the start (left)
                        ),
                        icon: const Icon(Icons.train),
                        label: Text(sourceStation),
                        iconAlignment: IconAlignment.start,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          String result = await showSearch(
                            context: context,
                            delegate: SearchTrain(),
                          );
                          setState(() {
                            destinationStation = result;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment
                              .centerLeft, // Align the text to the start (left)
                        ),
                        iconAlignment: IconAlignment.start,
                        icon: const Icon(Icons.train),
                        label: Text(destinationStation),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: travelDate ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(DateTime.now().year + 2),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              travelDate = pickedDate;
                              selectedDate =
                                  DateFormat('EEE, dd yyyy').format(pickedDate);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          alignment: Alignment
                              .centerLeft, // Align the text to the start (left)
                        ),
                        iconAlignment: IconAlignment.start,
                        icon: const Icon(Icons.calendar_month),
                        label: Text(selectedDate),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TrainCoachContainer(
                                percentageOfChance: 10,
                                coachName: "SL",
                                ticketPrice: 250,
                                numberOfWaitingList: 0,
                              ),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text("SEARCH TRAINS"),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 40,
                top: 60,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (sourceStation == 'Enter From' &&
                          destinationStation == 'Enter To') {
                        return;
                      } else if (sourceStation == 'Enter From') {
                        sourceStation = destinationStation;
                        destinationStation = 'Enter To';
                      } else if (destinationStation == 'Enter To') {
                        destinationStation = sourceStation;
                        sourceStation = 'Enter From';
                      } else {
                        String temp = sourceStation;
                        sourceStation = destinationStation;
                        destinationStation = temp;
                      }
                    });
                  },
                  icon: const Icon(Icons.swap_vert_circle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
