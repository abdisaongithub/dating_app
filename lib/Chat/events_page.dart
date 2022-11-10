import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  static String id = 'EventsPage';
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
                    'Hungry',
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
              children: const [
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                EventListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: const BoxDecoration(
          // color: Colors.grey,
          // borderRadius: BorderRadius.circular(10),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hungry Event',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Hunger Games Hunger Games Hunger Games ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'Alex, Kebe, Abe, Bini, Abdi',
                style: TextStyle(
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
