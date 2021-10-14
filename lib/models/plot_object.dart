import 'dart:convert';

class PlotObject {
  num x;
  num y;
  PlotObject({
    required this.x,
    required this.y,
  });

  PlotObject copyWith({
    num? x,
    num? y,
  }) {
    return PlotObject(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'x': x,
      'y': y,
    };
  }

  factory PlotObject.fromMap(Map<String, dynamic> map) {
    return PlotObject(
      x: map['x'],
      y: map['y'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlotObject.fromJson(String source) =>
      PlotObject.fromMap(json.decode(source));

  @override
  String toString() => 'PlotObject(x: $x, y: $y)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlotObject && other.x == x && other.y == y;
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
