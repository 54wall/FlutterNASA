// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApodImage _$ApodImageFromJson(Map<String, dynamic> json) => ApodImage(
      date: json['date'] as String,
      title: json['title'] as String,
      explanation: json['explanation'] as String,
      url: json['url'] as String,
      mediaType: json['media_type'] as String,
      serviceVersion: json['service_version'] as String,
      thumbs: json['thumbs'] as String?,
      hdUrl: json['hdurl'] as String?,
      copyright: json['copyright'] as String?,
    );

Map<String, dynamic> _$ApodImageToJson(ApodImage instance) => <String, dynamic>{
      'date': instance.date,
      'title': instance.title,
      'explanation': instance.explanation,
      'url': instance.url,
      'media_type': instance.mediaType,
      'service_version': instance.serviceVersion,
      'thumbs': instance.thumbs,
      'hdurl': instance.hdUrl,
      'copyright': instance.copyright,
    };
