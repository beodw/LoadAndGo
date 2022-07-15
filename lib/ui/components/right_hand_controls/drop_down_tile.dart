import 'package:flutter/material.dart';

class DropDownTile extends StatelessWidget {
  final bool selected;
  final String? text;
  final String? merchant;
  final String? recipient;
  final Function onTap;
  final Widget? leadingIcon;

  const DropDownTile(
      {Key? key,
      required this.selected,
      required this.text,
      required this.onTap,
      this.merchant,
      this.leadingIcon,
      this.recipient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon ??
          Container(
            child: selected
                ? const Center(
                    child: Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
                : null,
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: selected ? Colors.cyan : Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.cyan, width: 1),
            ),
          ),
      title: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (merchant != null)
                Text(
                  merchant ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              Text(
                text ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ]),
      ),
      subtitle: Text(recipient ?? 'No recipient'),
      onTap: () => onTap(),
    );
  }
}
