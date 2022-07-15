import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignTasksPopUP extends StatefulWidget {
  const AssignTasksPopUP({Key? key}) : super(key: key);

  @override
  State<AssignTasksPopUP> createState() => _AssignTasksPopUPState();
}

class _AssignTasksPopUPState extends State<AssignTasksPopUP> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Assign Tasks'),
      content: Text('df'),
    );
  }
}
