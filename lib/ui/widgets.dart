export 'brand.dart';
export 'mascot.dart';
export 'line_icons.dart';

import 'package:flutter/material.dart';
import '../core/theme/tokens.dart';
import 'line_icons.dart';

class VoxelithCard extends StatelessWidget {
  const VoxelithCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.onTap,
  });
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // Koyu temada gölge okunmaz (siyah zemin üstünde siyah gölge görünmez),
    // o yüzden yalnızca açık/bal temalarda gölgeyle "kaldırılmış" his
    // veriyoruz — düz kenarlıklı kartların "basit" görünmesinin sebebiydi.
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final box = Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Voxelith.radius),
        border: Border.all(
          color: Theme.of(
            context,
          ).dividerColor.withValues(alpha: isDark ? 1 : .5),
        ),
        boxShadow: isDark ? null : Voxelith.softShadow,
      ),
      child: child,
    );
    if (onTap == null) return box;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Voxelith.radius),
        child: box,
      ),
    );
  }
}

class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.color = Voxelith.terr});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: 1.1,
        color: color,
      ),
    );
  }
}

class ChoiceTile extends StatefulWidget {
  const ChoiceTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.selected,
    required this.onTap,
    this.leading,
  });

  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;
  final Widget? leading;

  @override
  State<ChoiceTile> createState() => _ChoiceTileState();
}

class _ChoiceTileState extends State<ChoiceTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapCancel: () => setState(() => _pressed = false),
        onTapUp: (_) => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.97 : 1,
          duration: const Duration(milliseconds: 120),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(Voxelith.radius),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: widget.selected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Voxelith.radius),
                border: Border.all(
                  color: widget.selected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).dividerColor,
                  width: widget.selected ? 1.6 : 1,
                ),
              ),
              child: Row(
                children: [
                  if (widget.leading != null) ...[
                    widget.leading!,
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.subtitle!,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (widget.selected)
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Dolgulu ikon rozeti. Verilirse `color`/`background` kullanılır (sabit
/// marka rengi gereken yerler için, ör. seri/alfabe ikonları); verilmezse
/// aktif temanın primaryContainer'ına düşer, böylece her temada (Efsane
/// dahil) otomatik tutarlı kalır.
class IconChip extends StatelessWidget {
  const IconChip(
    this.icon, {
    super.key,
    this.color,
    this.background,
    this.size = 38,
  });
  final VoxelithIcon icon;
  final Color? color;
  final Color? background;
  final double size;

  @override
  Widget build(BuildContext context) {
    final grad = icon.gradient;
    final flat = background ?? color?.withValues(alpha: 0.15);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: flat == null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: grad,
              )
            : null,
        color: flat,
        borderRadius: BorderRadius.circular(size * 0.32),
        boxShadow: flat == null
            ? [
                BoxShadow(
                  color: grad.last.withValues(alpha: 0.4),
                  blurRadius: size * 0.4,
                  offset: Offset(0, size * 0.18),
                ),
              ]
            : null,
      ),
      child: VoxelithLineIcon(
        icon,
        size: size * 0.5,
        color: flat == null ? Colors.white : color,
      ),
    );
  }
}

class ForestButton extends StatelessWidget {
  const ForestButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: onPressed, child: Text(label));
  }
}
