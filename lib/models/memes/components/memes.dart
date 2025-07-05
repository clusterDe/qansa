import 'dart:convert';

class Memes {
  String? id;
  String? name;
  String? url;
  int? width;
  int? height;
  int? boxCount;
  int? captions;

  Memes({
    this.id,
    this.name,
    this.url,
    this.width,
    this.height,
    this.boxCount,
    this.captions,
  });

  Memes copyWith({
    String? id,
    String? name,
    String? url,
    int? width,
    int? height,
    int? boxCount,
    int? captions,
  }) {
    return Memes(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      width: width ?? this.width,
      height: height ?? this.height,
      boxCount: boxCount ?? this.boxCount,
      captions: captions ?? this.captions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'url': url,
      'width': width,
      'height': height,
      'box_count': boxCount,
      'captions': captions,
    };
  }

  factory Memes.fromMap(Map<String, dynamic> map) {
    return Memes(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      boxCount: map['box_count'] != null ? map['box_count'] as int : null,
      captions: map['captions'] != null ? map['captions'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Memes.fromJson(String source) =>
      Memes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Memes(id: $id, name: $name, url: $url, width: $width, height: $height, box_count: $boxCount, captions: $captions)';
  }

  @override
  bool operator ==(covariant Memes other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.url == url &&
        other.width == width &&
        other.height == height &&
        other.boxCount == boxCount &&
        other.captions == captions;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        url.hashCode ^
        width.hashCode ^
        height.hashCode ^
        boxCount.hashCode ^
        captions.hashCode;
  }
}
