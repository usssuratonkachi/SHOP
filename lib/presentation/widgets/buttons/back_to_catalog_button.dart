import 'package:flutter/material.dart';

class BackToCatalogButton extends StatelessWidget {
  const BackToCatalogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 30,
      child: MaterialButton(
          shape: const StadiumBorder(),
          color: Colors.blue[200],
          splashColor: Colors.blue[200],
          highlightColor: Colors.blue[200],
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: const Text(
            'в каталог',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () => Navigator.pop(context, false)),
    );
  }
}
