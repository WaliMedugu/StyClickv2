import 'package:flutter/material.dart';
import 'package:stylclick/shared/utils/helpers.dart';

class ActionBottomSheet extends StatelessWidget {
  const ActionBottomSheet(
      {Key? key,
      this.title,
      this.description,
      this.descriptionAction,
      this.warning,
      this.action1,
      this.action2,
      this.onTapAction1,
      this.onTapAction2,
      this.widget,
      this.children})
      : super(key: key);
  final String? title;
  final String? description;
  final String? descriptionAction;
  final String? warning;
  final String? action1;
  final String? action2;
  final Function()? onTapAction1;
  final Function()? onTapAction2;
  final Widget? widget;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children!),
      ),
      onClosing: () => Navigator.pop(context),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet(
      {Key? key,
      this.title,
      this.description,
      this.descriptionAction,
      this.warning,
      this.action1,
      this.action2,
      this.onTapAction1,
      this.onTapAction2,
      this.widget,
      required this.height,
      this.children})
      : super(key: key);
  final String? title;
  final double height;
  final String? description;
  final String? descriptionAction;
  final String? warning;
  final String? action1;
  final String? action2;
  final Function()? onTapAction1;
  final Function()? onTapAction2;
  final Widget? widget;
  final List<Widget>? children;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: deviceWidth(context),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: Scaffold(
          body: BottomSheet(
            enableDrag: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: ListView(
                  // mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children!),
            ),
            onClosing: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
