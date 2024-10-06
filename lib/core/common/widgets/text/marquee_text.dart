import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double velocity;

  MarqueeText({
    required this.text,
    this.style,
    this.velocity = 100.0, // pixels per second
  });

  @override
  _CustomMarqueeState createState() => _CustomMarqueeState();
}

class _CustomMarqueeState extends State<MarqueeText> with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  late double _textWidth;
  late double _screenWidth;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    _textWidth = _scrollController.position.maxScrollExtent + MediaQuery.of(context).size.width;
    _screenWidth = MediaQuery.of(context).size.width;

    final double durationSeconds = _textWidth / widget.velocity;
    _animationController.duration = Duration(seconds: durationSeconds.toInt());
    _animationController.repeat();

    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: durationSeconds.toInt()),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Text(
            widget.text,
            style: widget.style,
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}
