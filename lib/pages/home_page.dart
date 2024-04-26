import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/widgets/home_body.dart';
import 'package:ashikulislamdev/widgets/right_sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
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
              const Expanded(
                flex: 8,
                child: HomePageBody(),
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
    );
  }
}
