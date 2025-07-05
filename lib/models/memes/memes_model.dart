import 'dart:convert';

import 'components/data_memes.dart';

class MemesModel {
  bool? success;
  String? errorMessage;
  DataMemes? data;

  MemesModel({this.success, this.errorMessage, this.data});

  MemesModel copyWith({bool? success, String? errorMessage, DataMemes? data}) {
    return MemesModel(
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'error_message': errorMessage,
      'data': data?.toMap(),
    };
  }

  factory MemesModel.fromMap(Map<String, dynamic> map) {
    return MemesModel(
      success: map['success'] != null ? map['success'] as bool : null,
      errorMessage: map['error_message'] != null
          ? map['error_message'] as String
          : null,
      data: map['data'] != null
          ? DataMemes.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemesModel.fromJson(String source) =>
      MemesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MemesModel(success: $success, error_message: $errorMessage, data: $data)';

  @override
  bool operator ==(covariant MemesModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.errorMessage == errorMessage &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ errorMessage.hashCode ^ data.hashCode;
}
