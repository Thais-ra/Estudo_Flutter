import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'memory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text('Calculadora da Barbie'),
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          Divider(height: 0.1),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                _memory.result,
                minFontSize: 20.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label,
      {int flex = 1,
      Color textColor = Colors.white,
      Color backgroundColor = Colors.black}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: backgroundColor,
        textColor: textColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        onPressed: () {
          setState(() {
            _memory.applyCommand(label);
          });
        },
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.pink[200],
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', textColor: Colors.purpleAccent),
                _buildKeyboardButton('DEL', textColor: Colors.purpleAccent),
                _buildKeyboardButton('%', textColor: Colors.purpleAccent),
                _buildKeyboardButton('÷', textColor: Colors.purpleAccent),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7', textColor: Colors.pink[600]),
                _buildKeyboardButton('8', textColor: Colors.pink[600]),
                _buildKeyboardButton('9', textColor: Colors.pink[600]),
                _buildKeyboardButton('x', textColor: Colors.purpleAccent),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4', textColor: Colors.pink[600]),
                _buildKeyboardButton('5', textColor: Colors.pink[600]),
                _buildKeyboardButton('6', textColor: Colors.pink[600]),
                _buildKeyboardButton('+', textColor: Colors.purpleAccent),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1', textColor: Colors.pink[600]),
                _buildKeyboardButton('2', textColor: Colors.pink[600]),
                _buildKeyboardButton('3', textColor: Colors.pink[600]),
                _buildKeyboardButton('-', textColor: Colors.purpleAccent),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0', flex: 2, textColor: Colors.pink[800]),
                _buildKeyboardButton('.', textColor: Colors.pink[800]),
                _buildKeyboardButton('=', textColor: Colors.purpleAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
