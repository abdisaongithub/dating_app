import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import '../../constants/image_paths.dart';
import 'setup_screen.dart';

class SetupJobPage extends StatefulWidget {
  static String id = 'SetupJobPage';
  const SetupJobPage({Key? key}) : super(key: key);

  @override
  _SetupJobPageState createState() => _SetupJobPageState();
}

class _SetupJobPageState extends State<SetupJobPage> {
  bool job = true;

  List<List<dynamic>> jobs = [
    ['Electrician', true],
    ['Developer', false],
    ['Engineer', false],
    ['Project Manager', false],
    ['Sales', false],
  ];

  ExpansionTileController expansionTileController = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BigText(
                  text: 'Job',
                  orangeBackground: false,
                  fontSize: 40,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                ),
                Image.asset(
                  PngPaths.userFill,
                  height: 60,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (var i = 0; i < 30; i++)
                  Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Got a Job?',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        job = true;
                      });
                      expansionTileController.expand();
                      // Navigator.pushNamed(context, LandingScreen.id);
                      // pageController.animateToPage(
                      //   1,
                      //   duration: const Duration(milliseconds: 300),
                      //   curve: Curves.bounceIn,
                      // );
                    },
                    child: AnimatedContainer(
                      width: 120,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: job ? const Color.fromRGBO(0, 0, 0, 0.8) : const Color.fromRGBO(222, 222, 222, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: job ? Colors.white : Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      setState(() {
                        job = false;
                      });
                      // Navigator.pushNamed(context, LandingScreen.id);
                      // pageController.animateToPage(
                      //   3,
                      //   duration: const Duration(milliseconds: 300),
                      //   curve: Curves.bounceIn,
                      // );
                      expansionTileController.collapse();
                    },
                    child: AnimatedContainer(
                      width: 120,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: !job ? const Color.fromRGBO(0, 0, 0, 0.8) : const Color.fromRGBO(222, 222, 222, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: job ? Colors.black : Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Container(
            //   height: 50,
            //   decoration: BoxDecoration(
            //     color: Colors.transparent,
            //     border: Border.all(
            //       color: Colors.grey,
            //     ),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Row(
            //     children: [
            //       const SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         'Hometown',
            //         style: TextStyle(
            //           color: Colors.grey.withOpacity(0.8),
            //         ),
            //       ),
            //       const Expanded(
            //         child: SizedBox(),
            //       ),
            //       const RotatedBox(
            //         quarterTurns: 1,
            //         child: Icon(
            //           Icons.chevron_right,
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 10,
            //       ),
            //     ],
            //   ),
            // ),
            // ExpansionTile(
            //   title: Text('ExpansionTile 1'),
            //   subtitle: Text('Trailing expansion arrow icon'),
            //   children: <Widget>[
            //     ListTile(title: Text('This is tile number 1')),
            //   ],
            // ),
            ExpansionTile(
              tilePadding: const EdgeInsets.only(right: 10),
              iconColor: Colors.black,
              collapsedIconColor: Colors.black,
              initiallyExpanded: job,
              controller: expansionTileController,
              title: Text(
                'Hometown',
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).width * 0.8,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        for (var job in jobs)
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(job[0]),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Checkbox(
                                value: job[1],
                                onChanged: (bool? change) {
                                  setState(() {
                                    // eth[1] = !eth
                                  });
                                },
                                activeColor: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Divider(
            //   color: job ? Colors.grey : Colors.transparent,
            //   thickness: 1,
            // ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, LandingScreen.id);
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Previous',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, LandingScreen.id);
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    width: 160,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
