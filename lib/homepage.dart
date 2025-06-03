import 'package:flutter/material.dart';
import 'package:portfolio/widgets/project_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'that flutter guy',
          style: TextStyle(fontFamily: 'EduVICWANTHand', fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                ProjectCard(
                  title: 'title',
                  date: '3 June 2025',
                  description: 'description',
                  imageUrl:
                      'https://hips.hearstapps.com/hmg-prod/images/gettyimages-180680638-676f621f720bc.jpg',
                  link: 'https://flutter.dev',
 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
