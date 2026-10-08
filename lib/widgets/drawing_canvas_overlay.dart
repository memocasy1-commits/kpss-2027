import 'package:flutter/material.dart';

class StrokeLine {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;
  final bool isHighlighter;

  StrokeLine({
    required this.points,
    required this.color,
    required this.strokeWidth,
    this.isHighlighter = false,
  });
}

class DrawingCanvasPainter extends CustomPainter {
  final List<StrokeLine> strokes;
  final StrokeLine? currentStroke;

  DrawingCanvasPainter({
    required this.strokes,
    this.currentStroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      _paintStroke(canvas, stroke);
    }
    if (currentStroke != null) {
      _paintStroke(canvas, currentStroke!);
    }
  }

  void _paintStroke(Canvas canvas, StrokeLine stroke) {
    if (stroke.points.isEmpty) return;

    final paint = Paint()
      ..color = stroke.isHighlighter
          ? stroke.color.withValues(alpha: 0.38)
          : stroke.color
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = stroke.strokeWidth
      ..style = PaintingStyle.stroke;

    if (stroke.points.length == 1) {
      canvas.drawCircle(stroke.points.first, stroke.strokeWidth / 2, paint);
      return;
    }

    final path = Path();
    path.moveTo(stroke.points.first.dx, stroke.points.first.dy);
    for (int i = 1; i < stroke.points.length; i++) {
      path.lineTo(stroke.points[i].dx, stroke.points[i].dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant DrawingCanvasPainter oldDelegate) => true;
}

class DrawingCanvasOverlay extends StatefulWidget {
  final VoidCallback onClose;
  final bool isDark;

  const DrawingCanvasOverlay({
    super.key,
    required this.onClose,
    required this.isDark,
  });

  @override
  State<DrawingCanvasOverlay> createState() => _DrawingCanvasOverlayState();
}

class _DrawingCanvasOverlayState extends State<DrawingCanvasOverlay> {
  final List<StrokeLine> _strokes = [];
  StrokeLine? _currentStroke;

  Color _selectedColor = const Color(0xFFEF4444); // Default red
  final double _selectedWidth = 3.5;
  bool _isHighlighter = false;
  bool _isEraser = false;

  final List<Color> _palette = [
    const Color(0xFFEF4444), // Red
    const Color(0xFF3B82F6), // Blue
    const Color(0xFF10B981), // Green
    const Color(0xFFF59E0B), // Amber
    const Color(0xFF8B5CF6), // Purple
    Colors.white,
  ];

  @override
  Widget build(BuildContext context) {
    final panelBg = widget.isDark ? const Color(0xFF1E293B) : Colors.white;
    final borderColor = widget.isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1);

    return Stack(
      children: [
        // 1. Canvas Çizim Alanı (Yarı saydam arkaplan)
        Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: widget.isDark ? 0.15 : 0.05),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onPanStart: (details) {
                final pos = details.localPosition;
                if (_isEraser) {
                  _eraseAt(pos);
                } else {
                  setState(() {
                    _currentStroke = StrokeLine(
                      points: [pos],
                      color: _selectedColor,
                      strokeWidth: _isHighlighter ? 18.0 : _selectedWidth,
                      isHighlighter: _isHighlighter,
                    );
                  });
                }
              },
              onPanUpdate: (details) {
                final pos = details.localPosition;
                if (_isEraser) {
                  _eraseAt(pos);
                } else if (_currentStroke != null) {
                  setState(() {
                    _currentStroke!.points.add(pos);
                  });
                }
              },
              onPanEnd: (_) {
                if (_currentStroke != null) {
                  setState(() {
                    _strokes.add(_currentStroke!);
                    _currentStroke = null;
                  });
                }
              },
              child: CustomPaint(
                painter: DrawingCanvasPainter(
                  strokes: _strokes,
                  currentStroke: _currentStroke,
                ),
              ),
            ),
          ),
        ),

        // 2. Alt/Üst Çizim Araç Çubuğu (Toolbar)
        Positioned(
          top: 12,
          left: 16,
          right: 16,
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: panelBg.withValues(alpha: 0.94),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: borderColor, width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Kalem Modu
                  _buildToolButton(
                    icon: Icons.edit_rounded,
                    tooltip: 'İnce Kalem',
                    isActive: !_isEraser && !_isHighlighter,
                    onTap: () {
                      setState(() {
                        _isEraser = false;
                        _isHighlighter = false;
                      });
                    },
                  ),
                  const SizedBox(width: 4),

                  // Fosforlu Kalem Modu
                  _buildToolButton(
                    icon: Icons.border_color_rounded,
                    tooltip: 'Fosforlu Kalem',
                    isActive: _isHighlighter && !_isEraser,
                    onTap: () {
                      setState(() {
                        _isEraser = false;
                        _isHighlighter = true;
                      });
                    },
                  ),
                  const SizedBox(width: 4),

                  // Silgi Modu
                  _buildToolButton(
                    icon: Icons.auto_fix_normal_rounded,
                    tooltip: 'Çizgi Silgisi',
                    isActive: _isEraser,
                    onTap: () {
                      setState(() {
                        _isEraser = true;
                      });
                    },
                  ),
                  const SizedBox(width: 6),

                  // Dikey Çizgi Ayırıcı
                  Container(width: 1, height: 24, color: borderColor),
                  const SizedBox(width: 6),

                  // Renk Paleti (Kalem modundayken)
                  if (!_isEraser)
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _palette.map((color) {
                            final isSel = _selectedColor == color;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color;
                                  _isEraser = false;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                width: isSel ? 24 : 20,
                                height: isSel ? 24 : 20,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSel ? Colors.amber : Colors.grey.shade400,
                                    width: isSel ? 2.5 : 1,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    )
                  else
                    const Expanded(
                      child: Text(
                        'Silmek istediğiniz çizginin üzerine dokunun',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                  const SizedBox(width: 4),
                  // Geri Al (Undo)
                  IconButton(
                    icon: const Icon(Icons.undo_rounded, size: 20),
                    tooltip: 'Son Çizgiyi Geri Al',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                    onPressed: _strokes.isNotEmpty
                        ? () {
                            setState(() {
                              _strokes.removeLast();
                            });
                          }
                        : null,
                  ),

                  // Temizle (Clear All)
                  IconButton(
                    icon: const Icon(Icons.delete_sweep_rounded, size: 20, color: Colors.redAccent),
                    tooltip: 'Tüm Karalamayı Temizle',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                    onPressed: _strokes.isNotEmpty
                        ? () {
                            setState(() {
                              _strokes.clear();
                            });
                          }
                        : null,
                  ),

                  // Kapat (Close)
                  IconButton(
                    icon: const Icon(Icons.close_rounded, size: 22),
                    tooltip: 'Karalama Modunu Kapat',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                    onPressed: widget.onClose,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _eraseAt(Offset pos) {
    setState(() {
      _strokes.removeWhere((stroke) {
        return stroke.points.any((pt) => (pt - pos).distance < 22.0);
      });
    });
  }

  Widget _buildToolButton({
    required IconData icon,
    required String tooltip,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2563EB) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 19,
            color: isActive ? Colors.white : (widget.isDark ? Colors.white70 : Colors.black87),
          ),
        ),
      ),
    );
  }
}
