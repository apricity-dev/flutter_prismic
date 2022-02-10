// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PrismicData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrismicArticle _$PrismicArticleFromJson(Map<String, dynamic> json) =>
    PrismicArticle(
      json['id'] as String?,
      json['data'] == null
          ? null
          : PrismicArticleData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrismicArticleToJson(PrismicArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data,
    };

PrismicArticleData _$PrismicArticleDataFromJson(Map<String, dynamic> json) =>
    PrismicArticleData(
      (json['title'] as List<dynamic>?)
          ?.map((e) => PrismicItemFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['content'] as List<dynamic>?)
          ?.map((e) => PrismicItemFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['url'] as String?,
    );

Map<String, dynamic> _$PrismicArticleDataToJson(PrismicArticleData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'url': instance.url,
    };

PrismicItemFormat _$PrismicItemFormatFromJson(Map<String, dynamic> json) =>
    PrismicItemFormat(
      json['type'] as String?,
      json['text'] as String?,
      (json['spans'] as List<dynamic>)
          .map((e) => PrismicSpan.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PrismicItemFormatToJson(PrismicItemFormat instance) =>
    <String, dynamic>{
      'type': instance.type,
      'text': instance.text,
      'spans': instance.spans,
    };

PrismicSpan _$PrismicSpanFromJson(Map<String, dynamic> json) => PrismicSpan(
      json['start'] as int?,
      json['end'] as int?,
      json['type'] as String?,
      json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PrismicSpanToJson(PrismicSpan instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'type': instance.type,
      'data': instance.data,
    };
