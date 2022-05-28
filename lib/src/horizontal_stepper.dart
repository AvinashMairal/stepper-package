import 'package:flutter/material.dart';

class HorizontalStepper extends StatefulWidget {
  final List<String> steps;
  final void Function(int value) onTap;
  final int? selectedStepperIndex;
  final Color? completedStepperColor;
  final Color? uncompletedStepperColor;
  final Color? currentStepperColor;
  final double? stepperTextFontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;

  const HorizontalStepper(
      {Key? key,
      required this.steps,
      required this.onTap,
      this.selectedStepperIndex,
      this.completedStepperColor,
      this.uncompletedStepperColor,
      this.stepperTextFontSize = 14,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.currentStepperColor})
      : super(key: key);

  @override
  _HorizontalStepperState createState() => _HorizontalStepperState();
}

class _HorizontalStepperState extends State<HorizontalStepper> {
  int _selectedStepperIndex = 0;
  double fontSize = 14;
  List<String> _steps = [];

  @override
  void initState() {
    _steps = widget.steps;
    super.initState();
  }

  _setStepperIndex() {
    if (widget.selectedStepperIndex != null &&
        widget.selectedStepperIndex! <= _steps.length) {
      _selectedStepperIndex = widget.selectedStepperIndex ?? 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    _setStepperIndex();
    return _steps.length > 1
        ? SizedBox(
            height: widget.stepperTextFontSize! > 24 ? 60 : 40,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: _steps.length,
                itemBuilder: (BuildContext context, int index) {
                  _counter = _counter + 1;
                  return _buidStepperItem(index, _counter);
                }),
          )
        : const SizedBox();
  }

  _buidStepperItem(int index, int counter) {
    return GestureDetector(
      onTap: () {
        widget.onTap(index);
        setState(() {
          _selectedStepperIndex = index;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _selectedStepperIndex > index
              ? Container(
                  decoration: BoxDecoration(
                    color: widget.completedStepperColor ?? Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2,
                        color: widget.completedStepperColor ?? Colors.blue),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                )
              : Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 4,
                        color: _selectedStepperIndex == index
                            ? widget.currentStepperColor ?? Colors.blue
                            : widget.uncompletedStepperColor ?? Colors.grey),
                  ),
                ),
          const SizedBox(width: 5),
          Text(
            _steps[index],
            style: TextStyle(
                fontSize: widget.stepperTextFontSize,
                fontWeight: widget.fontWeight ?? FontWeight.w400,
                fontStyle: widget.fontStyle ?? FontStyle.normal,
                fontFamily: widget.fontFamily,
                color: _selectedStepperIndex == index
                    ? widget.currentStepperColor ?? Colors.blue
                    : _selectedStepperIndex > index
                        ? widget.completedStepperColor ?? Colors.blue
                        : widget.uncompletedStepperColor ?? Colors.grey),
          ),
          if (counter != _steps.length)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                width: 50,
                height: 0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border(
                    bottom: BorderSide(
                        color: _selectedStepperIndex == index
                            ? widget.currentStepperColor ?? Colors.blue
                            : _selectedStepperIndex > index
                                ? widget.completedStepperColor ?? Colors.blue
                                : widget.uncompletedStepperColor ?? Colors.grey,
                        width: 1.0),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
