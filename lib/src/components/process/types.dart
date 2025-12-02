enum AntProcessType { line, circle }

enum AntProcessStatus{
  success,
  exception,
  normal,
  active
}

enum AntPercentPositionAlign { start, center, end }
enum AntPercentPositionType { inner, outer }

enum AntStrokeLineCap { butt, round, square }

typedef Format = String Function(double percent);
