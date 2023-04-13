import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  static const platform = MethodChannel("com.edureka.demo/messages");
  String _response = "Loading...";

  Future<void> _communicate() async {
    String response;

    try {
      response = await platform.invokeMethod("calculate");
    } catch (e) {
      response = "Error - $e";
    }

    setState(() {
      _response = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(_response),
            ElevatedButton(
                onPressed: () {
                  _communicate();
                },
                child: const Text("Get message"))
          ]),
        ),
      ),
    );
  }
}
