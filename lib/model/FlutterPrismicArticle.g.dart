// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlutterPrismicArticle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlutterPrismicArticle _$FlutterPrismicArticleFromJson(
        Map<String, dynamic> json) =>
    FlutterPrismicArticle(
      json['id'] as String?,
      json['data'] == null
          ? null
          : FlutterPrismicArticleData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlutterPrismicArticleToJson(
        FlutterPrismicArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
    };

FlutterPrismicArticleData _$FlutterPrismicArticleDataFromJson(
        Map<String, dynamic> json) =>
    FlutterPrismicArticleData(
      (json['title'] as List<dynamic>?)
          ?.map((e) =>
              FlutterPrismicItemFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['content'] as List<dynamic>?)
          ?.map((e) =>
              FlutterPrismicItemFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['url'] as String?,
    );

Map<String, dynamic> _$FlutterPrismicArticleDataToJson(
        FlutterPrismicArticleData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
    };

FlutterPrismicItemFormat _$FlutterPrismicItemFormatFromJson(
        Map<String, dynamic> json) =>
    FlutterPrismicItemFormat(
      json['type'] as String?,
      json['text'] as String?,
      (json['spans'] as List<dynamic>)
          .map((e) => FlutterPrismicSpan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlutterPrismicItemFormatToJson(
        FlutterPrismicItemFormat instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'spans': instance.spans,
    };

FlutterPrismicSpan _$FlutterPrismicSpanFromJson(Map<String, dynamic> json) =>
    FlutterPrismicSpan(
      json['start'] as int?,
      json['end'] as int?,
      json['type'] as String?,
      json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$FlutterPrismicSpanToJson(FlutterPrismicSpan instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'type': instance.type,
      'data': instance.data,
    };
