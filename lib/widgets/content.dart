import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:url_launcher/url_launcher.dart';

class Content extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isOwn;
  final TextStyle? style;
  final int? numberOfLines;
  final TextAlign alignment;

  const Content({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.isOwn = false,
    this.style,
    this.numberOfLines,
    this.alignment = TextAlign.start,
  });

  void handleUrlPress(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void handlePhonePress(String phone) async {
    final phoneUrl = 'tel:$phone';
    if (await canLaunchUrl(Uri.parse(phoneUrl))) {
      await launchUrl(Uri.parse(phoneUrl));
    }
  }

  void handleEmailPress(String email) async {
    final emailUrl = 'mailto:$email';
    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      await launchUrl(Uri.parse(emailUrl));
    }
  }

  Map<String, String> stripBorder(String matchingString) {
    return {
      'display': matchingString.substring(1, matchingString.length - 1),
      'value': matchingString.substring(1, matchingString.length - 1),
    };
  }

  String renderItalic(String matchingString) {
    return matchingString.substring(1, matchingString.length - 2);
  }

  String renderStrikeThrough(String matchingString) {
    return matchingString.substring(1, matchingString.length - 2);
  }

  Map<String, String> renderQuote(String matchingString) {
    return {
      'display': matchingString.substring(2),
      'value': matchingString.substring(2),
    };
  }

  @override
  Widget build(BuildContext context) {
    final s = Theme.of(context).textTheme.bodyMedium?.copyWith(
      // color: isOwn ? Colors.white : Colors.black,
      fontSize: fontSize,
      height: 1.5,
    );

    return ParsedText(
      style: style?.merge(s) ?? s,
      text: text,
      parse: <MatchText>[
        MatchText(
          type: ParsedType.URL,
          style: const TextStyle(decoration: TextDecoration.underline),
          onTap: handleUrlPress,
        ),
        MatchText(
          type: ParsedType.PHONE,
          style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          onTap: handlePhonePress,
        ),
        MatchText(
          type: ParsedType.EMAIL,
          style: const TextStyle(decoration: TextDecoration.underline),
          onTap: handleEmailPress,
        ),
        MatchText(
          pattern: r'\$[^$]+\$',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize + 4),
          renderText: ({required String str, required String pattern}) => stripBorder(str),
        ),
        MatchText(
          pattern: r'(\*\*)[^*]+(\*\*)',
          style: const TextStyle(fontWeight: FontWeight.bold),
          renderText: ({required String str, required String pattern}) => stripBorder(str),
        ),
        MatchText(
          pattern: r'_[^_]+_',
          style: TextStyle(fontStyle: FontStyle.italic),
          renderText: ({required String str, required String pattern}) => stripBorder(str),
        ),
        MatchText(
          pattern: r'~[^~]+~',
          style: TextStyle(decoration: TextDecoration.lineThrough),
          renderText: ({required String str, required String pattern}) => stripBorder(str),
        ),
        MatchText(
          pattern: r'> .+\n?',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            backgroundColor: Colors.grey,
            // borderRadius: BorderRadius.circular(4),
            // padding: EdgeInsets.all(10),
          ),
          renderText: ({required String str, required String pattern}) => renderQuote(str),
        ),
      ],
      maxLines: numberOfLines,
      alignment: alignment,
    );
  }
}