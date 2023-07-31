import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.refresh});

  final VoidCallback? refresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, false),
        ),
        elevation: 0,
        title: const Text('ошибка'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            'что-то пошло не так',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 20,),
          MaterialButton(
            color: Colors.lightBlueAccent,
              shape: const StadiumBorder(),
              onPressed: refresh,
              child: const Text('обновить'))
        ]),
      ),
    );
  }
}
