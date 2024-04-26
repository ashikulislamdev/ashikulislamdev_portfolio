import 'package:ashikulislamdev/data/constant.dart';
import 'package:flutter/material.dart';
import 'type_write_widget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);
    
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.4,
          image: AssetImage('assets/images/flutter-bg.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
          if(isMobile)
            // Container(
            //   width: dSize.width * 0.5,
            //   height: dSize.height * 0.3,
            //   decoration: const BoxDecoration(
            //     border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
            //     borderRadius: BorderRadius.all(Radius.circular(50)),
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/Sized_picture.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(120)),
              ),
              child: const CircleAvatar(
                radius: 120,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/ashikulislam.png'),
              ),
            ),

            SizedBox(height: dSize.height * 0.025),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: !isMobile ? dSize.width * 0.35 : dSize.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TypeWriteWidget(),
                    SizedBox(height: dSize.height * 0.009),
                    Text(
                      'I\'m a passionate flutter developer, and I\'m very dedicated to my work.', 
                      textAlign: TextAlign.center,  
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.clip
                      ),
                    ),
                    SizedBox(height: dSize.height * 0.009),
                    //social media links 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.email_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const ImageIcon(AssetImage('assets/icons/linkedin.png')),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const ImageIcon(AssetImage('assets/icons/twitter.png')),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const ImageIcon(AssetImage('assets/icons/github.png')),
                          onPressed: () {},
                        ),
                      ],
                    )
                    // hire me
                  ],
                ),
              ),
              
              // self photo
              if (!isMobile)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(120)),
                  ),
                  child: const CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/ashikulislam.png'),
                  ),
                ),
          
            ],
          ),
        ],
      ),
    );
  }
}
