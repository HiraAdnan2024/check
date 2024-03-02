import 'package:flutter/material.dart';

class CreateSchedulesScreen extends StatefulWidget {
  @override
  _CreateSchedulesScreenState createState() => _CreateSchedulesScreenState();
}

class _CreateSchedulesScreenState extends State<CreateSchedulesScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Event Title',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }

                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: selectedTime,
                );
                if (pickedTime != null && pickedTime != selectedTime) {
                  setState(() {
                    selectedTime = pickedTime;
                  });
                }
              },
              child: Text('Select Date and Time'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: 'Additional Notes',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                saveSchedule();
              },
              child: Text('Save Schedule'),
            ),
          ],
        ),
      ),
    );
  }

  void saveSchedule() {
    // Implement your logic to save the schedule details
    // For demonstration purposes, we'll print the schedule details to the console
    print('Title: ${titleController.text}');
    print('Date: ${selectedDate}');
    print('Time: ${selectedTime}');
    print('Notes: ${notesController.text}');

    // Clear the text controllers
    titleController.clear();
    notesController.clear();
  }
}
