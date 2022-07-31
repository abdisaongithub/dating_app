import 'package:dating_app/Swipe/swipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MenuScreen extends StatefulWidget {
  static String id = 'MenuScreen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int index = 0;

  double position = 0;
  final List<Widget> screens = [
    const Center(
      child: Text('1'),
    ),
    const Center(
      child: Text('2'),
    ),
    const SwipeScreen(),
    const Center(
      child: Text('4'),
    ),
  ];

  final List<Widget> _icons = [
    const Visibility(
      visible: true,
      child: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
    const Visibility(
      visible: true,
      child: Icon(
        Icons.notifications,
        color: Colors.white,
      ),
    ),
    const Visibility(
      visible: false,
      child: Icon(
        IonIcons.heart,
        color: Colors.white,
      ),
    ),
    const Visibility(
      visible: true,
      child: Icon(
        IonIcons.chat_bubble,
        color: Colors.white,
      ),
    ),
    const Visibility(
      visible: true,
      child: Icon(
        IonIcons.settings,
        color: Colors.white,
      ),
    ),
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
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: screens[index],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  // clipBehavior: Clip.none,
                  decoration: const BoxDecoration(
                      // color: Colors.black,
                      ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipPath(
                          clipper: NotchClipper(),
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            color: Colors.black,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: _icons,
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.ease,
                        top: -30,
                        left: (MediaQuery.of(context).size.width / 2) - 30,
                        duration: const Duration(milliseconds: 500),
                        onEnd: () {
                          setState(() {
                            debugPrint(index.toString());
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              position =
                                  (MediaQuery.of(context).size.width / 2) - 30;
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(bottom: 30),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child: const Center(
                              child: Icon(
                                IonIcons.heart,
                                color: Colors.black,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    path.lineTo(w / 2 - 40, 0);
    path.arcToPoint(
      Offset(w / 2 + 40, 0),
      radius: const Radius.circular(40),
      clockwise: false,
    );
    // path.lineTo(w / 2, 30);
    path.lineTo(w / 2 + 30, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
