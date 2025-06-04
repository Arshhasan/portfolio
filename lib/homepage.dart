import 'package:flutter/material.dart';
import 'package:portfolio/widgets/footer.dart';
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
        toolbarHeight: 70,
        titleSpacing: 0.0,
        title: const Text(
          'that flutter guy',
          style: TextStyle(fontFamily: 'EduVICWANTHand', fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          ProjectCard(
                            title: 'title',
                            date: '3 June 2025',
                            description: 'description',
                            imageUrl:
                                'https://hips.hearstapps.com/hmg-prod/images/gettyimages-180680638-676f621f720bc.jpg',
                            link: 'https://flutter.dev',
                          ),
                          ProjectCard(
                            title: 'Slap your Ex',
                            date: '4 June 2025',
                            description:
                                'Ever feel like slapping your ex? Well, now you can — virtually! A cheeky and funny app to let out your frustration with playful slap animations. No harm done, just laughs guaranteed!',
                            imageUrl:
                                'https://i.ibb.co/G407vRzc/slapping-image.jpg',
                            link: 'https://one-snowy-tau.vercel.app/',
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    NealFooter(), // footer as part of scroll
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
