enum AntProgressType { line, circle }

enum AntProgressStatus{
  success,
  exception,
  normal,
  active
}

enum AntPercentPositionAlign { start, center, end }
enum AntPercentPositionType { inner, outer }

enum AntStrokeLineCap { butt, round, square }

typedef Format = String Function(double percent);
