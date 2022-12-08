import 'package:flutter/material.dart';

class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({Key? key, required this.text, required this.icon, required this.btn})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback btn;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: InkWell(
        onTap: btn,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              Text(
                text,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
