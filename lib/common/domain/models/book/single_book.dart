import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:lisa_app/common/domain/models/book/single_volume_info.dart';

part 'single_book.freezed.dart';
part 'single_book.g.dart';

@freezed
class SingleBook with _$SingleBook {
  const factory SingleBook({
    @Default('')
        String kind,
    @Default('')
        String id,
    @JsonKey(
      fromJson: SingleBook._singleVolumeInfoFromJson,
      toJson: SingleBook._singleVolumeInfoToJson,
    )
        SingleVolumeInfo? volumeInfo,
  }) = _SingleBook;

  static SingleVolumeInfo? _singleVolumeInfoFromJson(
      Map<String, dynamic>? json) {
    if (json == null) return null;

    return SingleVolumeInfo.fromJson(json);
  }

  static Map<String, dynamic>? _singleVolumeInfoToJson(
      SingleVolumeInfo? volumeInfo) {
    if (volumeInfo == null) return null;

    return volumeInfo.toJson();
  }

  factory SingleBook.fromJson(Map<String, dynamic> json) =>
      _$SingleBookFromJson(json);
}
