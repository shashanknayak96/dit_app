import 'package:flutter/material.dart';

import '../model/task.dart';
import '../utils/globals.dart';

class TaskBox extends StatefulWidget {
  final String id;
  final String value;
  final bool isChecked;
  final Function onChanged;

  const TaskBox({
    super.key,
    required this.id,
    this.value = '',
    required this.isChecked,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Globals.borderRadius),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: Globals.taskHeight),
          child: Container(
            // height: Globals.taskHeight,
            color: Theme.of(context).primaryColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(Globals.borderRadius),
              onTap: () => {
                ToggleCheckbox(widget.id),
              },
              child: Row(
                children: [
                  _buildCheckbox(context),
                  Expanded(
                    child: _buildLabel(context),
                  ),
                ],
              ),
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
        value: widget.isChecked,
        onChanged: (v) => ToggleCheckbox(widget.id),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        widget.value,
        maxLines: null,
        style: widget.isChecked
            ? Theme.of(context).textTheme.headline4
            : Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
