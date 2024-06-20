// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelAttachmentImageModel _$PixelAttachmentImageModelFromJson(
        Map<String, dynamic> json) =>
    PixelAttachmentImageModel(
      id: json['id'] as String,
      author: json['author'] as String?,
      urlFullSize: json['download_url'] as String,
    );

Map<String, dynamic> _$PixelAttachmentImageModelToJson(
        PixelAttachmentImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'download_url': instance.urlFullSize,
    };
