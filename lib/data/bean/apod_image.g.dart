// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apod_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApodImage _$ApodImageFromJson(Map<String, dynamic> json) => ApodImage(
      json['date'] as String,
      json['title'] as String,
      json['explanation'] as String,
      json['url'] as String,
      json['media_type'] as String,
      json['service_version'] as String,
      json['thumbs'] as String?,
      json['hdurl'] as String?,
      json['copyright'] as String?,
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
