import 'package:flutter/material.dart';


class PlanOrganizeEventsScreen extends StatefulWidget {
  @override
  _PlanOrganizeEventsScreenState createState() => _PlanOrganizeEventsScreenState();
}

class _PlanOrganizeEventsScreenState extends State<PlanOrganizeEventsScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan and Organize Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Event Title'),
              controller: titleController,
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
              decoration: InputDecoration(labelText: 'Event Location'),
              controller: locationController,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Event Description'),
              maxLines: 3,
              controller: descriptionController,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                saveEvent(context);
              },
              child: Text('Save Event'),
            ),
          ],
        ),
      ),
    );
  }

  void saveEvent(BuildContext context) {
    // Save the event details
    Event newEvent = Event(
      title: titleController.text,
      date: "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
      time: "${selectedTime.hour}:${selectedTime.minute}",
      location: locationController.text,
    );

    // Pass the new event data back to the home screen
    Navigator.pop(context, newEvent);

    // Clear the text controllers
    titleController.clear();
    locationController.clear();
    descriptionController.clear();
  }
}


class Event {
  final String title;
  final String date;
  final String time;
  final String location;

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
  });
}
