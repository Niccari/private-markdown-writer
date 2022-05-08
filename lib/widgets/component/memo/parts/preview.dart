import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewWidget extends StatelessWidget {
  const PreviewWidget({
    required this.title,
    required this.content,
    Key? key
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    const externalPaddingInset = EdgeInsets.all(8);
    const internalPaddingInset = EdgeInsets.all(10);
    const titleTextStyle = TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 24
    );
    return SingleChildScrollView(
      child: Padding(
        padding: externalPaddingInset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleTextStyle,
            ),
            const Padding(padding: internalPaddingInset),
            MarkdownBody(
              data: content,
              onTapLink: (_, url, __){
                if (url != null) {
                  final uri = Uri.parse(url);
                  launchUrl(uri);
                }
              },
            )
          ],
        )
      )
    );
  }
}
