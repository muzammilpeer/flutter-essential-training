import 'package:json_annotation/json_annotation.dart';

part 'attachment_image_model.g.dart';

@JsonSerializable()
class PixelAttachmentImageModel {
  String id;
  String? author;

  @JsonKey(name: 'download_url')
  String urlFullSize;

  PixelAttachmentImageModel({
    required this.id,
    this.author,
    required this.urlFullSize,
  });

  factory PixelAttachmentImageModel.fromJson(Map<String, dynamic> json) =>
      _$PixelAttachmentImageModelFromJson(json);
}
