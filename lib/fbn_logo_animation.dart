import 'package:flutter/material.dart';

class FBNLogoAnimation extends StatefulWidget {
  @override
  _FBNLogoAnimationState createState() => _FBNLogoAnimationState();
}

class _FBNLogoAnimationState extends State<FBNLogoAnimation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
      ),
      body: SafeArea(
        child: Center(
          child: TwoFlyingDots(),
        ),
      ),
    );
  }
}

class TwoFlyingDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FlyingDot(color: Colors.blue.shade900),
      FlyingDot(color: Colors.yellow, reverse: true)
    ]);
  }
}

class FlyingDot extends StatefulWidget {
  final Color color;
  final bool reverse;
  const FlyingDot({Key key, this.color, this.reverse}) : super(key: key);
  @override
  _FlyingDotState createState() => _FlyingDotState();
}

class _FlyingDotState extends State<FlyingDot>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _position;
  Animation<Offset> _position2;
  Animation<Offset> _position3;
  bool _reverse;
  double rangeX = 15.0;
  double rangeY = 0.0;
  @override
  void initState() {
    _reverse = widget.reverse ?? false;
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    Tween<Offset> start = _reverse
        ? Tween<Offset>(begin: Offset(-rangeX, 0), end: Offset(0, rangeY))
        : Tween<Offset>(begin: Offset(rangeX, 0), end: Offset(0, rangeY));
    Tween<Offset> middle = _reverse
        ? Tween<Offset>(begin: Offset(0, rangeY), end: Offset(rangeX, 0))
        : Tween<Offset>(begin: Offset(0, rangeY), end: Offset(-rangeX, 0));
    Tween<Offset> end = _reverse
        ? Tween<Offset>(begin: Offset(rangeX, 0), end: Offset(-rangeX, 0))
        : Tween<Offset>(begin: Offset(-rangeX, 0), end: Offset(rangeX, 0));
    _position = start.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.25),
      ),
    );
    _position2 = middle.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5),
      ),
    );
    _position3 = end.animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1),
      ),
    );
//run animation
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          Offset offset = Offset.zero;
          if (_controller.value <= 0.25) {
            offset = _position.value;
          } else if (_controller.value <= 0.5) {
            offset = _position2.value;
          } else {
            offset = _position3.value;
          }
          return Transform.translate(
              offset: offset,
              child: Icon(
                Icons.circle,
                color: widget.color,
                size: 30,
              ));
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
