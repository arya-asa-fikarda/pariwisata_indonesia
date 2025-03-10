import 'package:flutter/material.dart';

class TravelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Upcoming Trips',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16.0),
            TripCard(
              destination: 'New York City',
              date: 'June 15 - 20',
            ),
            SizedBox(height: 12.0),
            TripCard(
              destination: 'Paris',
              date: 'September 1 - 10',
            ),
            SizedBox(height: 24.0),
            Text(
              'Travel Resources',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 16.0),
            ResourceTile(
              title: 'Flight Booking',
              icon: Icons.flight,
            ),
            SizedBox(height: 12.0),
            ResourceTile(
              title: 'Hotel Reservations',
              icon: Icons.hotel,
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String destination;
  final String date;

  TripCard({
    required this.destination,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 4.0),
            Text(
              date,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceTile extends StatelessWidget {
  final String title;
  final IconData icon;

  ResourceTile({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to the corresponding resource
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 16.0),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}