import 'package:dating_app/Chat/chat_screen.dart';
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

  getButtonPosition(position, width) {
    switch (position) {
      case 0:
        return ((width / 2.0) * 0.33333) - 50;
      case 1:
        return ((width / 2.0) * 0.666666) - 50;
      case 2:
        return (width * 0.5) - 30;
      case 3:
        return (width / 2.0) + ((width / 2) * 0.33333) - 10;
      case 4:
        return (width / 2.0) + ((width / 2) * 0.66666) - 10;
    }
  }

  final List<Widget> screens = [
    const Center(
      child: Text('1'),
    ),
    const Center(
      child: Text('2'),
    ),
    const SwipeScreen(),
    const ChatScreen(),
    const Center(
      child: Text('5'),
    ),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        position = getButtonPosition(2, MediaQuery.of(context).size.width);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> icons = [
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              index = 0;
              position = getButtonPosition(0, MediaQuery.of(context).size.width);
            });
          },
          child: Container(
            child: const Visibility(
              visible: true,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              index = 1;
              position = getButtonPosition(1, MediaQuery.of(context).size.width);
            });
          },
          child: const Visibility(
            visible: true,
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              index = 2;
              position = getButtonPosition(2, MediaQuery.of(context).size.width);
            });
          },
          child: const Visibility(
            visible: true,
            child: Icon(
              IonIcons.heart,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              index = 3;
              position = getButtonPosition(3, MediaQuery.of(context).size.width);
            });
          },
          child: const Visibility(
            visible: true,
            child: Icon(
              IonIcons.chatbubble,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              index = 4;
              position = getButtonPosition(4, MediaQuery.of(context).size.width);
            });
          },
          child: const Visibility(
            visible: true,
            child: Icon(
              IonIcons.settings,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ];

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
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: screens[index],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
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
                        clipper: NotchClipper(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          position: index,
                          onChange: () {

                          },
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          color: Colors.black,
                          height: 60,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: icons,
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      curve: Curves.ease,
                      top: -30,
                      left: position,
                      duration: const Duration(milliseconds: 500),
                      onEnd: () {
                        setState(() {
                          debugPrint(index.toString());
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            position = (size.width / 2) - 30;
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
                              IonIcons.chatbubble,
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
          ],
        ),
      ),
    );
  }
}

class NotchClipper extends CustomClipper<Path> {
  final double width;
  final double height;
  final int position;
  final Function() onChange;

  NotchClipper({
    required this.width,
    required this.height,
    required this.position,
    required this.onChange,
  });

  getCenter(position) {
    switch (position) {
      case 0:
        return (width / 2.0) * 0.33333 - 20;
      case 1:
        return (width / 2.0) * 0.666666 - 20;
      case 2:
        return width * 0.5;
      case 3:
        return (width / 2.0) + ((width / 2) * 0.33333) + 20;
      case 4:
        return (width / 2.0) + ((width / 2) * 0.66666) + 20;
    }
  }

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    path.lineTo(getCenter(position) - 40, 0);
    path.arcToPoint(
      Offset(getCenter(position) + 40, 0),
      radius: const Radius.circular(10),
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
