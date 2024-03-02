
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawer_screens/create_schedule_screen.dart';
import '../drawer_screens/customize_event_detail_screen.dart';
import '../drawer_screens/manage_guest_list_screen.dart';
import '../drawer_screens/plan_organize_event_screen.dart';
import '../drawer_screens/send_iinvitation_screen.dart';
import '../event_model.dart';

class HomeScreen extends StatefulWidget {
  static final GlobalKey<_HomeScreenState> homeScreenStateKey =
  GlobalKey<_HomeScreenState>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [];
  List<String> guestList = [];

  @override
  Widget build(BuildContext context) {
    List<Event> events = context.watch<EventModel>().events.cast<Event>();


    return Scaffold(
      appBar: AppBar(
        title: Text('Event Planner'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                'Event Planner',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Plan and Organize Events'),
              onTap: () {
                // Navigate to Plan and Organize Events screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanOrganizeEventsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Manage Guest List'),
              onTap: () {
                // Navigate to Manage Guest List screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManageGuestListScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Send Invitations'),
              onTap: () {
                // Navigate to Send Invitations screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendInvitationsScreen(guestList: guestList),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Create Schedules'),
              onTap: () {
                // Navigate to Create Schedules screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateSchedulesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Customize Event Details'),
              onTap: () {
                  // Navigate to Customize Event Details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomizeEventDetailsScreen(),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // Background Image with Opacity
          Opacity(
            opacity: 0.5, // Set your desired opacity level
            child: Container(
              width: 300.0, // Set width to take the entire screen width
              height: 300.0, // Set height to take the entire screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/logo.png'), // Replace with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Your Centered Content
          events.isEmpty
              ? Center(
            child: Text('No events saved yet.'),
          )
           : ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return EventCard(event: events[index]);
            },
          ),
        ],
      ),
    );
  }

  void addEvent(Event? newEvent) {
    if (newEvent != null) {
      context.read<EventModel>().addEvent(newEvent);
    }
  }

  void navigateToPlanOrganizeEventsScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlanOrganizeEventsScreen()),
    );
    if (result != null && result is Event) {
      addEvent(result);
    }
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(event.title),
        subtitle: Text(
            '${event.date} ${event.time}\nLocation: ${event.location}'),
      ),
    );
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

