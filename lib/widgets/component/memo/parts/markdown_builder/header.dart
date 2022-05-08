import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

import '../../../../../libs/id_generator/id_generator.dart';

class Header extends StatelessWidget {
  final String text;
  final String content;
  final int level;
  final int occurrence;
  final Function(String headerId) onCopyRequested;
  const Header({
    Key? key,
    required this.text,
    required this.level,
    required this.occurrence,
    required this.content,
    required this.onCopyRequested
  }) : super(key: key);

  String? _extractCopyText() {
    final start = (() {
      int currentStart = 0;
      int currentOccurrence = 0;
      while(currentStart >= 0 && currentOccurrence <= occurrence) {
        currentStart = content.indexOf(RegExp("\n{0,}#{$level} $text"), currentStart);
        if (currentOccurrence == occurrence) {
          break;
        }
        currentOccurrence++;
        currentStart += level;
      }
      return currentStart;
    })();
    final end = content.indexOf(RegExp("(\n{1,})#{1,$level} "), start + level);
    if (start >= 0) {
      final text = (() {
        if (end >= 0) {
          return content.substring(start, end);
        } else {
          return content.substring(start);
        }
      })();
      return text.replaceAll(RegExp("^\n{0,}"), "");
    }
    return null;
  }

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
    const copyButtonPaddingInset = EdgeInsets.all(16);
    return Row(
      key: Key(headerId),
      children: [
        Flexible(child:
          Text(
            text,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.clip,
          )
        ),
        const Padding(padding: copyButtonPaddingInset),
        IconButton(
          onPressed: () {
            final copyText = _extractCopyText();
            if (copyText != null) {
              onCopyRequested(copyText);
            }
          },
          icon: const Icon(Icons.copy)
        )
      ],
    );
  }
}

class CustomHeaderBuilder extends MarkdownElementBuilder {
  final int Function(String tag, String text) onHeaderFound;
  final Function(String) onCopyRequested;
  final String content;
  int occurrence = 0;
  int level = 1;

  CustomHeaderBuilder({
    required this.content,
    required this.onHeaderFound,
    required this.onCopyRequested
  });

  @override
  void visitElementBefore(md.Element element) {
    super.visitElementBefore(element);

    occurrence = onHeaderFound(element.tag, element.textContent);
  }

  @override
  Widget visitText(md.Text text, TextStyle? preferredStyle) {
    return Header(
        text: text.text,
        content: content,
        occurrence: occurrence,
        level: level,
        onCopyRequested: onCopyRequested
    );
  }
}

class CustomHeader1Builder extends CustomHeaderBuilder {
  CustomHeader1Builder({onCopyRequested, onHeaderFound, content}): super(
    content: content,
    onHeaderFound: onHeaderFound,
    onCopyRequested: onCopyRequested,
  ) {
    level = 1;
  }
}

class CustomHeader2Builder extends CustomHeaderBuilder {
  CustomHeader2Builder({onCopyRequested, onHeaderFound, content}): super(
    content: content,
    onHeaderFound: onHeaderFound,
    onCopyRequested: onCopyRequested,
  ) {
    level = 2;
  }
}

class CustomHeader3Builder extends CustomHeaderBuilder {
  CustomHeader3Builder({onCopyRequested, onHeaderFound, content}): super(
    content: content,
    onHeaderFound: onHeaderFound,
    onCopyRequested: onCopyRequested,
  ) {
    level = 3;
  }
}
class CustomHeader4Builder extends CustomHeaderBuilder {
  CustomHeader4Builder({onCopyRequested, onHeaderFound, content}): super(
    content: content,
    onHeaderFound: onHeaderFound,
    onCopyRequested: onCopyRequested,
  ) {
    level = 4;
  }
}
class CustomHeader5Builder extends CustomHeaderBuilder {
  CustomHeader5Builder({onCopyRequested, onHeaderFound, content}): super(
    content: content,
    onHeaderFound: onHeaderFound,
    onCopyRequested: onCopyRequested,
  )  {
    level = 5;
  }
}
class CustomHeader6Builder extends CustomHeaderBuilder {
  CustomHeader6Builder({onCopyRequested, onHeaderFound, content}): super(
    content: content,
    onHeaderFound: onHeaderFound,
    onCopyRequested: onCopyRequested,
  ) {
    level = 6;
  }
}