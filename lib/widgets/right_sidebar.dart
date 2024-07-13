import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/data/side_menu_data.dart';
import 'package:ashikulislamdev/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RightSideBar extends StatefulWidget {
  const RightSideBar({super.key});

  @override
  State<RightSideBar> createState() => _RightSideBarState();
}

class _RightSideBarState extends State<RightSideBar> {
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/gdg_hangzhou_pc.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            
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
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);
    final isSelected = selectedIndexProvider.selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          selectedIndexProvider.selectedIndexValue(index);
          // debugPrint('Selected Index: ${selectedIndexProvider.selectedIndex}');
        },
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
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
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