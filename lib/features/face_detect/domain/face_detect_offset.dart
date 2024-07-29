class FaceDetectOffset {
  final double x;
  final double y;
  final double w;
  final double h;

  FaceDetectOffset(this.x, this.y, this.w, this.h);

  factory FaceDetectOffset.fromJson(Map<String, dynamic> json) {
    return FaceDetectOffset(
      double.tryParse(json['x'].toString()) ?? 0,
      double.tryParse(json['y'].toString()) ?? 0,
      double.tryParse(json['w'].toString()) ?? 0,
      double.tryParse(json['h'].toString()) ?? 0,
    );
  }
}