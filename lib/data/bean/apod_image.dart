import 'package:json_annotation/json_annotation.dart';

part 'apod_image.g.dart';

@JsonSerializable()
class ApodImage {
  final String date;
  final String title;
  final String explanation;
  final String url;
  @JsonKey(name: 'media_type')
  final String mediaType;
  @JsonKey(name: 'service_version')
  final String serviceVersion;
  @JsonKey(name: 'thumbs')
  final String? thumbs;
  @JsonKey(name: 'hdurl')
  final String? hdUrl;
  //注意copyright hdUrl thumbs由api返回的信息可能是null的，必须处理，否则在NasaRequestManager中请求返回的data直接为null
  final String? copyright;

  const ApodImage(
      this.date,
      this.title,
      this.explanation,
      this.url,
      this.mediaType,
      this.serviceVersion,
      this.thumbs,
      this.hdUrl,
      this.copyright);

  factory ApodImage.fromJson(Map<String, dynamic> json) =>
      _$ApodImageFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ApodImageToJson(this);
  }
}
