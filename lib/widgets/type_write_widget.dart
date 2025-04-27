import 'package:flutter/material.dart';

class TypeWriteWidget extends StatefulWidget {
  const TypeWriteWidget({
    super.key,
  });


  @override
  State<TypeWriteWidget> createState() => _TypeWriteWidgetState();
}

class _TypeWriteWidgetState extends State<TypeWriteWidget> with SingleTickerProviderStateMixin{

  // final typingText = "I am a Flutter Developer";
  final List<String> typingTextList = ["Mobile App Developer", "Web Developer", "Flutter Developer", "Backend Developer"];
  int currentIndex = 0;
  late AnimationController animationController;
  late Animation<int> typingTextAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    typingTextAnimation = IntTween(
      begin: 0, 
      end: typingTextList[currentIndex].length).animate(animationController);

      animationController.forward();
      // animationController.repeat(reverse: true);

      animationController.addListener(() {
        if (animationController.status == AnimationStatus.completed) {
          setState(() {
            currentIndex = (currentIndex + 1) % typingTextList.length;
            typingTextAnimation = IntTween(
              begin: 0, 
              end: typingTextList[currentIndex].length).animate(animationController);
            animationController.forward(from: 0);
          });
        }
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: typingTextAnimation, 
      builder: (BuildContext context, child){
        return Text(
          'I am a ${typingTextList[currentIndex].substring(0, typingTextAnimation.value)}_',
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize! * 0.7,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        );
      },
    );
  }
}