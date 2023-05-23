// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coordinate {
  final double x;
  final double y;
  final double z;

  Coordinate({
    required this.x,
    required this.y,
    required this.z,
  });
  

  Coordinate copyWith({
    double? x,
    double? y,
    double? z,
  }) {
    return Coordinate(
      x: x ?? this.x,
      y: y ?? this.y,
      z: z ?? this.z,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': x,
      'y': y,
      'z': z,
    };
  }

  factory Coordinate.fromMap(Map<String, dynamic> map) {
    return Coordinate(
      x: map['x'] as double,
      y: map['y'] as double,
      z: map['z'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinate.fromJson(String source) => Coordinate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coordinate(x: $x, y: $y, z: $z)';

  @override
  bool operator ==(covariant Coordinate other) {
    if (identical(this, other)) return true;
  
    return 
      other.x == x &&
      other.y == y &&
      other.z == z;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ z.hashCode;
}
