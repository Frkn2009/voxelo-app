import 'package:flutter/material.dart';

import '../../core/theme/editorial_theme.dart';
import '../../core/theme/tokens.dart';

/// A scrollable paper page with bounded reading width and deterministic grain.
class EditorialPage extends StatelessWidget {
  const EditorialPage({
    super.key,
    required this.children,
    required this.textDirection,
  });
  final List<Widget> children;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) => Theme(
    data: EditorialTheme.light,
    child: Directionality(
      textDirection: textDirection,
      child: Scaffold(
        body: CustomPaint(
          painter: const _PaperGrain(),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: ListView(
                  padding: const EdgeInsets.all(VoxelithTokens.padLarge),
                  children: children,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _PaperGrain extends CustomPainter {
  const _PaperGrain();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = VoxelithTokens.editorialInk.withValues(alpha: 0.045);
    for (double y = 4; y < size.height; y += 9) {
      for (double x = 4; x < size.width; x += 9) {
        canvas.drawCircle(Offset(x + (y.toInt() % 3), y), 0.45, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_PaperGrain oldDelegate) => false;
}

class EditorialButton extends StatelessWidget {
  const EditorialButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      gradient: VoxelithTokens.editorialCtaGradient,
      borderRadius: BorderRadius.circular(VoxelithTokens.radiusSmall),
    ),
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        foregroundColor: VoxelithTokens.editorialOnAccent,
        disabledForegroundColor: VoxelithTokens.editorialOnAccent,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(VoxelithTokens.radiusSmall),
        ),
      ),
      child: Text(label, textAlign: TextAlign.center),
    ),
  );
}

/// Original open-page motif; it also reads as two speech marks.
class EditorialMark extends StatelessWidget {
  const EditorialMark({super.key, this.celebrate = false});
  final bool celebrate;
  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: SizedBox(
      height: 152,
      child: CustomPaint(painter: _MarkPainter(celebrate)),
    ),
  );
}

class _MarkPainter extends CustomPainter {
  const _MarkPainter(this.celebrate);
  final bool celebrate;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = VoxelithTokens.editorialAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    for (final sign in [-1.0, 1.0]) {
      final page = Path()
        ..moveTo(center.dx, center.dy + 34)
        ..quadraticBezierTo(
          center.dx + sign * 20,
          center.dy + 14,
          center.dx + sign * 48,
          center.dy + 20,
        )
        ..lineTo(center.dx + sign * 48, center.dy - 34)
        ..quadraticBezierTo(
          center.dx + sign * 16,
          center.dy - 42,
          center.dx,
          center.dy - 14,
        )
        ..close();
      canvas.drawPath(page, paint);
    }
    if (celebrate) {
      for (final offset in [
        const Offset(-68, -36),
        const Offset(64, -44),
        const Offset(0, -60),
      ]) {
        final point = center + offset;
        canvas.drawLine(
          point - const Offset(4, 0),
          point + const Offset(4, 0),
          paint,
        );
        canvas.drawLine(
          point - const Offset(0, 4),
          point + const Offset(0, 4),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_MarkPainter oldDelegate) =>
      oldDelegate.celebrate != celebrate;
}
