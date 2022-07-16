import 'package:flutter/material.dart';

class TableView extends StatelessWidget {
  final Function onTap;
  const TableView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white),
          child: Center(
              child: Row(
            children: const [
              Icon(Icons.table_chart_outlined),
              SizedBox(width: 10),
              Text(
                'Table view',
                style: TextStyle(fontSize: 12),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
