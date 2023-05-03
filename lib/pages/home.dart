import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlarmList();
  }
}

class AlarmList extends StatefulWidget {
  const AlarmList({super.key});

  @override
  State<AlarmList> createState() => _AlarmListState();
}

class Alarm {
  final String time;
  final String label;
  final bool isActive;

  Alarm({required this.time, required this.label, required this.isActive});
}

class _AlarmListState extends State<AlarmList> {
  final List<Alarm> alarms = [
    Alarm(time: '6:00 AM', label: 'Morning alarm', isActive: true),
    Alarm(time: '12:00 PM', label: 'Lunch break', isActive: false),
    Alarm(time: '6:00 PM', label: 'Evening reminder', isActive: true),
  ];

  @override
  void initState() {
    super.initState();
    print('initState()');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Alarms',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  final alarm = alarms[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          alarm.isActive ? Colors.green : Colors.grey,
                      child: Icon(
                        alarm.isActive ? Icons.check : Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      alarm.time,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      alarm.label,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
