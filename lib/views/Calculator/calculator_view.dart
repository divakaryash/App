import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});


  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState(){
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
    //late final AppLifecycleListener _listener;

    //_listener = AppLifecycleListener(
      //onShow: _onShow,
      // onHide: _onHide,
      // onResume: _onResume,
      // onDetach: _onDetach,
      // onInactive: _onInactive,
      // onPause: _onPause,
      // onRestart: _onRestart,
      // onStateChange: _onStateChange,
      // onExitRequested: _onExitRequested,
    //);
  }
//void _onShow() = print("onShow called");


  @override
  void disposed(){
    displayOneController.dispose();
    displayTwoController.dispose();
    //_listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          //calc display
          CalculatorDisplay(
            hint: "Enter First Number", controller: displayOneController,
          ),
          const SizedBox(
            height: 30,
          ),
          CalculatorDisplay(
            hint: "Enter Second Number", controller: displayTwoController,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
              z.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold,),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayOneController.text)! +
                        num.tryParse(displayTwoController.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.add)
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! -
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.minus)
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! *
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      z = num.tryParse(displayOneController.text)! /
                          num.tryParse(displayTwoController.text)!;
                    });
                  },
                  child: const Icon(CupertinoIcons.divide)
              ),
            ],
          ),
          const SizedBox(height: 10,
          ),
          FloatingActionButton.extended(
              onPressed:(){
                setState(() {
                  x=0;
                  y=0;
                  z=0;
                  displayOneController.clear();
                  displayTwoController.clear();
                });
          }, label: const Text("Clear"),)
          //expand
          //calc button
        ],
      ),
    );
}
}
class CalculatorDisplay extends StatelessWidget{
  const CalculatorDisplay({super.key, this.hint = "Enter a Number", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3.0
    ),
    borderRadius: BorderRadius.circular(10),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
          color: Colors.black,
          width: 3.0
    ),
    borderRadius: BorderRadius.circular(10),
    ),
    hintText: "Enter a number",
    hintStyle: const TextStyle(
      color: Colors.black,
    )
    ));
  }
}
