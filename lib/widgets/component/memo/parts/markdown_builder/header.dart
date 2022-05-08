import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class Header extends StatelessWidget {
  final String text;
  final int level;

  const Header({
    Key? key,
    required this.text,
    required this.level
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = (() {
      switch(level) {
        case 1: return 20.0;
        case 2: return 18.0;
        case 3: return 16.0;
        case 4: return 14.0;
        case 5: return 13.0;
        case 6: return 12.0;
        default: return 12.0;
      }
    })();
    return Row(
      children: [
        Expanded(
          child: SelectableText.rich(
            TextSpan(
              text: text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold
               )
            ),
          ),
        ),
        IconButton(
          onPressed: () => {/* copy to clipboard*/},
          icon: const Icon(Icons.copy)
        )
      ],
    );
  }
}

class CustomHeader1Builder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Header(text: text.text, level: 1);
  }
}