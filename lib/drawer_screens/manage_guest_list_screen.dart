import 'package:flutter/material.dart';

class ManageGuestListScreen extends StatefulWidget {
  @override
  _ManageGuestListScreenState createState() => _ManageGuestListScreenState();
}

class _ManageGuestListScreenState extends State<ManageGuestListScreen> {
  List<String> guestList = [];

  TextEditingController guestNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Guest List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: guestNameController,
              decoration: InputDecoration(
                labelText: 'Guest Name',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addGuest();
              },
              child: Text('Add Guest'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: guestList.isEmpty
                  ? Center(
                child: Text('No guests added yet.'),
              )
                  : ListView.builder(
                itemCount: guestList.length,
                itemBuilder: (context, index) {
                  return GuestCard(
                    guestName: guestList[index],
                    onDelete: () {
                      removeGuest(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addGuest() {
    if (guestNameController.text.isNotEmpty) {
      setState(() {
        guestList.add(guestNameController.text);
      });
      guestNameController.clear();
    }
  }

  void removeGuest(int index) {
    setState(() {
      guestList.removeAt(index);
    });
  }
}

class GuestCard extends StatelessWidget {
  final String guestName;
  final VoidCallback onDelete;

  GuestCard({required this.guestName, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(guestName),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
