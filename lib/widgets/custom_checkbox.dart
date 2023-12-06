import 'package:financial_assistant/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    key,
    required this.title,
    this.width = 24.0,
    this.height = 56.0,
    this.color,
    this.iconSize = 24.0,
    this.onChanged,
    this.checkColor,  this.isChecked = false,
  });

  final String title;
  final double width;
  final double height;
  final Color? color;
   final bool isChecked;
  final double? iconSize;
  final Color? checkColor;
  final void Function(bool?)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {

  late final _theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
      child: Container(
        height: widget.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.isChecked
              ? _theme.colorScheme.primary
              : _theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(40),
        ),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          customBorder: Border(
            bottom: BorderSide(color: _theme.dividerColor),
          ),
          onTap: () {
          //  setState(() => widget.isChecked = !widget.isChecked);
            widget.onChanged?.call(widget.isChecked);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                style: _theme.textTheme.titleMedium?.copyWith(
                  color: widget.isChecked
                      ? _theme.colorScheme.onSurface
                      : _theme.colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
