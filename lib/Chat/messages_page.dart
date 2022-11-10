import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  static String id = 'MessagesPage';
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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
                    'Recent',
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
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
                Divider(
                  color: Colors.black,
                  indent: 20,
                  endIndent: 20,
                ),
                MessageListTile(),
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

class MessageListTile extends StatelessWidget {
  const MessageListTile({
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
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/landing.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Alex',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Alex Alex Alex Alex Alex Alex ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                'Alex',
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
