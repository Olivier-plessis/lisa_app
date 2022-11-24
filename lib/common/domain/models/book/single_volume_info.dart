import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_volume_info.freezed.dart';
part 'single_volume_info.g.dart';

@freezed
class SingleVolumeInfo with _$SingleVolumeInfo {
  factory SingleVolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$SingleVolumeInfoFromJson(json);

  const factory SingleVolumeInfo({
    @Default('')
        String title,
    @Default('')
        String subtitle,
    @Default([])
        List<String> authors,
    @Default('')
        String publisher,
    @Default('')
        String publishedDate,
    @Default('')
        String description,
    @Default(0)
        int pageCount,
    @Default([])
        List<String> categories,
    @Default(0.0)
        double averageRating,
    @JsonKey(
      fromJson: SingleVolumeInfo._imageLinksFromJson,
      toJson: SingleVolumeInfo._imageLinksToJson,
    )
        ImageLinks? imageLinks,
  }) = _SingleVolumeInfo;

  static ImageLinks? _imageLinksFromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return ImageLinks.fromJson(json);
  }

  static Map<String, dynamic>? _imageLinksToJson(ImageLinks? imageLinks) {
    if (imageLinks == null) return null;

    return imageLinks.toJson();
  }
}

@freezed
class ImageLinks with _$ImageLinks {
  const factory ImageLinks({
    String? smallThumbnail,
    String? small,
    String? medium,
    String? large,
    String? extraLarge,
  }) = _ImageLinks;

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
