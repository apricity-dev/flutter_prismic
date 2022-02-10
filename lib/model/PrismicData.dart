import 'package:json_annotation/json_annotation.dart';

part 'PrismicData.g.dart';

@JsonSerializable()
class PrismicArticle {
  final String? id;
  final PrismicArticleData? data;

  PrismicArticle(this.id, this.data);

  factory PrismicArticle.fromJson(Map<String, dynamic> json) =>
      _$PrismicArticleFromJson(json);
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'data': data!.toJson()};
}

@JsonSerializable()
class PrismicArticleData {
  final List<PrismicItemFormat>? title;
  final List<PrismicItemFormat>? content;
  final String? url;

  PrismicArticleData(this.title, this.content, this.url);

  factory PrismicArticleData.fromJson(Map<String, dynamic> json) =>
      _$PrismicArticleDataFromJson(json);
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
class PrismicItemFormat {
  final String? type;
  final String? text;
  final List<PrismicSpan> spans;

  PrismicItemFormat(this.type, this.text, this.spans);

  factory PrismicItemFormat.fromJson(Map<String, dynamic> json) =>
      _$PrismicItemFormatFromJson(json);
  Map<String, dynamic> toJson() => _$PrismicItemFormatToJson(this);
}

@JsonSerializable()
class PrismicSpan {
  final int? start;
  final int? end;
  final String? type;
  final Map<String, dynamic>? data;

  PrismicSpan(this.start, this.end, this.type, this.data);

  factory PrismicSpan.fromJson(Map<String, dynamic> json) =>
      _$PrismicSpanFromJson(json);
  Map<String, dynamic> toJson() => _$PrismicSpanToJson(this);
}
