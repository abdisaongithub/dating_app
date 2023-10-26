// ignore_for_file: library_private_types_in_public_api

import 'package:dating_app/Common/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeScreen extends StatefulWidget {
  static String id = 'SwipeScreen';

  const SwipeScreen({super.key});

  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
  ]; // TODO: replace this line when implementing data from backend

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Candidate(
            name: 'Semira',
            age: 23,
            image: 'assets/images/semira.png',
            bio: 'Born and raised in Harar, \nCity of Love, Harmony and Care',
            city: 'Harar',
            country: 'Ethiopia',
            zodiac: 'Aquarius',
            onLike: () => _matchEngine.currentItem!.like(),
            onDisLike: () => _matchEngine.currentItem!.nope(),
            onSuperLike: () => _matchEngine.currentItem!.superLike(),
          ),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Liked ${_names[i]}"),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Nope ${_names[i]}"),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Super liked ${_names[i]}"),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          onSlideUpdate: (region) async {
            debugPrint("Region $region");
          },
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: Theme.of(context).custom.setupBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Date',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return _swipeItems[index].content;
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                if (kDebugMode) {
                  print("item: ${item.content.toString()}, index: $index");
                }
              },
              upSwipeAllowed: true,
              fillSpace: true,
              likeTag: const Icon(Icons.satellite),
            ),
          ),
        ],
      ),
    );
  }
}

class Candidate extends StatelessWidget {
  static String id = 'Candidate';

  const Candidate({
    super.key,
    required this.name,
    required this.age,
    required this.zodiac,
    required this.city,
    required this.country,
    required this.bio,
    required this.image,
    required this.onLike,
    required this.onDisLike,
    required this.onSuperLike,
  });

  final String name;
  final int age;
  final String zodiac;
  final String city;
  final String country;
  final String bio;
  final String image;

  final VoidCallback onLike;
  final VoidCallback onDisLike;
  final VoidCallback onSuperLike;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 100,
      ),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              // color: Colors.white.withOpacity(0.3),
              gradient: RadialGradient(
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
                radius: 1.5,
                focalRadius: 0.2,
                transform: GradientRotation(2),
                // TODO: git it an offset
                // center: Alignment.topLeft,
                colors: [
                  Color.fromRGBO(232, 65, 241, 1),
                  Color.fromRGBO(142, 168, 247, 1),
                ],
                stops: [0.2, 0.7],
                focal: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$name, $age',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          zodiac,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '$city, $country',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    bio,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: const Icon(
                          Icons.undo,
                          color: Colors.blue,
                        ),
                      ),
                      GestureDetector(
                        onTap: onDisLike,
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                            ),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 34,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onSuperLike,
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.amber,
                            ),
                          ),
                          child: const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 44,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onLike,
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                            ),
                          ),
                          child: const Icon(
                            IonIcons.heart,
                            color: Colors.red,
                            size: 34,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: const Icon(
                          Icons.ac_unit_sharp,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                  decoration: const BoxDecoration(
                      // color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
