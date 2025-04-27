import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/widgets/common/bg_container.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'type_write_widget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);
    
    void sendEmail(){
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'ashikulislamsawan@gmail.com',
        queryParameters: {
            'subject': 'I would like to discuss a project with you.',
            'body': 'Hello, Ashikul Islam',
        },
      );
      launchUrl(emailLaunchUri);
    }

    return BackgroundContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
          if(isMobile)
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
                      // 'I\'m a passionate flutter developer, and I\'m very dedicated to my work.', 
                      "Over 5 years of IT industry experience, including two and half years in Flutter application development, with a solid academic foundation in Computer Science. Skilled in all stages of the development cycle for both dynamic and static projects. Currently focusing on ML & AI, with hands-on experience developing intelligent & impactful solutions.",
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
                          onPressed: () {
                            sendEmail();
                          },
                        ),
                        IconButton(
                          icon: const ImageIcon(AssetImage('assets/icons/linkedin.png')),
                          onPressed: () {
                            launchUrl(Uri.parse('https://www.linkedin.com/in/ashikulislamdev/'));
                          },
                        ),
                        IconButton(
                          icon: const ImageIcon(AssetImage('assets/icons/twitter.png')),
                          onPressed: () {
                            launchUrl(Uri.parse('https://x.com/ashikulislamdev'));
                          },
                        ),
                        IconButton(
                          icon: const ImageIcon(AssetImage('assets/icons/github.png')),
                          onPressed: () {
                            launchUrl(Uri.parse('https://github.com/ashikulislamdev'));
                          },
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
