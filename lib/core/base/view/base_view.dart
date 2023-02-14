import 'package:flutter/material.dart';
import 'package:pomodofocus/core/constants/color/color_constants.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context) onPageBuilder;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.onPageBuilder,
      this.onDispose})
      : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
   
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.instance.whiteColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: widget.onPageBuilder(context),
      ),
    );
  }
}
