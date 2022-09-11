import 'package:dit_app/utils/globals.dart';
import 'package:flutter/material.dart';

class TaskBox extends StatefulWidget {
  final String value;
  final bool isChecked;

  const TaskBox({
    super.key,
    this.value = '',
    required this.isChecked,
  });

  @override
  State<StatefulWidget> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  var isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked == true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Globals.borderRadius),
        child: Container(
          height: Globals.taskHeight,
          color: Theme.of(context).primaryColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(Globals.borderRadius),
            onTap: () => {
              _onCheckChanged(),
            },
            child: Row(
              children: [
                _buildCheckbox(context),
                _buildLabel(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        fillColor: Theme.of(context).checkboxTheme.fillColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Globals.borderRadius),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
        ),
        value: isChecked,
        onChanged: (v) => _onCheckChanged(),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.value,
        style: isChecked
            ? Theme.of(context).textTheme.headline6
            : Theme.of(context).textTheme.headline5,
      ),
    );
  }

  _onCheckChanged() {
    setState(() {
      isChecked = !isChecked;
    });
  }
}
