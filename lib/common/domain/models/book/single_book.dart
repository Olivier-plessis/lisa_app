import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    @Default(false)
        bool isStarted,
    @Default(0)
        int numberOfPageRead,
    @TimestampOrNullConverter()
        DateTime? startedAt,
    @JsonKey(
      fromJson: SingleBook._singleVolumeInfoFromJson,
      toJson: SingleBook._singleVolumeInfoToJson,
    )
        SingleVolumeInfo? volumeInfo,
  }) = _SingleBook;

  factory SingleBook.fromJson(Map<String, dynamic> json) =>
      _$SingleBookFromJson(json);

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
}

class TimestampOrNullConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampOrNullConverter();

  @override
  DateTime? fromJson(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? date) =>
      date == null ? null : Timestamp.fromDate(date);
}
