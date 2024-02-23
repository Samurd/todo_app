import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class DialogNewTask extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSave;
  DialogNewTask({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: TextFormField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: "Name"),
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        ),
        FilledButton(onPressed: onSave, child: Text("Save"))
      ],
    );
  }
}
