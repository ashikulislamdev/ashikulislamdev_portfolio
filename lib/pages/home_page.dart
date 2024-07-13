import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/pages/about_page.dart';
import 'package:ashikulislamdev/pages/contact_page.dart';
import 'package:ashikulislamdev/pages/projects.dart';
import 'package:ashikulislamdev/pages/services_page.dart';
import 'package:ashikulislamdev/pages/skills_page.dart';
import 'package:ashikulislamdev/providers/menu_provider.dart';
import 'package:ashikulislamdev/providers/slide_animation.dart';
import 'package:ashikulislamdev/widgets/home_body.dart';
import 'package:ashikulislamdev/widgets/right_sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndexProvider = Provider.of<SelectedIndexProvider>(context);
    final int selectedIndex = selectedIndexProvider.selectedIndex;

    // logic to show the body based on selected index from right sidebar
    Widget bodyWidget; 
    switch (selectedIndex) {
      case 0:
        bodyWidget = const SlideAnimation(slideDirection: SlideDirection.topLeftIn, child: HomePageBody());
        break;
      case 1:
        bodyWidget = const SlideAnimation(slideDirection: SlideDirection.topRightIn, child: AboutScreen());
        break;
      case 2:
        bodyWidget = const SlideAnimation(slideDirection: SlideDirection.bottomRightIn, child: SkillsScreen());
        break;
      case 3:
        bodyWidget = const SlideAnimation(slideDirection: SlideDirection.bottomLeftIn, child: ServicesScreen());
        break;
      case 4:
        bodyWidget = const SlideAnimation(slideDirection: SlideDirection.leftIn, child: ProjectScreen());
        break;
      case 5:
        bodyWidget = const SlideAnimation(slideDirection: SlideDirection.rightIn, child: ContactScreen());
        break;
      default:
        bodyWidget = const HomePageBody();
    }

    final isDesktop = Responsive.isDesktop(context);
    final dSize = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      key: scaffoldKey,
      drawer: !isDesktop
          ? SizedBox(
              width: Responsive.isMobile(context) ? dSize.width * 0.4 : dSize.width * 0.3,
              child: const RightSideBar(),
            )
          : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey.shade900,
              Colors.blueGrey.shade800,
              Colors.blueGrey.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            
            Row(
              children: [
                // right side bar
                if (isDesktop)
                  const Expanded(
                    flex: 3,
                    child: RightSideBar(),
                  ),
                // main content area
                Expanded(
                  flex: 8,
                  child: bodyWidget,
                ),
              ],
            ),
            // drawer icon if not desktop
            if (!isDesktop)
              Positioned(
                top: 10,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
