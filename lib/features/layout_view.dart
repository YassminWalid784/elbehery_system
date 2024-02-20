// import 'package:elbehery_system/features/settings_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// class LayoutView extends StatelessWidget {
//   static const String routeName = "layout";
//
//   const LayoutView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     var mediaQuery = MediaQuery.of(context).size;
//     var theme = Theme.of(context);
//     var vm = Provider.of<SettingsProvider>(context);
//
//
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//       extendBody: true,
//       //body: vm.screens[vm.currentIndex],
//       bottomNavigationBar: BottomAppBar(
//         height: 70,
//         notchMargin: 10,
//         shape: const CircularNotchedRectangle(),
//         child: BottomNavigationBar(
//           currentIndex: vm.currentIndex,
//           onTap: vm.changeIndex,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.list_outlined),
//               label: "Tasks",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.settings_outlined),
//               label: "Settings",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }