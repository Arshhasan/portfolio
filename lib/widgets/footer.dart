import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NealFooter extends StatelessWidget {
  const NealFooter({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
    Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'arshhasan2016@gmail.com',
      query: 'subject=Hello Arsh',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      // Optionally show a snackbar or error
      debugPrint('Could not launch email client.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity, // 👈 makes it full-width

      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          const Text(
            "Hi! I'm Arsh. This is where I make stuff on the web. Obligatory links:",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          /// Icon Buttons Row
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 10,
            children: [
              _iconButton(
                icon: FontAwesomeIcons.instagram,
                text: "Instagram",
                url: "https://www.instagram.com/arsh.cpp/",
                backgroundColor: const Color(0xFFFFF7E6),
              ),
              _iconButton(
                icon: FontAwesomeIcons.twitter,
                text: "Twitter",
                url: "https://x.com/ArshCe21",
                backgroundColor: const Color(0xFFE8F5FD),
              ),
              _iconButton(
                icon: FontAwesomeIcons.mugHot,
                text: "Buy me a coffee",
                url: "https://buymeacoffee.com/yourname",
                backgroundColor: const Color(0xFFFFF6C4),
              ),
            ],
          ),

          const SizedBox(height: 24),
          // const Text("Say hello: arshhasan2016@gmail.com", style: TextStyle(fontSize: 15)),
          GestureDetector(
            onTap: _launchEmail,
            child: const Text(
              "Say hello: arshhasan2016@gmail.com",
              style: TextStyle(
                fontSize: 15,
                // color: Colors.blue,

              ),
            ),            
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _launchURL("https://example.com/privacy"),
            child: const Text(
              "Privacy policy",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required String text,
    required String url,
    required Color backgroundColor,
  }) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: const BorderSide(color: Colors.black12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () => _launchURL(url),
      icon: Icon(icon, size: 18, color: Colors.black87),
      label: Text(text, style: const TextStyle(color: Colors.black87)),
    );
  }
}
