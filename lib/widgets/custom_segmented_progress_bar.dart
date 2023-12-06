import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomSegmentedProgressBar extends StatefulWidget {
  final int index;
  final int count;
  final Color? activeColor;
  final Color? unactiveColor;
  final EdgeInsets? padding;

  CustomSegmentedProgressBar(
      {Key? key,
      required this.count,
      required this.index,
      this.activeColor,
      this.unactiveColor,
      this.padding})
      : super(key: key);

  @override
  State<CustomSegmentedProgressBar> createState() =>
      _CustomSegmentedProgressBarState();
}

class _CustomSegmentedProgressBarState
    extends State<CustomSegmentedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.count,
            (currentIndex) => Expanded(child: _buildSegment(currentIndex)),
          ),
        ),
      ),
    );
  }

  Widget _buildSegment(int currentIndex) {
    Color color = (currentIndex <= widget.index)
        ? widget.activeColor ?? ThemeHelper().themeColor().gray20075
        : widget.unactiveColor ?? ThemeHelper().themeColor().gray800;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Container(
        width: 8.0, // Ширина сегмента
        height: 5.0, // Высота сегмента
        margin: EdgeInsets.symmetric(horizontal: 2.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
