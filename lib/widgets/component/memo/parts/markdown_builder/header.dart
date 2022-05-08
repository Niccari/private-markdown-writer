import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../../../libs/id_generator/id_generator.dart';

class Header extends StatelessWidget {
  final String text;
  final String content;
  final int level;
  final Function(String headerId) onCopyRequested;
  const Header({
    Key? key,
    required this.text,
    required this.level,
    required this.content,
    required this.onCopyRequested
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerId = idGenerator.generate();
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
      key: Key(headerId),
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold
            )
          ),
        ),
        IconButton(
          onPressed: () {
            // # FIXME(Niccari): should not be processed on widgets
            // # FIXME(Niccari): same header text won't processed.
            final start = content.indexOf(RegExp("\n{0,}#{$level} $text"));
            final end = content.indexOf(RegExp("(\n{1,})#{1,$level} "), start + level);
            if (start >= 0) {
              final text = (() {
                if (end >= 0) {
                  return content.substring(start, end - 1);
                } else {
                  return content.substring(start);
                }
              })();
              onCopyRequested(text.replaceAll(RegExp("^\n{0,}"), ""));
            }
          },
          icon: const Icon(Icons.copy)
        )
      ],
    );
  }
}

class CustomHeaderBuilder extends MarkdownElementBuilder {
  final Function(String) onCopyRequested;
  final String content;
  int level = 1;
  List<md.Node>? children;

  CustomHeaderBuilder({
    required this.content,
    required this.onCopyRequested
  });

  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Header(
        text: text.text,
        content: content,
        level: level,
        onCopyRequested: onCopyRequested
    );
  }
}

class CustomHeader1Builder extends CustomHeaderBuilder {
  CustomHeader1Builder({onCopyRequested, content}): super(
    content: content,
    onCopyRequested: onCopyRequested,
  ) {
    level = 1;
  }
}

class CustomHeader2Builder extends CustomHeaderBuilder {
  CustomHeader2Builder({onCopyRequested, content}): super(
    content: content,
    onCopyRequested: onCopyRequested,
  ) {
    level = 2;
  }
}

class CustomHeader3Builder extends CustomHeaderBuilder {
  CustomHeader3Builder({onCopyRequested, content}): super(
    content: content,
    onCopyRequested: onCopyRequested,
  ) {
    level = 3;
  }
}
class CustomHeader4Builder extends CustomHeaderBuilder {
  CustomHeader4Builder({onCopyRequested, content}): super(
    content: content,
    onCopyRequested: onCopyRequested,
  ) {
    level = 4;
  }
}
class CustomHeader5Builder extends CustomHeaderBuilder {
  CustomHeader5Builder({onCopyRequested, content}): super(
    content: content,
    onCopyRequested: onCopyRequested,
  )  {
    level = 5;
  }
}
class CustomHeader6Builder extends CustomHeaderBuilder {
  CustomHeader6Builder({onCopyRequested, content}): super(
    content: content,
    onCopyRequested: onCopyRequested,
  ) {
    level = 6;
  }
}