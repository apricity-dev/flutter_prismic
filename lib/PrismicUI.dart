import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prismic/model/FlutterPrismicArticle.dart';
import 'package:flutter_prismic/widget/BulletWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class PrismicUI {
  final FlutterPrismicArticleData data;
  final BuildContext context;

  PrismicUI(this.context, this.data);

  // GlabalKeys are used to scroll to a specific widget on the screen
  final Map<String, GlobalKey> keyList = {};

  // Store current order list number
  final List<int> orderedListFields = [];

  List<Widget> buildContent() {
    if (data.content == null) {
      return [];
    }

    List<Widget> content = [const SizedBox(height: 16)];

    for (var i = 0; i < data.content!.length; i++) {
      content.add(Column(children: [
        buildText(data.content![i]),
        const SizedBox(height: 20),
      ]));
    }

    return content;
  }

  Widget buildText(FlutterPrismicItemFormat item) {
    if (item.type == "o-list-item") {
      orderedListFields.add(orderedListFields.length + 1);
    } else {
      orderedListFields.clear();
    }

    if (item.spans.isNotEmpty) {
      return _buildTextSpans(item);
    }

    // Detect if item is a point to srcoll to
    if (item.text!.contains(RegExp(r"<[^>]*>"))) {
      return _buildPointScrollTo(item);
    }

    return _buildSimpleText(item);
  }

  Widget _buildSimpleText(FlutterPrismicItemFormat item) {
    switch (item.type) {
      case "heading1":
        return Text(item.text!, style: Theme.of(context).textTheme.subtitle1);
      case "paragraph":
        return Text(item.text!, style: Theme.of(context).textTheme.bodyText2);
      case "heading2":
        return Text(item.text!, style: Theme.of(context).textTheme.subtitle1);
      case "list-item":
        return buildListItem(
            Text(item.text!, style: Theme.of(context).textTheme.bodyText2));
      case "heading4":
        return Text(item.text!);
      case "preformatted":
        return Text(
          item.text!,
          style: Theme.of(context).textTheme.bodyText2,
        );
      default:
        return Text(
          item.text!,
          style: Theme.of(context).textTheme.bodyText2,
        );
    }
  }

  Container _buildPointScrollTo(FlutterPrismicItemFormat item) {
    // Get the point name
    RegExp re = RegExp("\"(.*?)\"");

    var match = re.firstMatch(item.text!);

    if (match != null) {
      final dataKey = GlobalKey();

      keyList.putIfAbsent(match.group(1)!, () => dataKey);

      return Container(key: dataKey);
    }

    return Container();
  }

  Widget buildListItem(Widget text) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 6, right: 8),
        child: BulletWidget(Colors.black),
      ),
      Expanded(child: text),
    ]);
  }

  Widget buildOrderedListItem(Widget text) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Text(
            orderedListFields[orderedListFields.length - 1].toString() + '.'),
      ),
      Expanded(child: text),
    ]);
  }

  TextSpan _buildLinkSpan(
      FlutterPrismicItemFormat item, FlutterPrismicSpan span) {
    final url = span.data!["url"] as String;
    final text = item.text!.substring(span.start!, span.end);
    final isInternalUrl = data.url != null && url.contains(data.url!);

    if (isInternalUrl) {
      RegExp re =
          RegExp("#([a-zA-Z0-9]+)", multiLine: true, caseSensitive: true);

      var match = re.firstMatch(url);
      if (match != null) {
        return TextSpan(
          text: text,
          style: const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () => Scrollable.ensureVisible(
                keyList[match.group(1)]!.currentContext!),
        );
      }
    }

    return TextSpan(
      text: text,
      style: const TextStyle(
          color: Colors.blue, decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()..onTap = () => launch(url),
    );
  }

  TextSpan _buildSpanBold(String text) {
    return TextSpan(
      style: const TextStyle(fontWeight: FontWeight.bold),
      text: text,
    );
  }

  Widget _buildTextSpans(FlutterPrismicItemFormat item) {
    List<TextSpan> textSpans = [];

    for (var i = 0; i < item.spans.length; i++) {
      if (i == 0) {
        _splitSpans(textSpans, item, 0, item.spans[i], i);
      } else {
        _splitSpans(textSpans, item, item.spans[i - 1].end!, item.spans[i], i);
      }
    }

    if (item.type == "list-item") {
      return buildListItem(
        RichText(
          text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: textSpans),
        ),
      );
    }
    if (item.type == "o-list-item") {
      return buildOrderedListItem(
        RichText(
          text: TextSpan(
              style: Theme.of(context).textTheme.bodyText2,
              children: textSpans),
        ),
      );
    }

    return RichText(
      text: TextSpan(
          style: Theme.of(context).textTheme.bodyText2, children: textSpans),
    );
  }

  void _splitSpans(List<TextSpan> textSpans, FlutterPrismicItemFormat item,
      int start, FlutterPrismicSpan span, int i) {
    start = span.start! < start ? span.start! : start;
    textSpans.add(TextSpan(text: item.text!.substring(start, span.start)));
    if (span.type == "hyperlink") {
      textSpans.add(_buildLinkSpan(item, span));
    } else {
      textSpans
          .add(_buildSpanBold(item.text!.substring(span.start!, span.end)));
    }
    if (item.spans.length == 1 || item.spans.length == i + 1) {
      textSpans.add(
          TextSpan(text: item.text!.substring(span.end!, item.text!.length)));
    }
  }
}
