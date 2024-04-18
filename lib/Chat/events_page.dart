import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  static String id = 'EventsPage';
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {

  List<EventData> events =[
    EventData(title: 'Batch /10 get Together', description: 'Get together event for 2010 batch', guests: 'Abdisa, Biniyam, Kebede, Kebedech ...'),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
    // EventData(title: '', description: '', guests: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Text(
                    'All Events',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      // fontSize: 16,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Show Filter Options');
                  },
                  child: const Icon(Icons.tune),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                for(var event in events)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      EventListTile(eventData: event),
                      const Divider(
                        color: Colors.black,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventListTile extends StatelessWidget {
  const EventListTile({
    super.key, required this.eventData,
  });

  final EventData eventData;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 64,
      decoration: const BoxDecoration(
          // color: Colors.grey,
          // borderRadius: BorderRadius.circular(10),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventData.title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                eventData.description,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                eventData.guests,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EventData{
  final String title;
  final String description;
  final String guests;

  EventData({required this.title, required this.description, required this.guests});
}

class FilterEvents extends StatefulWidget {
  static String id = 'FilterEvents';
  const FilterEvents({Key? key}) : super(key: key);

  @override
  _FilterEventsState createState() => _FilterEventsState();
}

class _FilterEventsState extends State<FilterEvents> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
