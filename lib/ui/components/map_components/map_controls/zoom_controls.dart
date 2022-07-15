import 'package:flutter/material.dart';

class ZoomControls extends StatefulWidget {
  final Function zoomInFunc;
  final Function zoomOutFunc;
  const ZoomControls(
      {Key? key, required this.zoomInFunc, required this.zoomOutFunc})
      : super(key: key);

  @override
  State<ZoomControls> createState() => _ZoomControlsState();
}

class _ZoomControlsState extends State<ZoomControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 30,
              child: TextButton(
                onPressed: () => widget.zoomInFunc(),
                child: const Icon(
                  Icons.add_sharp,
                  size: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              width: 30,
              child: TextButton(
                onPressed: () => widget.zoomOutFunc(),
                child: const Icon(
                  Icons.remove_sharp,
                  size: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
