import 'package:flutter/material.dart';

class SendInvitationsScreen extends StatefulWidget {
  final List<String> guestList;

  SendInvitationsScreen({required this.guestList});

  @override
  _SendInvitationsScreenState createState() => _SendInvitationsScreenState();
}

class _SendInvitationsScreenState extends State<SendInvitationsScreen> {
  List<String> selectedGuests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Invitations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select Guests to Send Invitations:'),
            SizedBox(height: 16),
            Expanded(
              child: widget.guestList.isEmpty
                  ? Center(
                child: Text('No guests available.'),
              )
                  : ListView.builder(
                itemCount: widget.guestList.length,
                itemBuilder: (context, index) {
                  final guestName = widget.guestList[index];
                  final isSelected = selectedGuests.contains(guestName);

                  return ListTile(
                    title: Text(guestName),
                    tileColor: isSelected
                        ? Colors.blue.withOpacity(0.3)
                        : Colors.transparent,
                    onTap: () {
                      toggleSelectedGuest(guestName);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                sendInvitations();
              },
              child: Text('Send Invitations'),
            ),
          ],
        ),
      ),
    );
  }

  void toggleSelectedGuest(String guestName) {
    setState(() {
      if (selectedGuests.contains(guestName)) {
        selectedGuests.remove(guestName);
      } else {
        selectedGuests.add(guestName);
      }
    });
  }

  void sendInvitations() {
    // Implement your logic to send invitations to the selected guests
    // For demonstration purposes, we'll print the selected guests to the console
    print('Sending invitations to: $selectedGuests');
  }
}
