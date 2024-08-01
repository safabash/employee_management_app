import 'package:employee_management_app/shared/constants/button_states.dart';
import 'package:employee_management_app/shared/theme/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:multi_state_button/multi_state_button.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    required super.key,
    required this.controller,
    required this.text,
    this.enabled = true,
    this.isOutLined = false,
    this.height,
    this.width,
    this.color,
    this.padding,
    this.onPressed,
    this.textColor,
    this.borderRadius,
    this.borderColor,
  });

  final MultiStateButtonController controller;
  final String text;
  final bool enabled;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final bool isOutLined;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final void Function()? onPressed;
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;
    return MultiStateButton(
      key: ValueKey(widget.key.hashCode.toString()),
      multiStateButtonController: widget.controller,
      buttonStates: [
        //submit state
        ButtonState(
          stateName: submit,
          child: FittedBox(
            child: Text(
              widget.text,
              style: getBoldStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: widget.isOutLined
                ? Border.all(
                    color: widget.borderColor ?? theme.primary,
                  )
                : null,
            color: widget.isOutLined
                ? null
                : widget.enabled
                    ? (widget.color ?? theme.primary)
                    : widget.color ?? theme.primary.withOpacity(.3),
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 10.r,
            ),
          ),
          textStyle: getBoldStyle(color: theme.tertiary, fontSize: 15.sp),
          size: Size(widget.width ?? size.width * .76, widget.height ?? 45.h),
          color: widget.color ?? theme.primary,
          onPressed: widget.enabled ? widget.onPressed : null,
        ),
        //loading state
        ButtonState(
          stateName: loading,
          child: const CircularProgressIndicator.adaptive(),
          decoration: BoxDecoration(
            border: widget.isOutLined
                ? Border.all(
                    color: theme.primary,
                  )
                : null,
            color: widget.isOutLined
                ? null
                : widget.color ?? theme.primary.withOpacity(.5),
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 10.r,
            ),
          ),
          textStyle: getBoldStyle(color: theme.tertiary, fontSize: 15.sp),
          size: Size(widget.width ?? size.width * .76, widget.height ?? 50.h),
          color: widget.color ?? theme.primary,
          // onPressed: widget.onPressed ?? () {},
        ),

        //success button
        ButtonState(
          stateName: success,
          child: Container(),
          decoration: BoxDecoration(
            border: widget.isOutLined
                ? Border.all(
                    color: theme.primary,
                  )
                : null,
            color: widget.isOutLined ? null : widget.color ?? theme.primary,
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? 10.r,
            ),
          ),
          textStyle: getBoldStyle(color: theme.tertiary, fontSize: 15.sp),
          size: Size(widget.width ?? size.width * .76, widget.height ?? 50.h),
          color: widget.color ?? theme.primary,
          // onPressed: widget.onPressed ?? () {},
        ),
        //dim state
        ButtonState(
          stateName: dim,
          child: Container(),
          decoration: BoxDecoration(
            color: widget.color ?? theme.primary,
            borderRadius: BorderRadius.all(Radius.circular(48.r)),
          ),
          size: Size.zero,
          onPressed: () {},
        ),
      ],
    );
  }
}
