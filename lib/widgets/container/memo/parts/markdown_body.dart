import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../component/memo/parts/markdown_builder/header.dart';

class MarkdownBodyHeaderCopiableContainer extends StatefulWidget {
  final String content;
  final Function(String) onCopyRequested;

  const MarkdownBodyHeaderCopiableContainer({
    Key? key,
    required this.content,
    required this.onCopyRequested,
  }) : super(key: key);

  @override
  _HeadersState createState() => _HeadersState();
}

class _HeadersState extends State<MarkdownBodyHeaderCopiableContainer> {
  final List<dynamic> _headers = [];

  int add(String tag, String textContent) {
    final occurrence = _headers.where(
            (h) => h["tag"] == tag
            && h["text"] == textContent).length;
    _headers.add({
      "tag": tag,
      "occurrence": occurrence,
      "text": textContent,
    });

    return occurrence;
  }

  void clear() {
    _headers.clear();
  }

  @override
  Widget build(BuildContext context) {
    final content = widget.content;
    final _onCopyRequested = widget.onCopyRequested;
    return MarkdownBody(
      data: widget.content,
      onTapLink: (_, url, __){
        if (url != null) {
          final uri = Uri.parse(url);
          launchUrl(uri);
        }
      },
      builders: {
        'h1': CustomHeader1Builder(content: content, onHeaderFound: add, onCopyRequested: _onCopyRequested),
        'h2': CustomHeader2Builder(content: content, onHeaderFound: add, onCopyRequested: _onCopyRequested),
        'h3': CustomHeader3Builder(content: content, onHeaderFound: add, onCopyRequested: _onCopyRequested),
        'h4': CustomHeader4Builder(content: content, onHeaderFound: add, onCopyRequested: _onCopyRequested),
        'h5': CustomHeader5Builder(content: content, onHeaderFound: add, onCopyRequested: _onCopyRequested),
        'h6': CustomHeader6Builder(content: content, onHeaderFound: add, onCopyRequested: _onCopyRequested)
      },
    );
  }
}
