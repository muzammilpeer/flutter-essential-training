import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  // widget variable
  Color buttonColor = Colors.red;

  CounterView({super.key, required this.buttonColor});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  // state variable
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter Value"),
            Text("$counter"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: widget.buttonColor,
                  onPressed: () {
                    print("Increment");
                    setState(() {
                      counter++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
