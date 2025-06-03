import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher_web/url_launcher_web.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final String imageUrl;
  final String link;

  const ProjectCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.imageUrl,
    required this.link,
  });

  void _launchLink(BuildContext context) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      final success = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!success) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not launch the link')));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid URL: $link')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchLink(context),
      child: Container(
        width: 400,
        margin: EdgeInsets.all(50),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.network(imageUrl, fit: BoxFit.cover, height: 150),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
