import 'package:dating_app/features/landing/landing_screen.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/big_text.dart';
import '../../constants/image_paths.dart';
import 'setup_screen.dart';

class SetupMusicPage extends StatefulWidget {
  static String id = 'SetupMusicPage';
  const SetupMusicPage({Key? key}) : super(key: key);

  @override
  _SetupMusicPageState createState() => _SetupMusicPageState();
}

class _SetupMusicPageState extends State<SetupMusicPage> {
  TextEditingController artistController = TextEditingController();
  TextEditingController albumController = TextEditingController();
  TextEditingController playlistController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BigText(
                  text: 'Music',
                  orangeBackground: false,
                  fontSize: 40,
                  width: MediaQuery.sizeOf(context).width * 0.75,
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
              'Your favourite music?',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Playlist Link'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(195, 195, 195, 0.27),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: playlistController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Favorite Artist'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(195, 195, 195, 0.27),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: artistController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Favorite Song'),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(195, 195, 195, 0.27),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: artistController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const Expanded(child: SizedBox(height: 20)),
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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
