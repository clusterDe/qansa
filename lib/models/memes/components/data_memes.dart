import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'memes.dart';

class DataMemes {
  List<Memes>? memes;

  DataMemes({this.memes});

  DataMemes copyWith({List<Memes>? memes}) {
    return DataMemes(memes: memes ?? this.memes);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'memes': memes?.map((x) => x.toMap()).toList()};
  }

  factory DataMemes.fromMap(Map<String, dynamic> map) {
    return DataMemes(
      memes: map['memes'] != null
          ? List<Memes>.from(
              (map['memes'] as List<dynamic>).map<Memes?>(
                (x) => Memes.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataMemes.fromJson(String source) =>
      DataMemes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DataMemes(memes: $memes)';

  @override
  bool operator ==(covariant DataMemes other) {
    if (identical(this, other)) return true;

    return listEquals(other.memes, memes);
  }

  @override
  int get hashCode => memes.hashCode;
}
