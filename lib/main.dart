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
  TextEditingController _a = TextEditingController();
  TextEditingController _b = TextEditingController();

  String _response = "Loading...";

  Future<void> _communicate() async {
    String response;

    try {
      response = await platform.invokeMethod(
          "calculate", {"a": _a.text.trim(), "b": _b.text.trim()});
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextFormField(
              controller: _a,
            ),
            TextFormField(
              controller: _b,
            ),
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
