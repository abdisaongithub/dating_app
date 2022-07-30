import 'package:dating_app/Common/theme_provider.dart';
import 'package:dating_app/Swipe/swipe_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  static String id = 'MenuScreen';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int index = 0;

  final List<Widget> screens = [
    const SwipeScreen(),
    const SwipeScreen(),
    const SwipeScreen(),
    const SwipeScreen(),
    const SwipeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index != 2) {
          setState(() {
            index = 2;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration:
                BoxDecoration(color: Theme.of(context).custom.selectedColor),
            height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.stars,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 0;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.filter,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 1;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 2;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.sticky_note_2_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 3;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.person_outline,
                  ),
                  onPressed: () {
                    setState(() {
                      index = 4;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: screens[index],
              ),
              // Align(
              //   alignment: Alignment.topCenter,
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //       top: 12,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         // SizedBox(
              //         //   width: 40,
              //         //   child: IconButton(
              //         //     onPressed: () {},
              //         //     icon: const Icon(Icons.menu),
              //         //   ),
              //         // ),
              //         const SizedBox(
              //           width: 40,
              //         ),
              //         Expanded(
              //           child: SizedBox(
              //             height: 36,
              //             child: Image.asset(
              //               'assets/images/landing.png',
              //               fit: BoxFit.contain,
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 20,
              //           child: GestureDetector(
              //             onTap: () {
              //               // Navigator.pushNamed(
              //               //   context,
              //               //   SearchScreen.id,
              //               // );
              //             },
              //             child: const Icon(
              //               Icons.search,
              //             ),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
