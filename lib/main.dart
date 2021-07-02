import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _cpfFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  // TextEditingController _cpfController =
      // TextEditingController(text: "123.456.789-00");
  TextEditingController _passwordController = TextEditingController();

  void _updateText(String newText) {
    setState(() {
      text = newText;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      _cpfController = TextEditingController(text: "123.456.789-00");
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   text,
            //   style: TextStyle(
            //     fontSize: 30.0,
            //     color: Colors.black,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _cpfFocusNode,
                controller: _cpfController,
                textInputAction: TextInputAction.next,
                onChanged: (value) => _updateText(value),
                autocorrect: false,
                cursorColor: Colors.red,
                cursorHeight: 16.0,
                cursorRadius: Radius.circular(90),
                cursorWidth: 16.0,
                obscureText: false,
                enabled: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _emailFocusNode,
                controller: _emailController,
                textInputAction: TextInputAction.next,
                onChanged: (value) => _updateText(value),
                autocorrect: false,
                cursorColor: Colors.red,
                cursorHeight: 16.0,
                cursorRadius: Radius.circular(90),
                cursorWidth: 16.0,
                obscureText: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                focusNode: _passwordFocusNode,
                controller: _passwordController,
                onChanged: (value) => _updateText(value),
                autocorrect: false,
                cursorColor: Colors.red,
                cursorHeight: 16.0,
                cursorRadius: Radius.circular(90),
                cursorWidth: 16.0,
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _emailFocusNode.requestFocus();
              },
              child: Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
