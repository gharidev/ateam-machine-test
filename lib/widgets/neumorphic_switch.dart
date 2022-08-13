// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

class CustomNeumorphicSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double switchWidth;
  final double toggleWidth;
  final double toggleHeight;

  CustomNeumorphicSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.switchWidth = 60.0,
    this.toggleWidth = 27.0,
    this.toggleHeight = 20.0,
  }) : super(key: key);

  @override
  _CustomNeumorphicSwitchState createState() => _CustomNeumorphicSwitchState();
}

class _CustomNeumorphicSwitchState extends State<CustomNeumorphicSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _switchAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _switchAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.switchWidth,
            // height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              // color: _switchAnimation!.value == Alignment.centerLeft
              //     ? Colors.grey
              //     : Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                ),
                BoxShadow(
                  color: Theme.of(context).backgroundColor,
                  spreadRadius: -7.0,
                  blurRadius: 12.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Stack(
                children: [
                  Container(
                    height: widget.toggleHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Align(
                      alignment: widget.value
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Text(
                        widget.value ? 'ON' : 'OFF',
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              widget.value ? Colors.red : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: _switchAnimation!.value,
                    child: Container(
                      width: widget.toggleWidth,
                      height: widget.toggleHeight,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: -1.0,
                            blurRadius: 1.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                      child: Center(
                        child: Container(
                          height: 10.0,
                          width: 1,
                          decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 0),
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,
                                    color: Colors.grey.shade400)
                              ],
                              borderRadius: BorderRadius.circular(3.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
