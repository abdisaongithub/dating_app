import 'package:dating_app/Chat/chat_screen.dart';
import 'package:dating_app/Swipe/swipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MenuScreen extends StatefulWidget {
  static String id = 'MenuScreen';

  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with SingleTickerProviderStateMixin {
  int index = 2;
  double position = 0;
  double previousPosition = 0;
  final duration = const Duration(milliseconds: 300);
  final curve = Curves.ease;


  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      changePage(2);
    });

    super.initState();
  }

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

  changePage(newIndex){
    setState(() {
      index = newIndex;
      previousPosition = position;
      position = getButtonPosition(newIndex, MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> floatingButtonIcons = [
      const Icon(
        IonIcons.person,
        color: Colors.black,
        size: 22,
      ),
      const Icon(
        IonIcons.notifications,
        color: Colors.black,
        size: 22,
      ),
      const Icon(
        IonIcons.heart,
        color: Colors.black,
        size: 22,
      ),
      const Icon(
        IonIcons.chatbubble,
        color: Colors.black,
        size: 22,
      ),
      const Icon(
        IonIcons.settings,
        color: Colors.black,
        size: 22,
      ),
    ];

    final List<Widget> bottomNavigationButtons = [
      Expanded(
        child: GestureDetector(
          onTap: () {
            changePage(0);
          },
          child: AnimatedOpacity(
            duration: duration,
            opacity: index != 0 ? 1.0 : 0.0,
            child: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            changePage(1);
          },
          child: AnimatedOpacity(
            duration: duration,
            opacity: index != 1 ? 1.0 : 0.0,
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            changePage(2);
          },
          child: AnimatedOpacity(
            duration: duration,
            opacity: index != 2 ? 1.0 : 0.0,
            child: const Icon(
              IonIcons.heart,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            changePage(3);
          },
          child: AnimatedOpacity(
            duration: duration,
            opacity: index != 3 ? 1.0 : 0.0,
            child: const Icon(
              IonIcons.chatbubble,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onTap: () {
            changePage(4);
          },
          child: AnimatedOpacity(
            duration: duration,
            opacity: index != 4 ? 1.0 : 0.0,
            child: const Icon(
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
          changePage(2);
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
                      child: TweenAnimationBuilder(
                        duration: duration,
                        curve: curve,
                        tween: Tween<double>(
                          begin: previousPosition,
                          end: getButtonPosition(index, MediaQuery.of(context).size.width),
                        ),
                        builder: (context, value, widget){
                          return ClipPath(
                            clipper: NotchClipper(
                              height: 60,
                              center: value,
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              color: Colors.black,
                              height: 60,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: bottomNavigationButtons,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    AnimatedPositioned(
                      curve: curve,
                      top: -30,
                      left: position,
                      duration: duration,
                      onEnd: () {
                        setState(() {
                          debugPrint(index.toString());
                        });
                      },
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(217, 217, 217, 1),
                          ),
                          child: Center(
                            child: AnimatedSwitcher(
                              duration: duration,
                              child: floatingButtonIcons[index],
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
  // final double width;
  final double height;
  final double center;

  // final int position;
  // final Function() onChange;

  NotchClipper({
    required this.height,
    required this.center,
  });

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path();

    path.lineTo(center - 10, 0);
    path.arcToPoint(
      Offset(center + 70, 0),
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
