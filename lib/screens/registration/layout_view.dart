import 'package:flutter/material.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = "layout";

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/main_background.png"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("lang.islami"),
        ),
        body: screens[currentIndex], // depending on index
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/quran_icn.png",
                ),
              ),
              label: "lang.quran",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/hadeth_icn.png",
                ),
              ),
              label: "lang.hadeth",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/sebha_icn.png",
                ),
              ),
              label: "lang.tasbeh",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  "assets/images/radio_icn.png",
                ),
              ),
              label: "lang.radio",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label:" lang.settings",
            ),
          ],
        ),
      ),
    );
  }
}
