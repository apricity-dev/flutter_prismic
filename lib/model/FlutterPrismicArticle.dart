import 'package:json_annotation/json_annotation.dart';

part 'FlutterPrismicArticle.g.dart';

@JsonSerializable()
class FlutterPrismicArticle {
  final String? id;
  final FlutterPrismicArticleData? data;

  FlutterPrismicArticle(this.id, this.data);

  factory FlutterPrismicArticle.fromJson(Map<String, dynamic> json) =>
      _$FlutterPrismicArticleFromJson(json);
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'data': data!.toJson()};
}

@JsonSerializable()
class FlutterPrismicArticleData {
  final List<FlutterPrismicItemFormat>? title;
  final List<FlutterPrismicItemFormat>? content;
  final String? url;

  FlutterPrismicArticleData(this.title, this.content, this.url);

  factory FlutterPrismicArticleData.fromJson(Map<String, dynamic> json) =>
      _$FlutterPrismicArticleDataFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title':
            title != null ? title!.map((item) => item.toJson()).toList() : null,
        'content': content != null
            ? content!.map((item) => item.toJson()).toList()
            : null,
        'url': url
      };
}

@JsonSerializable()
class FlutterPrismicItemFormat {
  final String? type;
  final String? text;
  final List<FlutterPrismicSpan> spans;

  FlutterPrismicItemFormat(this.type, this.text, this.spans);

  factory FlutterPrismicItemFormat.fromJson(Map<String, dynamic> json) =>
      _$FlutterPrismicItemFormatFromJson(json);
  Map<String, dynamic> toJson() => _$FlutterPrismicItemFormatToJson(this);
}

@JsonSerializable()
class FlutterPrismicSpan {
  final int? start;
  final int? end;
  final String? type;
  final Map<String, dynamic>? data;

  FlutterPrismicSpan(this.start, this.end, this.type, this.data);

  factory FlutterPrismicSpan.fromJson(Map<String, dynamic> json) =>
      _$FlutterPrismicSpanFromJson(json);
  Map<String, dynamic> toJson() => _$FlutterPrismicSpanToJson(this);
}
