import 'package:ashikulislamdev/data/constant.dart';
import 'package:ashikulislamdev/widgets/common/bg_container.dart';
import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final isMobile = Responsive.isMobile(context);

    return BackgroundContainer(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 30, top: 12),
              child: Text(
                'My Skills',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: dSize.height * 0.05),
            SkillCategory(
              categoryTitle: 'Programming Languages',
              skills: [
                Skill(name: 'Dart', level: 0.9),
                Skill(name: 'Python', level: 0.8),
                Skill(name: 'PHP', level: 0.75),
                Skill(name: 'C/C++', level: 0.70),
              ],
            ),
            SizedBox(height: dSize.height * 0.05),
            SkillCategory(
              categoryTitle: 'Frameworks & Libraries',
              skills: [
                Skill(name: 'Flutter', level: 0.95),
                Skill(name: 'Bootstrap', level: 0.85),
                Skill(name: 'H5, CSS', level: 0.7),
              ],
            ),
            SizedBox(height: dSize.height * 0.05),
            SkillCategory(
              categoryTitle: 'Tools & Technologies',
              skills: [
                Skill(name: 'Git', level: 0.9),
                Skill(name: 'Firebase', level: 0.8),
                Skill(name: 'Unix', level: 0.6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCategory extends StatelessWidget {
  final String categoryTitle;
  final List<Skill> skills;

  const SkillCategory({
    Key? key,
    required this.categoryTitle,
    required this.skills,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryTitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        ...skills.map((skill) => SkillWidget(skill: skill)).toList(),
      ],
    );
  }
}

class Skill {
  final String name;
  final double level;

  Skill({required this.name, required this.level});
}

class SkillWidget extends StatelessWidget {
  final Skill skill;

  const SkillWidget({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            skill.name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(
              value: skill.level,
              backgroundColor: Colors.grey[200],
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}