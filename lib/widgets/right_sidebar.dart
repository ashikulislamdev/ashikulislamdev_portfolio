import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/data/side_menu_data.dart';
import 'package:flutter/material.dart';

class RightSideBar extends StatefulWidget {
  const RightSideBar({super.key});

  @override
  State<RightSideBar> createState() => _RightSideBarState();
}

class _RightSideBarState extends State<RightSideBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          // logo
          // Container(
          //   height: 320,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/ashikulislamdev-eagle.jpeg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child: const Center(child: Text("Asikul Islam"),),
          // ),
          Image.asset(
            'assets/images/ashikulislamdev-eagle.jpeg', fit: BoxFit.cover, width: double.infinity, height: 320,
          ),
          Container(
            color: const Color(0xFF171821),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.menu.length,
              itemBuilder: (context, index) => buildMenuEntry(data, index),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}